/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * compmat.cpp
 *
 * Code generation for function 'compmat'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTablewithRearrange.h"
#include "compmat.h"
#include "makeHistFutTablewithRearrange_emxutil.h"
#include "eml_int_forloop_overflow_check.h"
#include "makeHistFutTablewithRearrange_data.h"

/* Variable Definitions */
static emlrtRSInfo k_emlrtRSI = { 6, "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m" };

static emlrtRTEInfo b_emlrtRTEI = { 253, 13, "find",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m"
};

static emlrtRTEInfo f_emlrtRTEI = { 1, 18, "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m" };

static emlrtRTEInfo g_emlrtRTEI = { 36, 6, "find",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m"
};

static emlrtRTEInfo n_emlrtRTEI = { 5, 1, "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m" };

static emlrtDCInfo i_emlrtDCI = { 4, 15, "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m", 1 };

static emlrtDCInfo j_emlrtDCI = { 4, 15, "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m", 4 };

static emlrtBCInfo w_emlrtBCI = { -1, -1, 7, 5, "py", "compmat",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compmat.m", 0 };

/* Function Definitions */
void compmat(const emlrtStack *sp, const emxArray_uint8_T *x, real_T dims,
             emxArray_real_T *y)
{
  int32_T i1;
  real_T d3;
  int32_T ii;
  int32_T i;
  emxArray_boolean_T *b_x;
  emxArray_int32_T *b_ii;
  int32_T nx;
  int32_T idx;
  boolean_T overflow;
  boolean_T exitg1;
  boolean_T guard1 = false;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  emlrtHeapReferenceStackEnterFcnR2012b(sp);

  /* UNTITLED Summary of this function goes here */
  /*    Detailed explanation goes here */
  i1 = y->size[0] * y->size[1];
  y->size[0] = 1;
  if (!(dims >= 0.0)) {
    emlrtNonNegativeCheckR2012b(dims, (emlrtDCInfo *)&j_emlrtDCI, sp);
  }

  d3 = dims;
  if (d3 != (int32_T)muDoubleScalarFloor(d3)) {
    emlrtIntegerCheckR2012b(d3, (emlrtDCInfo *)&i_emlrtDCI, sp);
  }

  y->size[1] = (int32_T)d3;
  emxEnsureCapacity(sp, (emxArray__common *)y, i1, (int32_T)sizeof(real_T),
                    &f_emlrtRTEI);
  if (!(dims >= 0.0)) {
    emlrtNonNegativeCheckR2012b(dims, (emlrtDCInfo *)&j_emlrtDCI, sp);
  }

  if (d3 != (int32_T)muDoubleScalarFloor(d3)) {
    emlrtIntegerCheckR2012b(d3, (emlrtDCInfo *)&i_emlrtDCI, sp);
  }

  ii = (int32_T)d3;
  for (i1 = 0; i1 < ii; i1++) {
    y->data[i1] = 0.0;
  }

  emlrtForLoopVectorCheckR2012b(1.0, 1.0, dims, mxDOUBLE_CLASS, (int32_T)dims,
    (emlrtRTEInfo *)&n_emlrtRTEI, sp);
  i = 0;
  emxInit_boolean_T(sp, &b_x, 2, &f_emlrtRTEI, true);
  emxInit_int32_T(sp, &b_ii, 2, &g_emlrtRTEI, true);
  while (i <= (int32_T)dims - 1) {
    st.site = &k_emlrtRSI;
    i1 = b_x->size[0] * b_x->size[1];
    b_x->size[0] = 1;
    b_x->size[1] = x->size[1];
    emxEnsureCapacity(&st, (emxArray__common *)b_x, i1, (int32_T)sizeof
                      (boolean_T), &f_emlrtRTEI);
    ii = x->size[0] * x->size[1];
    for (i1 = 0; i1 < ii; i1++) {
      b_x->data[i1] = (x->data[i1] == 1.0 + (real_T)i);
    }

    b_st.site = &h_emlrtRSI;
    nx = b_x->size[1];
    idx = 0;
    i1 = b_ii->size[0] * b_ii->size[1];
    b_ii->size[0] = 1;
    b_ii->size[1] = b_x->size[1];
    emxEnsureCapacity(&b_st, (emxArray__common *)b_ii, i1, (int32_T)sizeof
                      (int32_T), &f_emlrtRTEI);
    c_st.site = &i_emlrtRSI;
    overflow = ((!(1 > b_x->size[1])) && (b_x->size[1] > 2147483646));
    if (overflow) {
      d_st.site = &j_emlrtRSI;
      check_forloop_overflow_error(&d_st);
    }

    ii = 1;
    exitg1 = false;
    while ((!exitg1) && (ii <= nx)) {
      guard1 = false;
      if (b_x->data[ii - 1]) {
        idx++;
        b_ii->data[idx - 1] = ii;
        if (idx >= nx) {
          exitg1 = true;
        } else {
          guard1 = true;
        }
      } else {
        guard1 = true;
      }

      if (guard1) {
        ii++;
      }
    }

    if (idx <= b_x->size[1]) {
    } else {
      emlrtErrorWithMessageIdR2012b(&b_st, &k_emlrtRTEI,
        "Coder:builtins:AssertionFailed", 0);
    }

    if (b_x->size[1] == 1) {
      if (idx == 0) {
        i1 = b_ii->size[0] * b_ii->size[1];
        b_ii->size[0] = 1;
        b_ii->size[1] = 0;
        emxEnsureCapacity(&b_st, (emxArray__common *)b_ii, i1, (int32_T)sizeof
                          (int32_T), &f_emlrtRTEI);
      }
    } else {
      i1 = b_ii->size[0] * b_ii->size[1];
      if (1 > idx) {
        b_ii->size[1] = 0;
      } else {
        b_ii->size[1] = idx;
      }

      emxEnsureCapacity(&b_st, (emxArray__common *)b_ii, i1, (int32_T)sizeof
                        (int32_T), &b_emlrtRTEI);
    }

    i1 = y->size[1];
    if (!((i + 1 >= 1) && (i + 1 <= i1))) {
      emlrtDynamicBoundsCheckR2012b(i + 1, 1, i1, (emlrtBCInfo *)&w_emlrtBCI, sp);
    }

    y->data[i] = b_ii->size[1];
    i++;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  emxFree_int32_T(&b_ii);
  emxFree_boolean_T(&b_x);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (compmat.cpp) */
