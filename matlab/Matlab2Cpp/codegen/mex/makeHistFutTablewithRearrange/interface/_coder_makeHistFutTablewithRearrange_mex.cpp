/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_makeHistFutTablewithRearrange_mex.cpp
 *
 * Code generation for function '_coder_makeHistFutTablewithRearrange_mex'
 *
 */

/* Include files */
#include "makeHistFutTablewithRearrange.h"
#include "_coder_makeHistFutTablewithRearrange_mex.h"
#include "makeHistFutTablewithRearrange_terminate.h"
#include "_coder_makeHistFutTablewithRearrange_api.h"
#include "makeHistFutTablewithRearrange_initialize.h"
#include "makeHistFutTablewithRearrange_data.h"

/* Function Declarations */
static void c_makeHistFutTablewithRearrange(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[4]);

/* Function Definitions */
static void c_makeHistFutTablewithRearrange(int32_T nlhs, mxArray *plhs[1],
  int32_T nrhs, const mxArray *prhs[4])
{
  int32_T n;
  const mxArray *inputs[4];
  const mxArray *outputs[1];
  int32_T b_nlhs;
  emlrtStack st = { NULL, NULL, NULL };

  st.tls = emlrtRootTLSGlobal;

  /* Check for proper number of arguments. */
  if (nrhs != 4) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:WrongNumberOfInputs", 5, 12, 4, 4,
                        29, "makeHistFutTablewithRearrange");
  }

  if (nlhs > 1) {
    emlrtErrMsgIdAndTxt(&st, "EMLRT:runTime:TooManyOutputArguments", 3, 4, 29,
                        "makeHistFutTablewithRearrange");
  }

  /* Temporary copy for mex inputs. */
  for (n = 0; n < nrhs; n++) {
    inputs[n] = prhs[n];
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }

  /* Call the function. */
  makeHistFutTablewithRearrange_api(inputs, outputs);

  /* Copy over outputs to the caller. */
  if (nlhs < 1) {
    b_nlhs = 1;
  } else {
    b_nlhs = nlhs;
  }

  emlrtReturnArrays(b_nlhs, plhs, outputs);

  /* Module termination. */
  makeHistFutTablewithRearrange_terminate();
}

void mexFunction(int32_T nlhs, mxArray *plhs[], int32_T nrhs, const mxArray
                 *prhs[])
{
  mexAtExit(makeHistFutTablewithRearrange_atexit);

  /* Initialize the memory manager. */
  /* Module initialization. */
  makeHistFutTablewithRearrange_initialize();

  /* Dispatch the entry-point. */
  c_makeHistFutTablewithRearrange(nlhs, plhs, nrhs, prhs);
}

emlrtCTX mexFunctionCreateRootTLS()
{
  emlrtCreateRootTLS(&emlrtRootTLSGlobal, &emlrtContextGlobal, NULL, 1);
  return emlrtRootTLSGlobal;
}

/* End of code generation (_coder_makeHistFutTablewithRearrange_mex.cpp) */
