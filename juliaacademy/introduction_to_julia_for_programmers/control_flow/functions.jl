#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Control flow - functions
Link: https://juliaacademy.com/courses/375479/lectures/5871178
Aim: to replicate and expand the contents of this tutorial
=#

#=
In Julia functions can be declared through a designated keyword
Note: compared to Python, Julia uses the keyword function instead of end
Note: Julia does not require the return keyword that it's often found in Python functions

Julia 

function name(args)
    body
end

Python

def name(args):
    body
    return something
=#

base = 2
exponent = 3
function f(a,b)
    a^b
end
println("$base power $exponent yields $(f(base,exponent))")

#= 
Functions can be declared inline
=#
f2(a,b) = a^b
println("$base power $exponent yields $(f2(base,exponent))")

#=
The same function can be written in "Lambda" form

Julia

function_name = (arg_1,..,arg_n) -> body

Python

function_name = lambda arg_1,..,arg_n : body
=#
f3 = (a,b) -> a^b
println("$base power $exponent yields $(f3(base,exponent))")

#=
Function quacking is the property that ensure that a Julia
function will work on any input that makes sense.
For instance, we can apply the power function above to a matrix
=# 
# Create a simple 5 x 5 random matrix
M = rand(5,5)
display(f(M, exponent))
# The same quacking will not work on a vector as the power of a vector its an ambiguous operation
v = rand(5)
try 
    display(f(v,exponent))
catch LoadError
    println("I cannot perform the operation $v ^ $exponent because of its ambiguous nature.")
end

#=
Mutating functions are functions that can alter their arguments.
In-function mutations can be enable through the inclusion of the operator '!' after the name of the function
=#
# Create a simple 1 x 5 random vector
v = rand(5)
println("Let's start with the following vector v = $v")
println("We perform a non mutating sort, yielding v = $(sort(v))")
println("The object v, in spite of the sorting, it's still v = $v")
println("We now perform a mutating sort of v, yielding v = $(sort!(v))")
println("The object v is now sorted thanks to the previous implementation of a mutating version of sort!(), v = $v")

#=
Broadcasting it's a feature that allows programmers to control whether a function will apply 
operations globally or element wise.
In Julia, broadcasting can be implemented by adding the operator '.' after the name of the function.
To understand this concept, we create a simple matrix and perform the square operation with 
and without Broadcasting
=#
# Create a trivial matrix 
M = [i + 3*j for j = 0:2,  i = 1:3]
println("We start from this trivial matrix:")
display(M)
# Define a power 2 function
power_2(a) = a^2
# Apply a non-broadcasting version of power_2()
println("First, we apply the power_2() function to our matrix without broadcasting. This is equivalent to a classic matrix multiplication.")
display(power_2(M))
# Apply a broadcasting version of power_2()
println("Next, we apply the power_2() function to our matrix with broadcasting. This is equivalent to apply power_2() to every element of the matrix.")
display(power_2.(M))
