//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: makeHistFutTable_emxutil.h
//
// MATLAB Coder version            : 3.1
// C/C++ source code generated on  : 18-May-2017 14:02:42
//
#ifndef MAKEHISTFUTTABLE_EMXUTIL_H
#define MAKEHISTFUTTABLE_EMXUTIL_H

// Include Files
#include <math.h>
#include <stddef.h>
#include <stdlib.h>
#include <string.h>
#include "rtwtypes.h"
#include "makeHistFutTable_types.h"

// Function Declarations
extern void emxEnsureCapacity(emxArray__common *emxArray, int oldNumel, int
  elementSize);
extern void emxFree_boolean_T(emxArray_boolean_T **pEmxArray);
extern void emxFree_int32_T(emxArray_int32_T **pEmxArray);
extern void emxFree_real_T(emxArray_real_T **pEmxArray);
extern void emxFree_uint8_T(emxArray_uint8_T **pEmxArray);
extern void emxInit_boolean_T(emxArray_boolean_T **pEmxArray, int numDimensions);
extern void emxInit_int32_T(emxArray_int32_T **pEmxArray, int numDimensions);
extern void emxInit_real_T(emxArray_real_T **pEmxArray, int numDimensions);
extern void emxInit_uint8_T(emxArray_uint8_T **pEmxArray, int numDimensions);

#endif

//
// File trailer for makeHistFutTable_emxutil.h
//
// [EOF]
//