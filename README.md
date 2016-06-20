# **parallel\_task\_launcher**

This code snippet uses the Python standard library to launch Fortran tasks in parallel (not to be confused with concurrency). More specifically, it employs a fixed threadpool to run exactly 5 instances of your Fortran program, launching a new instance as soon as an old instance terminates, until you've exhausted var_grid.txt  

-----------------------------------------------------------------------------

## Requirements
* The GNU Make tool https://www.gnu.org/software/make/
* The GNU gfortran compiler https://gcc.gnu.org/wiki/GFortran
* Python 2.7.10 (or newer) https://www.python.org/downloads/release


-----------------------------------------------------------------------------

## To build the project

Type the following command line arguments

```
git clone https://github.com/jlokimlin/parallel_task_launcher.git

cd parallel_task_launcher; python launch_parallel_tasks.py

```
