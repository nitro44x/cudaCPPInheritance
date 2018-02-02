#include "GPUPrinter.cuh"
#include <cuda_runtime.h>
#include <cstdio>
#include <vector>

HOSTDEVICE void GPUPrinter::print_your_thing() const
{
    printf("Hello from gpu\n");
}

template <typename T, typename D>
__global__ void newKernel(T ** obj)
{
    *obj = new D;
}
__global__ void printKernel(ISimplePrinter ** printer)
{
    (*printer)->print_your_thing();
}
template <typename T>
__global__ void delKernel(T ** obj)
{
    delete (*obj);
    *obj = nullptr;
}

int printFromGPU()
{
    cudaError_t err = cudaSuccess;
    ISimplePrinter ** printer_dev = nullptr;
    err = cudaMalloc((void**)&printer_dev, sizeof(ISimplePrinter**));
    newKernel<ISimplePrinter, GPUPrinter><<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    printKernel<<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    delKernel<<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    err = cudaFree(printer_dev);
    return cudaSuccess == err;
}

