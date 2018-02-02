#pragma once
#include "ISimplePrinter.hpp"

class CPUPrinter :
    public ISimplePrinter
{
public:
    void print_your_thing() const override;
};

