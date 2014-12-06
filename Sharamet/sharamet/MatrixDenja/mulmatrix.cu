#include <stdio.h>

#define BLOCK_SIZE  5          // submatrix size 
__global__ void matMult ( int * a, int * b, int n, int * c )
{
    int bx = blockIdx.x;        // block index
    int by = blockIdx.y;

    int tx = threadIdx.x;       // thread index
    int ty = threadIdx.y;
    
                                // Index of the first sub-matrix of A processed by the block
    int aBegin = n * BLOCK_SIZE * by;
    int aEnd = aBegin + n - 1;
                                // Step size used to iterate through the sub-matrices of A
    int aStep = BLOCK_SIZE;
                                // Index of the first sub-matrix of B processed by the block
    int bBegin = BLOCK_SIZE * bx;
                                // Step size used to iterate through the sub-matrices of B
    int bStep = BLOCK_SIZE * n;
    int sum = 0;           // computed subelement
    
    for ( int ia = aBegin, ib = bBegin; ia <= aEnd; ia += aStep, ib += bStep )
    {
                            // Shared memory for the sub-matrix of A
        __shared__ int as [BLOCK_SIZE][BLOCK_SIZE];
                            // Shared memory for the sub-matrix of B
        __shared__ int bs [BLOCK_SIZE][BLOCK_SIZE];
        
                            // Load the matrices from global memory to shared memory;
        as [ty][tx] = a [ia + n * ty + tx];
        bs [ty][tx] = b [ib + n * ty + tx];
        
        __syncthreads();    // Synchronize to make sure the matrices are loaded
        
                            // Multiply the two matrices together;
        for ( int k = 0; k < BLOCK_SIZE; k++ )
            sum += as [ty][k] * bs [k][tx];
            
                            // Synchronize to make sure that the preceding
                            // computation is done before loading two new
                            // sub-matrices of A and B in the next iteration
        __syncthreads();
    }
    
                            // Write the block sub-matrix to global memory;
                            // each thread writes one element
    int ic = n * BLOCK_SIZE * by + BLOCK_SIZE * bx;
    
    c [ic + n * ty + tx] = sum;
}

int main ( int argc, char *  argv [] )
{
    int N=10;
    int numBytes = N * N * sizeof ( int );

                    // allocate host memory
    int * a = new int [N*N];
    int * b = new int [N*N];
    int * c = new int [N*N];
    
    for ( int i = 0; i < N; i++ )
        for ( int j = 0; j < N; j++ )
        {
            a [N*i+j] = 1;
            b [N*i+j] = 1;
        }
        
                    // allocate device memory
    int * adev = NULL;
    int * bdev = NULL;
    int * cdev = NULL;
    
    cudaMalloc ( (void**)&adev, numBytes );
    cudaMalloc ( (void**)&bdev, numBytes );
    cudaMalloc ( (void**)&cdev, numBytes );

                    // set kernel launch configuration
    dim3 threads ( BLOCK_SIZE, BLOCK_SIZE );
    dim3 blocks  ( N / threads.x, N / threads.y);

                    // create cuda event handles
    cudaEvent_t start, stop;
    float gpuTime = 0.0f;

    cudaEventCreate ( &start );
    cudaEventCreate ( &stop );
    
                    // asynchronously issue work to the GPU (all to stream 0)
    cudaEventRecord ( start, 0 );
    cudaMemcpy      ( adev, a, numBytes, cudaMemcpyHostToDevice );
    cudaMemcpy      ( bdev, b, numBytes, cudaMemcpyHostToDevice );
    
    matMult<<<blocks, threads>>> ( adev, bdev, N, cdev );
    
    cudaMemcpy      ( c, cdev, numBytes, cudaMemcpyDeviceToHost );
    cudaEventRecord ( stop, 0 );

    cudaEventSynchronize ( stop );
    cudaEventElapsedTime ( &gpuTime, start, stop );
 
	for(int i=0;i<N;i++)
		{
		for(int j=0;j<N;j++)
			printf("%d ",c[i]);			

	printf("\n");
	}
                        // print the cpu and gpu times
    printf("time spent executing by the GPU: %.2f millseconds\n", gpuTime );
   
                    // release resources
    cudaEventDestroy ( start );
    cudaEventDestroy ( stop  );
    cudaFree         ( adev  );
    cudaFree         ( bdev  );
    cudaFree         ( cdev  );

    delete a;
    delete b;
    delete c;

    return 0;
}
