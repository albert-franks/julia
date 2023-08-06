#=
Simple tool to download Julia packages

INSTRUCTIONS:

1) the user must specify the names of the packages he/she intends to download.
2) the user should simply run the program.
=#
using Pkg
required_packages = ["BenchmarkTools","DataFrames","DelimitedFiles","CSV","XLSX","Downloads"]
for package in required_packages
    Pkg.add(package)  
end