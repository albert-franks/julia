#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - basic linear algebra
Link: https://juliaacademy.com/courses/375479/lectures/5863646
Aim: to focus on the first segment of this tutorial
=#

#=
The goal of this script is to compare the notions of shallow and deep copy in Julia
=#

# Build a random 3 x 3 matrix whose entries are integers between 1 and 4
A = rand(1:4,3,3)
#=
First, we explore various aspect of memory allocation/copy in Julia
=#
B = A
C = copy(A)
D = deepcopy(A)
# Alter the first entry in A
println("The original matrix A is $(A)")
A[1,1] = 10
# And note how this affected B, C, D
println("The matrix A after altering A[1,1] is $(A)")
println("The matrix B after altering A[1,1] is $(B)")
println("The matrix C after altering A[1,1] is $(C)")
println("The matrix D after altering A[1,1] is $(D)")
# Now, we alter the first entry in B
B[1,1] = 50
# And note how this affected A, C, D
println("The matrix A after altering B[1,1] is $(A)")
println("The matrix B after altering B[1,1] is $(B)")
println("The matrix C after altering B[1,1] is $(C)")
println("The matrix D after altering B[1,1] is $(D)")
# Next, we alter the first entry in C
C[1,1] = 70
# And note how this affected A, B, D
println("The matrix A after altering C[1,1] is $(A)")
println("The matrix B after altering C[1,1] is $(B)")
println("The matrix C after altering C[1,1] is $(C)")
println("The matrix D after altering C[1,1] is $(D)")
# Finally, we alter the first entry in D
D[1,1] = 120
# And note how this affected A, B, D
println("The matrix A after altering D[1,1] is $(A)")
println("The matrix B after altering D[1,1] is $(B)")
println("The matrix C after altering D[1,1] is $(C)")
println("The matrix D after altering D[1,1] is $(D)")
#=
We can appreciate the difference between the = operator, copy() and deepcopy()

The = operator assigns the same memory address to multiple variables.

The copy() method creates a shallow copy. Altering A may alter C, altering C
may A. This happens if the alteration involves a mutable element. 


The deepcopy() method creates a deep copy. Altering A does not alter D, altering D
does not alter A. This is because the elements of the newly created object (C) are 
not referenced to the corresponding elements of the original object (A).
to the original elements.

In the example above, the element of matrix C are immutable therefore copy()
effectively behaved like deepcopy(). However, we can repeat the same exercise
with mutable objects
=#
A2 = [[1,2],[3,4]]
C2 = copy(A2)
println("The data structure A2 is $A2")
println("Its shallow copy C2 is $C2")
# We append an element to the first element of A2
append!(A2[1], 10)
println("The data structure A2 after appending an element to its first array is $A2")
println("Its shallow copy C2 after appending an element to A2 first array is $C2")
# We append an element to the first element of C2
append!(C2[1], 100)
println("The data structure A2 after appending an element to C2 first array is $A2")
println("Its shallow copy C2 after appending an element to its first array is $C2")