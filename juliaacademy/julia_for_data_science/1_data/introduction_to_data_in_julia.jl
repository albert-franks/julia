#=
juliaacademy.com - Julia for Data Science
Chapter: Data
Link: https://juliaacademy.com/courses/937702/lectures/17339299
Aim: to replicate and expand the contents of this tutorial
=#
#=
Import/install required required_packages
=#
using BenchmarkTools
using DataFrames
using DelimitedFiles
using CSV
using XLSX
using Downloads
#=
Download the sample dataframe from the course repository
=#
datapath = "https://raw.githubusercontent.com/nassarhuda/easy_data/master/programming_languages.csv"
filename = "programming_languages.csv"
P = Downloads.download(datapath, filename)
#=
Read the dataframe via DelimitedFiles package
=#
P,H = readdlm(filename,',';header=true)
# Display the object type and the first 10 lines of P
@show typeof(P)
display(P[1:10,:])
#=
Read the dataframe via CSV package (similar to Python's pandas)
=#
C = CSV.read(filename, DataFrame)
# Display the object type and the first 10 lines of C
@show typeof(C)
display(C[1:10,:])
# Similar to pandas, we can use a describe() method to display some basic statistical properties of a dataframe
describe(C)