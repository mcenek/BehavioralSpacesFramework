/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * compressedindex.h
 *
 * Code generation for function 'compressedindex'
 *
 */

#ifndef COMPRESSEDINDEX_H
#define COMPRESSEDINDEX_H

/* Include files */
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include "mwmathutil.h"
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include "rtwtypes.h"
#include "makeHistFutTable_types.h"

/* Function Declarations */
extern real_T compressedindex(const emlrtStack *sp, const emxArray_real_T *x,
  const emxArray_real_T *ctable, real_T range, real_T dims);

#ifdef __WATCOMC__

#pragma aux compressedindex value [8087];

#endif
#endif

/* End of code generation (compressedindex.h) */
