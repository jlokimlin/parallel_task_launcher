#!/usr/bin/python

import os
import subprocess
from concurrent.futures import ThreadPoolExecutor

# Open read-only text file with task variables
input = open('var_grid.txt', 'r')
var_grid = input.readlines()

# Create directory for Fortran Input/Output
io_path = './fortran_io/'
if not os.path.isdir(io_path):
    os.makedirs(io_path)

    
def launch_task(var):
    io_name = io_path + 'stdout_var=' + var.replace(" ", "").rstrip().lstrip() + '.txt'
    io_file = open(io_name, 'w')
    p = subprocess.Popen("./main.exe %s" % var, stdout=io_file, stderr=io_file, shell=True)
    print "Starting task with var = %s" % var
    p.communicate()
    print "Finished task with var = %s" % var

    
# Build executable main.exe
os.system('cd fortran_src; make run; cd ../')


# Perform 5 tasks at a time
executor = ThreadPoolExecutor(max_workers=5)
futures = []
for var in var_grid:
    task = executor.submit(launch_task, var)
    futures.append(task)
