#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Control flow - loops
Link: https://juliaacademy.com/courses/375479/lectures/5816184
Aim: to replicate and expand the contents of this tutorial
=#

#=
A while loop is a loop that terminates only when a condition is not met anymore.
Note: the global keyword is needed to modify a variable within a while loop 
      as it was declared before the control flow
=#
n = 0
while (n < 10)
    global n += 1
    println("$n")
end
println("Exited while loop.")

my_friends = ["Mark","John","Paul"]
n = length(my_friends)
i = 1
while (i <= n)
    println("$(my_friends[i]) is one of my best friend.")
    global i += 1
end
#=
A for loop allows to iterate over a defined range of values or elements of a data structure
=#
for i in 1:n
    println("$(my_friends[i]) is one of my best friend.")
end
for friend in my_friends
    println("$(friend) is one of my best friend.")
end
#=
Note that the in keyword can be replaced by = or ∈ to obtain the same result
=#
for i = 1:n
    println(i)
end
for i ∈ 1:n
    println(i)
end
#= 
Inner loops and filling a matrix
=#
m = 5
n = 6
# create a m x n zeroes matrix
M = zeros(m, n)
for i = 1:m
    for j = 1:n
        M[i, j] = i*j
    end
end
display(M)
# We can write the same inner loop in a more compact way
M = zeros(m, n)
for i = 1:m, j = 1:n
    M[i, j] = i*j
end
display(M)
println("here")
# Or even using an array comprehension similar to the one in Python. Here the comma replaces the keyword for used in Python
M = [i*j for i = 1:m, j = 1:n]
display(M)
# Finally, we combine a loop and a comprehension to create an increasily large matrix
for i = 1:m
    M = [p*j for p = 1:i, j = 1:n]
    display(M)
end


