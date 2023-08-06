#=
Simple tool to build/rebuild Julia packages

INSTRUCTIONS:

1) the user must specify the names of the packages he/she intends to download.
2) the user should set any eventual environmental variable (ENV) that will affect the building process.
3) the user should simply run the program.
=#
using Pkg
required_packages = ["PyCall","Conda"]
ENV["PYTHON"] = "D:/python_3_10/python.exe"
for package in required_packages
    Pkg.build(package)  
end