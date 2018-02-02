#include "GPUPrinter.cuh"
#include <cuda_runtime.h>
#include <cstdio>
#include <vector>

using printer_handle = ISimplePrinter**;

HOSTDEVICE void GPUPrinter::print_your_thing() const
{
    printf("Hello from gpu\n");
}

__global__ void newKernel(printer_handle obj)
{
    *obj = new GPUPrinter;
}
__global__ void printKernel(printer_handle printer)
{
    (*printer)->print_your_thing();
}
__global__ void delKernel(printer_handle obj)
{
    delete (*obj);
    *obj = nullptr;
}

int printFromGPU()
{

    cudaError_t err = cudaSuccess;
    printer_handle printer_dev = nullptr;
    err = cudaMalloc((void**)&printer_dev, sizeof(printer_handle));
    newKernel<<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    printKernel<<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    delKernel<<<1,1>>>(printer_dev);
    err = cudaDeviceSynchronize();
    err = cudaFree(printer_dev);
    return cudaSuccess == err;
}

