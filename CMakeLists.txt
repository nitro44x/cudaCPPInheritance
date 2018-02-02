cmake_minimum_required(VERSION 3.10)

project(cudaInheritenceExample LANGUAGES CXX CUDA)

set(srcs main.cpp
         CUDAMacros.hpp
         ISimplePrinter.hpp
         CPUPrinter.hpp
         CPUPrinter.cpp
         GPUPrinter.cuh
         GPUPRinter.cu)

add_executable(cudaInheritenceExample ${srcs})