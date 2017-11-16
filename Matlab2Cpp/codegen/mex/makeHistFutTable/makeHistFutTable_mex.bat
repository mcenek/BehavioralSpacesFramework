@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2016a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2016a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=makeHistFutTable_mex
set MEX_NAME=makeHistFutTable_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for makeHistFutTable > makeHistFutTable_mex.mki
echo COMPILER=%COMPILER%>> makeHistFutTable_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> makeHistFutTable_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> makeHistFutTable_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> makeHistFutTable_mex.mki
echo LINKER=%LINKER%>> makeHistFutTable_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> makeHistFutTable_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> makeHistFutTable_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> makeHistFutTable_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> makeHistFutTable_mex.mki
echo BORLAND=%BORLAND%>> makeHistFutTable_mex.mki
echo OMPFLAGS= >> makeHistFutTable_mex.mki
echo OMPLINKFLAGS= >> makeHistFutTable_mex.mki
echo EMC_COMPILER=mingw64>> makeHistFutTable_mex.mki
echo EMC_CONFIG=optim>> makeHistFutTable_mex.mki
"C:\Program Files\MATLAB\R2016a\bin\win64\gmake" -B -f makeHistFutTable_mex.mk
