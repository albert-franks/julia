#=
juliaacademy.com - Introduction to Julia (for programmers)
Chapter: Packages and Plotting - plotting
Link: https://juliaacademy.com/courses/375479/lectures/5863640
Aim: to replicate and expand the contents of this tutorial
=#

#=








A comprehensive repository of Julia packages is available here

https://julialang.org/packages/

To add a package to the current environment, we invoke using Pkg and then the add() 
command with sole argument the name of the package.
In this first example, we add the package "Example"
=#
using Pkg
Pkg.add("Example")
#=
To use a package, we use the 'using' keyword followed by the name of the package
Note: In Python, a package is added via 'pip install' and invoked in the program through the keyword 'import'.
      In Julia, 'pip install' is replaced by Pkg.add() and 'import' is replaced by 'using'
Note: There is an even more compact way to add package when using Julia from the command shell.
      julia> "]" <- this opens the package manager
      julia> add package_name <- this adds a package

The source code for the Example package can be found here:

https://julialang.github.io/Example.jl/stable/
=#
using Example
# We try the hello() function from 'Example', which print an user-define message after 'Hello,'
hello("my name is Mark.")

#=
We do the same for the package Colors

https://juliagraphics.github.io/Colors.jl/stable/

=#
Pkg.add("Colors")
using Colors