#include <thread>
#include <iostream>

using namespace std; 

void hello(int& a, int b){
  a += b;
  return;
}

int main(){
  int a = 202;
  thread t(hello, ref(a), 20);
  cout<< a << endl;
  t.join();
  cout << std::thread::hardware_concurrency();

  return 0;
}
