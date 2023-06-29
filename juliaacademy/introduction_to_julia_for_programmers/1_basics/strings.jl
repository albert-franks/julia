#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Basics - strings
Link: https://juliaacademy.com/courses/375479/lectures/5745676
Aim: to replicate and expand the contents of this tutorial
=#

#=
Strings can be defined through single quotation marks (" ") or triple quotation marks (""" """)
=#
string_1 = "Hello!"
string_2 = """Hello!"""
try @assert string_1 == string_2
catch AssertionError
    println("The two strings are not equal.")
end
#=
Note: single quotation marks identify characters, not strings!
=#
try @assert Type('a') == String
catch AssertionError
    println("' ' defines a character, not a string!")
end
#=
String interpolation is the practice of including variables into a string.
In Julia, the keyword $ is used to perform interpolations.
=#
name = "John"
age = 25
job_1_ys_of_exp = 1
job_2_ys_of_exp = 2
println("My name is $name and I am $age !")
println("I worked at company A for $job_1_ys_of_exp years and at company B for $job_2_ys_of_exp years. 
Overall, I have $(job_1_ys_of_exp + job_2_ys_of_exp) years of experience in this field.")
#=
String concatenation is the practice of combining multiple strings.
In Julia, this can be done in multiple ways.
=#
string_part_1 = "Hello, "
string_part_2 = "my name is $name"
# 1) string() function
println(string(string_part_1, string_part_2))
# 2) The * operator, that acts similarly to the + operator in Python
println(string_part_1*string_part_2)
# 3) The $ operator, that acts similarly to the $ operator in Python
println("$string_part_1$string_part_2")
