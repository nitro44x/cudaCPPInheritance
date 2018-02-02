
#include "ISimplePrinter.hpp"
#include "CPUPrinter.hpp"
#include "GPUPrinter.cuh"

#include <memory>

int main()
{
    std::unique_ptr<ISimplePrinter> printer = std::make_unique<CPUPrinter>();
    printer->print_your_thing();
    printer = std::make_unique<GPUPrinter>();
    printer->print_your_thing();
    printFromGPU();
    return 0;
}
