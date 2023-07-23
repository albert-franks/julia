#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - basic linear algebra
Link: https://juliaacademy.com/courses/375479/lectures/5863646
Aim: to replicate and expand the contents of this tutorial
=#

#=
The goal of this lecture is to implement basic linear algebra operations in Julia
=#
# Build a random 3 x 3 matrix whose entries are integers between 1 and 4
A = rand(1:4,3,3)
# First, we perform a simple matrix - vector multiplication
x = ones(3) # 1x3 unit vector
b = A*x
println("The product between A = $A and x = $x is b = $b")
# Next, we derive the transposed of A and create a symmetric matrix
A_transposed = A'
A_sym = A + A'
println("The transposed of A is A' = $A_transposed")
println("The symmetric matrix As = A + A' is $A_sym")
# In the case of transposed multiplication, Julia does not need the product operator
A_prod = A'A
println("The product A'A is $A_prod")
# For a simple square matrix A, the linear system Ax = b can be solved as follows
x_sol = A\b
println("The solution of Ax = b with A = $A and b = $b is x = $x_sol")