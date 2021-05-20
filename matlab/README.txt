Readme:
Netlogo:
For program "Grav Attractors with Tick Reporting"

Data is outputted as a txt file formatted as [direction (out of 4)],[who (agent identifier)],
[tick]. Order of these tuples matters, order between tuples does not matter when the output
is parsed by Matlab. 

The tick limit is the desired number of ticks every run. By default this is 20k ticks.

The "iterations" variable controls the vision for each run. By default it is set up to
provide 14 runs at 0.5 vision intervals from 0 to 7.

Directory in the "files" function must be modified for the local machine.

Matlab: 
Main program is "Mainwithticks"

Data is expected in the format described above, [direction],[who],[tick]. This can be modified
in the "importwithtime" function. 

Line 30 must be modified to match the directory and file name of the data. Currently the model is
setup to automatically iterate through large sets of data. This can be changed with the 
statreps and totreps variables on lines 6 and 7, which control how many input files and
how many times each file should be computed respectively. 

For data export: the function exportdata exports the final behavioral matrix in csv form. 
The directory in this function must be modified locally for it to work. 

The function save also exports the final behavioral matrix. This function does not require modification
and always saves to the active matlab directory. 
