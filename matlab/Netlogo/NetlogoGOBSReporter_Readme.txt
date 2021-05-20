1. Add __includes ["NetlogoGOBSReporter.nls"]
2. Add these globals: 
filename
dims
threshold
3. Add these variables to the breed we're using (sockeye)
history
spx
spy
sx
sy
pmov
angle

4. Add this to setup: 
files
set dims 4
set threshold 2
5. Add this procedure to the end of go: 
report-position
6. Add these procedures to the finishing routine (immediately before the model ends)
finish
