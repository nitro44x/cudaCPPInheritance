#pragma once
#include "ISimplePrinter.hpp"


class GPUPrinter :
    public ISimplePrinter
{
public:
    HOSTDEVICE void print_your_thing() const override;

private:
    double data = 123.321;
};

int printFromGPU();