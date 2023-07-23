#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - structs
Link: https://juliaacademy.com/courses/375479/lectures/38884488
Aim: to replicate and expand the contents of this tutorial
=#

#=
Similar to classes in other object oriented programming languages, structs allow to define custom types.
A structure is define through a dedicated keyword followed by the name of the struct. 
=#
struct my_simple_struct
    placeholder_obj_1
    placeholder_obj_2
end
#=
Then, we create an object of type struct
=#
my_struct = my_simple_struct("Hello","World")
println("The first placeholder object of this simple user defined struc is: "*my_struct.placeholder_obj_1)
println("The second placeholder object of this simple user defined struc is: "*my_struct.placeholder_obj_2)
#=
Note that regular stucts are immutable
=#
try
    my_struct.placeholder_obj_1 = "HELLO"
catch setfield!
    println("Regular structs cannot be altered!")
end
#=
However, Julia allows for the creation of mutable structs through a dedicated keyword
=#
mutable struct persona
    name::String
    age::Float64
    location::String
end
my_mutable_struct = persona("Mark",30,"Amsterdam")
println("My name is $(my_mutable_struct.name)")
println("I'm $(my_mutable_struct.age)")
println("I live in $(my_mutable_struct.location)")
#=
We alter the objects belonging to our mutable struct
=#
try
    my_mutable_struct.name = "Steve"
    my_mutable_struct.age += 1
    my_mutable_struct.location = "Chicago"
catch setfield!
    println("Mutable structs can be altered!")
end
println("My name is $(my_mutable_struct.name)")
println("I'm $(my_mutable_struct.age)")
println("I live in $(my_mutable_struct.location)")
#=
Default constructor

Julia allows for the inclusion of a default constructor within a struct.
The struct below (persona) is constructed through three objects: name, age, location.
However, we can define a function named as the struct that allows to construct 
the struct itself by declaring name and age while setting location to a default value.
=#
mutable struct persona
    name::String
    age::Float64
    location::String

    function persona(name, age)
        new(name, age, "Zanarkand")
    end
end
my_mutable_struct = persona("Tidus", 17)
println("My name is $(my_mutable_struct.name)")
println("I'm $(my_mutable_struct.age)")
println("I live in $(my_mutable_struct.location)")
#=
Struct associated methods

In Julia it is possible to define methods that allow to alter objects of a given struct.
These methods take the struct itself as argument.
=#
function birthday(input_struct::persona)
    input_struct.age += 1
end
birthday(my_mutable_struct)
println("My name is $(my_mutable_struct.name)")
println("I'm $(my_mutable_struct.age)")
println("I live in $(my_mutable_struct.location)")