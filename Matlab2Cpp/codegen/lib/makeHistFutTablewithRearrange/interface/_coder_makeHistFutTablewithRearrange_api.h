/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 * File: _coder_makeHistFutTablewithRearrange_api.h
 *
 * MATLAB Coder version            : 3.1
 * C/C++ source code generated on  : 22-May-2017 23:00:57
 */

#ifndef _CODER_MAKEHISTFUTTABLEWITHREARRANGE_API_H
#define _CODER_MAKEHISTFUTTABLEWITHREARRANGE_API_H

/* Include Files */
#include "tmwtypes.h"
#include "mex.h"
#include "emlrt.h"
#include <stddef.h>
#include <stdlib.h>
#include "_coder_makeHistFutTablewithRearrange_api.h"

/* Type Definitions */
#ifndef struct_emxArray_real_T
#define struct_emxArray_real_T

struct emxArray_real_T
{
  real_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_real_T*/

#ifndef typedef_emxArray_real_T
#define typedef_emxArray_real_T

typedef struct emxArray_real_T emxArray_real_T;

#endif                                 /*typedef_emxArray_real_T*/

#ifndef struct_emxArray_uint8_T
#define struct_emxArray_uint8_T

struct emxArray_uint8_T
{
  uint8_T *data;
  int32_T *size;
  int32_T allocatedSize;
  int32_T numDimensions;
  boolean_T canFreeData;
};

#endif                                 /*struct_emxArray_uint8_T*/

#ifndef typedef_emxArray_uint8_T
#define typedef_emxArray_uint8_T

typedef struct emxArray_uint8_T emxArray_uint8_T;

#endif                                 /*typedef_emxArray_uint8_T*/

/* Variable Declarations */
extern emlrtCTX emlrtRootTLSGlobal;
extern emlrtContext emlrtContextGlobal;

/* Function Declarations */
extern void makeHistFutTablewithRearrange(emxArray_uint8_T *testm, real_T range,
  real_T dims, emxArray_real_T *rmat, emxArray_real_T *y);
extern void makeHistFutTablewithRearrange_api(const mxArray *prhs[4], const
  mxArray *plhs[1]);
extern void makeHistFutTablewithRearrange_atexit(void);
extern void makeHistFutTablewithRearrange_initialize(void);
extern void makeHistFutTablewithRearrange_terminate(void);
extern void makeHistFutTablewithRearrange_xil_terminate(void);

#endif

/*
 * File trailer for _coder_makeHistFutTablewithRearrange_api.h
 *
 * [EOF]
 */
