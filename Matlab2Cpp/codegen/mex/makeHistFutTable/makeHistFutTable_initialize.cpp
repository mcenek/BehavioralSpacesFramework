/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * makeHistFutTable_initialize.cpp
 *
 * Code generation for function 'makeHistFutTable_initialize'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "makeHistFutTable_initialize.h"
#include "_coder_makeHistFutTable_mex.h"
#include "makeHistFutTable_data.h"

/* Function Definitions */
void makeHistFutTable_initialize()
{
  emlrtStack st = { NULL, NULL, NULL };

  mexFunctionCreateRootTLS();
  emlrtBreakCheckR2012bFlagVar = emlrtGetBreakCheckFlagAddressR2012b();
  st.tls = emlrtRootTLSGlobal;
  emlrtClearAllocCountR2012b(&st, false, 0U, 0);
  emlrtEnterRtStackR2012b(&st);
  emlrtFirstTimeR2012b(emlrtRootTLSGlobal);
}

/* End of code generation (makeHistFutTable_initialize.cpp) */
