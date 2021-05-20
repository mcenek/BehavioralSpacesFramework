/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * makeHistFutTablewithRearrange_terminate.cpp
 *
 * Code generation for function 'makeHistFutTablewithRearrange_terminate'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTablewithRearrange.h"
#include "makeHistFutTablewithRearrange_terminate.h"
#include "_coder_makeHistFutTablewithRearrange_mex.h"
#include "makeHistFutTablewithRearrange_data.h"

/* Function Definitions */
void makeHistFutTablewithRearrange_atexit()
{
  emlrtStack st = { NULL, NULL, NULL };

  mexFunctionCreateRootTLS();
  st.tls = emlrtRootTLSGlobal;
  emlrtEnterRtStackR2012b(&st);
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

void makeHistFutTablewithRearrange_terminate()
{
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;
  emlrtLeaveRtStackR2012b(&st);
  emlrtDestroyRootTLS(&emlrtRootTLSGlobal);
}

/* End of code generation (makeHistFutTablewithRearrange_terminate.cpp) */
