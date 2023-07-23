#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - basic linear algebra
Link: https://juliaacademy.com/courses/375479/lectures/5863646
Aim: to replicate and expand the contents of this tutorial
=#

#=
The goal of this lecture is to benchmark some pre-built and user-defined functions to show how fast Julia is
=#

# build a random vector (U~[0,1]) of 10^7 entries
v = rand(10^7)
# perform a built in sum across this vector
s_v = sum(v)
println("The sum of the elements of the vector v is $s_v")
println("The expected value of this sum is $(0.5*(10^7))")

#=
Import the BenchmarkTools library to time/benchmark segments of the code
=#
using Pkg
Pkg.add("BenchmarkTools")
using BenchmarkTools

#=
Build the same function in C
=#
C_code = """
#include <stddef.h>
double c_sum(size_t n, double *X) {
    double s = 0.0;
    for (size_t i = 0; i < n; ++i){
        s += X[i];
    }
    return s;
}
"""
const Clib = tempname()
open(`gcc -fPIC -O3 -msse3 -xc -shared -o $(Clib * "." * Libdl.dlext) -`,"w") do f
    print(f, C_code)
end