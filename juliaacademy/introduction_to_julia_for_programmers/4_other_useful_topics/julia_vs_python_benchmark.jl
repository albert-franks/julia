#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Other Useful Topics - julia is fast
Link: https://juliaacademy.com/courses/375479/lectures/5863646
Aim: to replicate and expand the contents of this tutorial
=#

#=
The goal of this lecture is to benchmark some pre-built and user-defined functions to show how fast Julia is
=#

#=
Import libraries needed for the tasks of this program
=#
using PyCall
using Conda
using BenchmarkTools
using Plots
using LaTeXStrings
using PlotlyJS
#=
PHASE 1: perform a basic comparison between Julia and Python built-in sum methods
=#
# Build a Julia random vector (U~[0,1]) of 10^7 entries
v = rand(10^7)
# Convert the vector v into a python list
v_py = PyCall.array2py(v)
# Get the python built-in sum
sum_py = pybuiltin("sum")
# Check if the same operation in Julia and Python leads to the same results
println("The difference between Julia and Python built-in sums 
         over the same array is: $(sum(v) - sum_py(v_py))")
#=
Generalize the comparison above to different vector sizes
=#
magnitudes = 1:8
julia_median_times = Dict()
python_median_times = Dict()
for magnitude in magnitudes
    # Create a random Julia vector
    random_vector_julia = rand(10^magnitude)
    # Create its python version
    random_vector_python = PyCall.array2py(random_vector_julia)
    # Time the built-in sum operators in both languages
    julia_sum_benchmark = @benchmark $sum($random_vector_julia)
    python_sum_benchmark = @benchmark $sum_py($random_vector_python)
    # Store the median time (in ms, hence /1e6) of the executions for each language
    julia_median_times[magnitude] = median(julia_sum_benchmark.times)/1e6
    python_median_times[magnitude] = median(python_sum_benchmark.times)/1e6
end
#=
Plot the outcomes of this comparison.
Build the plot object representing vector magnitudes vs. execution times
=#
plot1 = Plots.plot(magnitudes,[collect(values(python_median_times)) collect(values(julia_median_times))], 
                   label=["Python" "Julia"], color=["green" "violet"], xlabel = "random vector size (10^size)",
                   ylabel = "median time (ms)", title = "Built-in sum execution median times")#,legend =:topright)
#=
Build the plot object representing the ratio between median times (Python/Julia)
=#
plot2 = Plots.bar(collect(values(python_median_times))./collect(values(julia_median_times)), 
                  xticks=(1:length(magnitudes), magnitudes), color="red", 
                  xlabel = "random vector size (10^size)", ylabel = "Julia improvement (x times faster)",
                  title = "built-in sum execution median times (Python/Julia)", legend=false)
#=
PHASE 2: perform a basic comparison between Julia built-in sum method and Python's numpy sum method
=#
# Get the numpy built-in sum
numpy_sum = pyimport("numpy")["sum"]
# Convert the vector v into a numpy array
v_numpy = PyObject(v)
# Check if the same operation in Julia and Python numpy leads to the same results
println("The difference between Julia built-in sum and the Numpy sum
         over the same array is: $(sum(v) - numpy_sum(v_numpy))")
#=
Generalize the comparison above to different vector sizes
=#
julia_median_times = Dict()
numpy_median_times = Dict()
for magnitude in magnitudes
    # Create a random Julia vector
    random_vector_julia = rand(10^magnitude)
    # Create its numpy version
    random_vector_numpy = PyObject(random_vector_julia)
    # Time the built-in sum operators in both languages
    julia_sum_benchmark = @benchmark $sum($random_vector_julia)
    numpy_sum_benchmark = @benchmark $sum_py($random_vector_numpy)
    # Store the median time (in ms, hence /1e6) of the executions for each language
    julia_median_times[magnitude] = median(julia_sum_benchmark.times)/1e6
    numpy_median_times[magnitude] = median(numpy_sum_benchmark.times)/1e6
end
#=
Plot the outcomes of this Base.prec_comparison
Build the plot object representing vector magnitudes vs. execution times
=#
plot3 = Plots.plot(magnitudes,[collect(values(numpy_median_times)) collect(values(julia_median_times))], 
                   label=["Numpy" "Julia"], color=["green" "violet"], xlabel = "random vector size (10^size)",
                   ylabel = "median time (ms)", title = "sum method execution median times")#,legend =:topright)
#=
Build the plot object representing the ratio between median times (Numpy/Julia)
=#
plot4 = Plots.bar(collect(values(numpy_median_times))./collect(values(julia_median_times)), 
                  xticks=(1:length(magnitudes), magnitudes), color="red", 
                  xlabel = "random vector size (10^size)", ylabel = "Julia improvement (x times faster)",
                  title = "sum method execution median times (Numpy/Julia)", legend=false)
#=
PHASE 3: perform a basic comparison between Julia built-in sum method and Python's hand written sum function
=#
# Write a sum function in python
py"""
def hand_written_sum(x):
    s = 0
    for element in x:
        s += element
    return s
"""
hand_written_sum = py"hand_written_sum"
# Check if the same operation in Julia and Python leads to the same results
println("The difference between Julia built-in sum and Phyton hand written sum function 
         over the same array is: $(sum(v) - hand_written_sum(v_py))")
#=
Generalize the comparison above to different vector sizes
=#
julia_median_times = Dict()
python_hand_written_median_times = Dict()
for magnitude in magnitudes
    # Create a random Julia vector
    random_vector_julia = rand(10^magnitude)
    # Create its python version
    random_vector_python = PyCall.array2py(random_vector_julia)
    # Time the built-in sum operators in both languages
    julia_sum_benchmark = @benchmark $sum($random_vector_julia)
    python_hand_written_sum_benchmark = @benchmark $hand_written_sum($random_vector_python)
    # Store the median time (in ms, hence /1e6) of the executions for each language
    julia_median_times[magnitude] = median(julia_sum_benchmark.times)/1e6
    python_hand_written_median_times[magnitude] = median(python_hand_written_sum_benchmark.times)/1e6
end
#=
Plot the outcomes of this comparison.
Build the plot object representing vector magnitudes vs. execution times
=#
plot5 = Plots.plot(magnitudes,[collect(values(python_hand_written_median_times)) collect(values(julia_median_times))], 
                   label=["Python HW" "Julia"], color=["green" "violet"], xlabel = "random vector size (10^size)",
                   ylabel = "median time (ms)", title = "sum method execution median times")#,legend =:topright)
#=
Build the plot object representing the ratio between median times (Python/Julia)
=#
plot6 = Plots.bar(collect(values(python_hand_written_median_times))./collect(values(julia_median_times)), 
                  xticks=(1:length(magnitudes), magnitudes), color="red", 
                  xlabel = "random vector size (10^size)", ylabel = "Julia improvement (x times faster)",
                  title = "sum method execution median times (Python HW/Julia)", legend=false)

# Initiate the gr() backend to host the plot
gr()
# Build a subplot grid including all the comparisons examined in this program
Plots.plot(plot1, plot2, plot3, plot4, plot5, plot6, layout=(3,2),size=(1300,1100),)
