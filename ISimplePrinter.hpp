#pragma once
#include "CUDAMacros.hpp"

class ISimplePrinter
{
public:
    // Dtor cannot use = default, nvcc spits out this warning:
    // ISimplePrinter.hpp(9): warning : __host__ annotation on a defaulted function("~ISimplePrinter") is ignored
    virtual HOSTDEVICE ~ISimplePrinter() {}  // NOLINT
    virtual HOSTDEVICE void print_your_thing() const = 0;
};
