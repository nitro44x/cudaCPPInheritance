
#include "ISimplePrinter.hpp"
#include "CPUPrinter.hpp"
#include <memory>
#include "GPUPrinter.cuh"

int main()
{
    std::unique_ptr<ISimplePrinter> printer = std::make_unique<CPUPrinter>();
    printer->print_your_thing();
    printer = std::make_unique<GPUPrinter>();
    printer->print_your_thing();
    printFromGPU();
    return 0;
}
