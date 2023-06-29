#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Packages and Plotting - plotting
Link: https://juliaacademy.com/courses/375479/lectures/5863640
Aim: to replicate and expand the contents of this tutorial
=#

#=
Plots.jl is a Julia package facilitating the production of scientific Plots
LaTeXStrings.jl is an auxiliary Julia package allowing user to include LaTex text in their plots
PlotlyJS.jl is a Julia library for interactive visualizations
=#
using Pkg
Pkg.add("Plots")
Pkg.add("LaTeXStrings")
Pkg.add("PlotlyJS")
using Plots
using LaTeXStrings
using PlotlyJS
#=
As first example, we plot the power 2 function
=#
x = -5:0.1:5
power_2 = x-> x^2
y = power_2.(x)
# Initiate the gr() backend to host the plot
gr()
#=
Plot the afore defined function through a basic line
Note: the "L" symbol before a string allows to include latex fonts in the plot
      In python, we can achieve the same by using "r" in front of a string
=#
plot(x,y,xlabel=L"x",ylabel=L"x^{2}", label="line", color="green")
#=
The operator "!" was used after function names to allow functions to mutate the objects that they take as arguments
In the case of plotting, the same operator can be used to add additional elements to an existing plot.

For instance, we can overlay a scatter to the existing line
=#
scatter!(x, y, color = "red", label="scatter")
# Add a title
plot!(title = "Power function")
# Add a legend
plot!(legend =:bottomright)
#=
We repeat the same exercise with another backend (plotlyjs())
=#
plotlyjs()
plot(x,y,xlabel=L"x",ylabel=L"x^{2}", label="line", color="green")
scatter!(x, y, color = "red", label="scatter")
plot!(title = "Power function")
plot!(legend =:bottomright)
#=
Subplots are used to visualize multiple charts in a single panel
In Python, subplots can be created via matplotlib.pyplot backend()

import matplotlib.pyplot as plt
fig, ax = plt.subplots(m, n)
ax[0][0].plot()
...
ax[0][n-1].plot()
...
...
ax[m-1][n-1].plot()
plt.show()

In Julia, we take a similar approach but with a slightly different syntax
=#
gr()
plot_1 = plot(x, x, xlabel=L"x", ylabel=L"x")
plot_2 = plot(x, x.^2, xlabel=L"x", ylabel=L"x^{2}")
plot_3 = plot(x, x.^3, xlabel=L"x", ylabel=L"x^{3}")
plot_4 = plot(x, x.^4, xlabel=L"x", ylabel=L"x^{4}")
plot(plot_1, plot_2, plot_3, plot_4, layout=(2,2), legend=false)
