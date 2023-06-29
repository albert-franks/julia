#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Control flow - conditionals
Link: https://juliaacademy.com/courses/375479/lectures/5816186
Aim: to replicate and expand the contents of this tutorial
=#

#=
Conditional statements are used to condition the execution of a segment of the program to the ex-ante fulfilment of an user defined condition
Note: Python uses the keyword elif while Julia uses the keyword elseif
=#
n = 3
low_bound = 1
high_bound = 10
if (n < low_bound)
    println("n is smaller than $low_bound")
elseif((n >= 1) && (n < 10))
    println("n is greater or equal $low_bound but smaller than $high_bound")
else
    println("n is greater or equal $high_bound")
end
#=
An interesting way of writing conditionals in Julia takes the following form
condition ? A : B
meaning that if condition == True then execute A, otherwise execute B 
These are called ternary operators
=#
(n < low_bound) ? println("n is smaller than $low_bound") : println("n is greater or equal $low_bound")
#=
from: http://web.mit.edu/julia_v0.6.2/julia/share/doc/julia/html/en/manual/control-flow.html

Short-circuit evaluation is quite similar to conditional evaluation. 
The behavior is found in most imperative programming languages having the && and || boolean operators: 
in a series of boolean expressions connected by these operators, only the minimum number of expressions are evaluated 
as are necessary to determine the final boolean value of the entire chain. Explicitly, this means that:

> In the expression a && b, the subexpression b is only evaluated if a evaluates to true.
> In the expression a || b, the subexpression b is only evaluated if a evaluates to false.

The reasoning is that a && b must be false if a is false, regardless of the value of b, and likewise, 
the value of a || b must be true if a is true, regardless of the value of b. 
Both && and || associate to the right, but && has higher precedence than || does. 
=#
n = 3
if (n >= 1) && (n <= 5)
    println("n is in the interval [1,5]")
else
    println("n is not in the interval [1,5]")
end
# or its equivalent ternary form 
((n >= 1) && (n <= 5)) ? println("n is in the interval [1,5]") : println("n is not in the interval [1,5]")
