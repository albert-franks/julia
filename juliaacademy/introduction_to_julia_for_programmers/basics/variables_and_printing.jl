#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Basics - variables and printing
Link: https://juliaacademy.com/courses/intro-to-julia/lectures/5815852
Aim: to replicate and expand the contents of this tutorial
=#

# println is used to print a statement
println("Learning Julia!")

# Julia determines the type of your variable (different from C++/Java)
my_var = 5
println("the type of my_var is: " * string(typeof(my_var)))
#=
Note: a very similar string concatenation could have been performed with the operator + in Python
Note: the multiline comment uses #= and =# while Python uses *** and ***
=#

# We can create a variable using unicode emojis
😃 = "smiling"
println("the emoji is " * 😃)
println("the type of the emoji is: " * string(typeof(😃)))

#=
Basic operations
Goal: perform elementary operations and spot any interesting difference from Python
=#
int_a = 5
int_b = 2
# sum
sum = int_a + int_b
println(string(int_a) * " + " * string(int_b)* " = " * string(sum))
# difference
difference = int_a - int_b
println(string(int_a) * " - " * string(int_b)* " = " * string(difference))
# product
product = int_a * int_b
println(string(int_a) * " x " * string(int_b)* " = " * string(product))
# quotient
quotient = int_a / int_b
println(string(int_a) * " / " * string(int_b)* " = " * string(quotient))
# power (note the difference between Julia (^) and Python (**))
power = int_a ^ int_b
println(string(int_a) * " ^ " * string(int_b)* " = " * string(power))
# modulus or remainder
modulus = int_a % int_b
println(string(int_a) * " mod " * string(int_b)* " = " * string(modulus))

#=
Convert operator
Goal: perform basic conversions of an integer variable into float and string
=#
days = 365
days_float = convert(Float32, days)
days_string = repr(days)
println("start from Int: " * string(days) * ", convert into Float 32: " * string(days_float) * " and finally into String: " * string(days_string))
convert(Int64,"1")
#=
Assert operator
Goal: test the @assert operator in Julia through a simple exception handling statement.
Note: Python requires ":" after keywords while Julia does not.
Note: Julia requires the end keyword while Python does not.
=#
try @assert days == 364
catch AssertionError
    println("Wrong assertion!")
end
