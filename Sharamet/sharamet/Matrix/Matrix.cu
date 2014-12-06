#include <stdio.h>
#include <cuda.h>

__global__ void initA(int *A, int numElements) {
	 i = blockDim.x * blockIdx.x + threadIdx.x;
	int j = blockDim.y * blockIdx.y + threadIdx.y;
	if (i < numElements && j<numElements)
		if(i==j)
			A[i*numElements+j]=1;
		else A[i*numElements+j]=0;
}

__global__ void initB(int *B, int numElements) {
	int i = blockDim.x * blockIdx.x + threadIdx.x;
	if (i < numElements)
		B[i]=i;
}


__global__ void MatAdd(int *A, int *B, int *C, int numElements){
	int i = blockDim.x * blockIdx.x + threadIdx.x;
	int sum=0;
	if (i < numElements ){
		for(int j=0;j<numElements;j++)
			sum+=A[j*numElements+i]*B[j];
	}
	C[i]=sum;
}



__host__ int main(void) {
	cudaError_t err = cudaSuccess;
	cudaEvent_t start, stop;
	float gpuTime=0.0f;
	const int numElements = 21504;
	const int k=16;
	size_t size1 = numElements * numElements * sizeof(int);
	size_t size2 = numElements * sizeof(int);

	cudaEventCreate(&start);
	cudaEventCreate(&stop);
	
	int *h_C = (int *)malloc(size2);
	for(int i=0;i<numElements;i++)h_C[i]=0;
	
	int *d_A = NULL;
	err = cudaMalloc((void **)&d_A, size1);
	if (err != cudaSuccess){
		printf("malloc_d_A error\n");
		return 0;
	}
	
	int *d_B = NULL;
	err = cudaMalloc((void **)&d_B, size2);
	if (err != cudaSuccess){
		printf("malloc_d_B error\n");
		return 0;
	}

	int *d_C= NULL;
	err = cudaMalloc((void **)&d_C,size2);
	if (err != cudaSuccess){
		printf("malloc_d_C error\n");
		return 0;
	}
	
	dim3 threadsPerBlock(k,k);
	
	int BlockSizeI=((numElements + k -1)/k);
                                              
	int BlockSizeC=((numElements + k*k -1)/(k*k));

	dim3 blocksPerGrid (BlockSizeI, BlockSizeI);
	
	initA<<<blocksPerGrid, threadsPerBlock>>>(d_A, numElements);
	err = cudaGetLastError();
	if (err != cudaSuccess){
		printf("initA error\n");
		return 0;
	}

	threadsPerBlock = k*k;
	blocksPerGrid = BlockSizeC;
	
	initB<<<blocksPerGrid, threadsPerBlock>>>(d_B, numElements);
	err = cudaGetLastError();
	if (err != cudaSuccess){
		printf("initB error\n");
		return 0;
	}
		
	cudaEventRecord(start,0);

	
	MatAdd<<<blocksPerGrid, threadsPerBlock>>>(d_A, d_B, d_C, numElements);
	err = cudaGetLastError();
	if (err != cudaSuccess){
		printf("MatAdd error\n");
		return 0;
	}
	
	cudaEventRecord(stop,0);
	cudaEventSynchronize(stop);
	cudaEventElapsedTime(&gpuTime,start,stop);
	
	printf("Time: %.9f msec.",gpuTime);
	
	cudaMemcpy(h_C, d_C, size2, cudaMemcpyDeviceToHost);
	
	err = cudaFree(d_A);
	err = cudaFree(d_B);
	err = cudaFree(d_C);
	
	printf("\n");
	for(int i=0; i<numElements;i++)printf("%d ",h_C[i]);
	printf("\n");
	
	free(h_C);
	
	return 0;
}
