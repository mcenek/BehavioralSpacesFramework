@echo off
set MATLAB=C:\PROGRA~1\MATLAB\R2016a
set MATLAB_ARCH=win64
set MATLAB_BIN="C:\Program Files\MATLAB\R2016a\bin"
set ENTRYPOINT=mexFunction
set OUTDIR=.\
set LIB_NAME=makeHistFutTablewithRearrangeO3_mex
set MEX_NAME=makeHistFutTablewithRearrangeO3_mex
set MEX_EXT=.mexw64
call setEnv.bat
echo # Make settings for makeHistFutTablewithRearrange > makeHistFutTablewithRearrange_mex.mki
echo COMPILER=%COMPILER%>> makeHistFutTablewithRearrange_mex.mki
echo COMPFLAGS=%COMPFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo OPTIMFLAGS=%OPTIMFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo DEBUGFLAGS=%DEBUGFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo LINKER=%LINKER%>> makeHistFutTablewithRearrange_mex.mki
echo LINKFLAGS=%LINKFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo LINKOPTIMFLAGS=%LINKOPTIMFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo LINKDEBUGFLAGS=%LINKDEBUGFLAGS%>> makeHistFutTablewithRearrange_mex.mki
echo MATLAB_ARCH=%MATLAB_ARCH%>> makeHistFutTablewithRearrange_mex.mki
echo BORLAND=%BORLAND%>> makeHistFutTablewithRearrange_mex.mki
echo OMPFLAGS= >> makeHistFutTablewithRearrange_mex.mki
echo OMPLINKFLAGS= >> makeHistFutTablewithRearrange_mex.mki
echo EMC_COMPILER=mingw64>> makeHistFutTablewithRearrange_mex.mki
echo EMC_CONFIG=optim>> makeHistFutTablewithRearrange_mex.mki
"C:\Program Files\MATLAB\R2016a\bin\win64\gmake" -B -f makeHistFutTablewithRearrange_mex.mk
