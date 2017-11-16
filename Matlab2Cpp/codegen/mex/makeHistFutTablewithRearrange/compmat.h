/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * compmat.h
 *
 * Code generation for function 'compmat'
 *
 */

#ifndef COMPMAT_H
#define COMPMAT_H

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
#include "makeHistFutTablewithRearrange_types.h"

/* Function Declarations */
extern void compmat(const emlrtStack *sp, const emxArray_uint8_T *x, real_T dims,
                    emxArray_real_T *y);

#endif

/* End of code generation (compmat.h) */
