#pragma once

#ifdef __CUDACC__
#define HOSTDEVICE __host__ __device__
#else
#define HOSTDEVICE
#endif

class ISimplePrinter
{
public:
    virtual HOSTDEVICE ~ISimplePrinter() {};
    virtual HOSTDEVICE void print_your_thing() const = 0;
};
