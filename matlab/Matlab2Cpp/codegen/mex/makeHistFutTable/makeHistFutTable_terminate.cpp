/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * makeHistFutTable_terminate.cpp
 *
 * Code generation for function 'makeHistFutTable_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "makeHistFutTable_terminate.h"
#include "_coder_makeHistFutTable_mex.h"
#include "makeHistFutTable_data.h"

/* Function Definitions */
void makeHistFutTable_atexit()
{
  emlrtStack st = { NULL, NULL, NULL };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void makeHistFutTable_terminate()
{
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (makeHistFutTable_terminate.cpp) */
