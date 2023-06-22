#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Basics - data structures
Link: https://juliaacademy.com/courses/375479/lectures/5745688
Aim: to replicate and expand the contents of this tutorial
=#

#=
A dictionary is a data structure where each key is associated to a value
In Python dictionaries take the following form: d = {"key_1":value1,...,"key_n",valuen}
In Julia dictionaries take the following form: d = Dict("key_1"=>value1,...,"key_n"=>valuen)
=#
my_dict = Dict("key_1"=>1,"key_2"=>2,"key_3"=>3)
# Adding entries in Julia is the same as in Python
my_dict["key_4"] = 4
#=
Printing keys and values of a dictionary in Julia is slightly different than in Python
In Julia we use the functions keys(my_dict) and values(my_dict) which take my_dict as argument.
In Python we would have used the methods the same methods as my_dict.keys() and my_dict.values()
=#
println("The keys of my dictionary are: $(keys(my_dict))")
println("The keys of my dictionary are: $(values(my_dict))")
#=
The pop function is used to remove an element from a dictionary.
This function takes as arguments the dictionary itself and the key we want to remove.
=#
pop!(my_dict,"key_1")
# We display my_dict after popping key_1
my_dict
#=
Note: dictionaries cannot be indexed and each element must be retrieved via keys
=#
try
    my_dict[1]
catch KeyError
    println("Dictionaries do not support indexation!")
end
#=
Tuples in Julia are defined in the same way as in Python
=#
my_tuple = (10,20,30)
#=
Tuples can be indexed. 
Note: the first element of an indexable data structure as index = 1. In Python it would have been index = 0.
=#
println("The second element of my tuple is $(my_tuple[1])")
#=
Tuples are immutable
=#
try
    my_tuple[2] = 50
catch MethodError
    println("Tuples are immutable!")
end
#= 
Arrays in Julia are mutable, indexable and can support different types. 
They work like lists in Python.
=#
my_array_friends = ["John","Paul","Mark"]
my_array_fibonacci = [1,1,2,3,5,8,13]
my_array_mix = [1,"Hello","b",365.234]
#=
The push method for Julia arrays allow to append an element to the array. 
This works like append() for Python lists
=#
push!(my_array_fibonacci,21)
#=
The pop method for Julia arrays allow to pop the last element of the array.
=#
pop!(my_array_fibonacci)
#=
Arrays of arrays in Julia are arrays whose elements are other arrays. 
This is equivalent to list of lists in Python.
=#
my_array_of_arrays = [[1,2,3],[4,5],[6],[7,8,9]]
#= 
The rand function allows to create arrays of arrays by generating matrices/tensors of random uniform distributed numbers
=#
# 2 x 2 matrix
square_matrix = rand(2,2)
square_matrix
# 3 x 4 matrix
non_square_matrix = rand(3,4)
non_square_matrix
# 2 x 2 x 3 tensor
square_tensor = rand(2,2,3)
square_tensor
















