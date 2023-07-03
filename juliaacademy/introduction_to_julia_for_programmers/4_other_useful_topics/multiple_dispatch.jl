#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - multiple dispatch
Link: https://juliaacademy.com/courses/375479/lectures/5863643
Aim: to replicate and expand the contents of this tutorial
=#

#=
Multiple dispatch is a key feature of Julia that makes a software fast, extensible and programmable.
=#

#=
By calling methods() over an operator, we can see how many existing definition we have for the operator itself.
It displays all the methods that can be used when the code uses a given operator.
=#
methods(+)
#=
The @which macro preceeding an operation displays which method is used when an operator is invoked.
For instance, we can display the method used to perform an addition between different types
=#
println(@which 2 + 2)
println(@which 2 + 2.0)
println(@which 2.0 + 2.0)
println(@which [2, 3] + [4, 5])
println(@which [[1, 2],[2, 3]] + [[3,4],[4, 5]])
#=
In Julia we can even extend the methods that can be used with a given operator
Assume we want to concatenate strings through the '+' operator like in Python
First, we try and catch an error
=#
try
    combined_string = "Hello" + "!"
catch MethodError
    println("Julia does not allow to concatenate strings through the + operator. Use * instead!")
end
#=
At this point, we construct a custom rule to allow strings concatenation via '+'
=#
# Import the operator from the Base.jl library
import Base: +
# Define the concatenation template in the following from: operator (input1::input1_type,...,inputn::inputn_type) = operation(input_1,...,input_n)
+(x::String, y::String) = x*y
combined_string = "Hello" + "!"
# and observe the method that the program invokes when strings concatenation is performed via +
println(@which "Hello" + "!")
#=
We can implement a multiple dispatch of a function
=#
foo(a, b) = println("generic input combination.")
foo(a::Int, b::Int) = println("both inputs are integers.")
foo(a::Float64, b::Float64) = println("both inputs are floats.")
foo(a::Int, b::Float64) = println("one integer and one float.")
#=
Then we test the multiple dispatch by feeding foo() with different inputs
=#
inputs = [[1,1],[2.0,3.0],[1,5.0],["Mark","Paul"]]
for input in inputs
    foo(input[1],input[2])
end
