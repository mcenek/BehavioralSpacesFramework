/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * makeHistFutTablewithRearrange.cpp
 *
 * Code generation for function 'makeHistFutTablewithRearrange'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTablewithRearrange.h"
#include "makeHistFutTablewithRearrange_emxutil.h"
#include "eml_int_forloop_overflow_check.h"
#include "compressedindex.h"
#include "compmat.h"
#include "makeHistFutTablewithRearrange_data.h"

/* Variable Definitions */
static emlrtRSInfo emlrtRSI = { 3, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo b_emlrtRSI = { 11, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo c_emlrtRSI = { 12, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo d_emlrtRSI = { 20, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo e_emlrtRSI = { 21, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo f_emlrtRSI = { 25, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRSInfo g_emlrtRSI = { 26, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRTEInfo emlrtRTEI = { 1, 18, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRTEInfo c_emlrtRTEI = { 10, 5, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRTEInfo d_emlrtRTEI = { 19, 5, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtRTEInfo e_emlrtRTEI = { 7, 1, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m" };

static emlrtBCInfo emlrtBCI = { -1, -1, 4, 19, "ctable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo b_emlrtBCI = { -1, -1, 4, 23, "ctable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtRTEInfo i_emlrtRTEI = { 6, 1, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m"
};

static emlrtDCInfo emlrtDCI = { 19, 20, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  1 };

static emlrtBCInfo c_emlrtBCI = { -1, -1, 19, 20, "testm",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtDCInfo b_emlrtDCI = { 37, 31, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  1 };

static emlrtBCInfo d_emlrtBCI = { -1, -1, 37, 31, "HistFutTable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtDCInfo c_emlrtDCI = { 37, 36, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  1 };

static emlrtBCInfo e_emlrtBCI = { -1, -1, 37, 36, "HistFutTable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtRTEInfo j_emlrtRTEI = { 11, 1, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m" };

static emlrtBCInfo f_emlrtBCI = { -1, -1, 8, 6, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo g_emlrtBCI = { -1, -1, 8, 14, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo h_emlrtBCI = { -1, -1, 9, 6, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo i_emlrtBCI = { -1, -1, 9, 8, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtRTEInfo l_emlrtRTEI = { 68, 1, "find",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\elmat\\find.m"
};

static emlrtDCInfo d_emlrtDCI = { 7, 14, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 1 };

static emlrtDCInfo e_emlrtDCI = { 7, 14, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 4 };

static emlrtDCInfo f_emlrtDCI = { 7, 20, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 1 };

static emlrtDCInfo g_emlrtDCI = { 7, 20, "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 4 };

static emlrtBCInfo j_emlrtBCI = { -1, -1, 10, 21, "testm",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtDCInfo h_emlrtDCI = { 10, 21, "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  1 };

static emlrtBCInfo k_emlrtBCI = { -1, -1, 27, 8, "rmat",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo l_emlrtBCI = { -1, -1, 28, 16, "rmat",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo m_emlrtBCI = { -1, -1, 30, 8, "rmat",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo n_emlrtBCI = { -1, -1, 31, 16, "rmat",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo o_emlrtBCI = { -1, -1, 38, 19, "HistFutTable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo p_emlrtBCI = { -1, -1, 38, 24, "HistFutTable",
  "makeHistFutTablewithRearrange",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\makeHistFutTablewithRearrange.m",
  0 };

static emlrtBCInfo q_emlrtBCI = { -1, -1, 13, 26, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo r_emlrtBCI = { -1, -1, 13, 30, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo s_emlrtBCI = { -1, -1, 13, 41, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo t_emlrtBCI = { -1, -1, 13, 43, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo u_emlrtBCI = { -1, -1, 13, 14, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

static emlrtBCInfo v_emlrtBCI = { -1, -1, 13, 16, "res", "comptable",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\comptable.m", 0 };

/* Function Definitions */
void makeHistFutTablewithRearrange(const emlrtStack *sp, const emxArray_uint8_T *
  testm, real_T range, real_T dims, const emxArray_real_T *rmat, emxArray_real_T
  *y)
{
  emxArray_real_T *res;
  int32_T k;
  real_T d0;
  real_T d1;
  int32_T nx;
  int32_T i;
  int32_T i2;
  int32_T i0;
  int32_T ii;
  int32_T its;
  emxArray_uint8_T *ahist;
  int32_T idx;
  emxArray_real_T *b_ahist;
  emxArray_real_T *afut;
  emxArray_boolean_T *x;
  boolean_T overflow;
  boolean_T exitg2;
  real_T d2;
  boolean_T exitg1;
  real_T xcor;
  real_T ycor;
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
  emxInit_real_T(sp, &res, 2, &e_emlrtRTEI, true);
  st.site = &emlrtRSI;

  /* Generates a reference table for the size of the square transition table */
  /* RData in the main program. Useful for finding which combinations of range */
  /* and dimensions are computationally feasible, and for preallocating */
  /* matrices which store this data.  */
  k = res->size[0] * res->size[1];
  if (!(range + 1.0 >= 0.0)) {
    emlrtNonNegativeCheckR2012b(range + 1.0, (emlrtDCInfo *)&e_emlrtDCI, &st);
  }

  d0 = range + 1.0;
  if (d0 != (int32_T)muDoubleScalarFloor(d0)) {
    emlrtIntegerCheckR2012b(d0, (emlrtDCInfo *)&d_emlrtDCI, &st);
  }

  res->size[0] = (int32_T)d0;
  if (!(dims >= 0.0)) {
    emlrtNonNegativeCheckR2012b(dims, (emlrtDCInfo *)&g_emlrtDCI, &st);
  }

  d0 = dims;
  if (d0 != (int32_T)muDoubleScalarFloor(d0)) {
    emlrtIntegerCheckR2012b(d0, (emlrtDCInfo *)&f_emlrtDCI, &st);
  }

  res->size[1] = (int32_T)d0;
  emxEnsureCapacity(&st, (emxArray__common *)res, k, (int32_T)sizeof(real_T),
                    &emlrtRTEI);
  if (!(range + 1.0 >= 0.0)) {
    emlrtNonNegativeCheckR2012b(range + 1.0, (emlrtDCInfo *)&e_emlrtDCI, &st);
  }

  d0 = range + 1.0;
  if (d0 != (int32_T)muDoubleScalarFloor(d0)) {
    emlrtIntegerCheckR2012b(d0, (emlrtDCInfo *)&d_emlrtDCI, &st);
  }

  if (!(dims >= 0.0)) {
    emlrtNonNegativeCheckR2012b(dims, (emlrtDCInfo *)&g_emlrtDCI, &st);
  }

  d1 = dims;
  if (d1 != (int32_T)muDoubleScalarFloor(d1)) {
    emlrtIntegerCheckR2012b(d1, (emlrtDCInfo *)&f_emlrtDCI, &st);
  }

  nx = (int32_T)d0 * (int32_T)d1;
  for (k = 0; k < nx; k++) {
    res->data[k] = 0.0;
  }

  if (1.0 > range + 1.0) {
    nx = 0;
  } else {
    k = (int32_T)(range + 1.0);
    if (!(1 <= k)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, k, (emlrtBCInfo *)&f_emlrtBCI, &st);
    }

    k = (int32_T)(range + 1.0);
    nx = (int32_T)(range + 1.0);
    if (!((nx >= 1) && (nx <= k))) {
      emlrtDynamicBoundsCheckR2012b(nx, 1, k, (emlrtBCInfo *)&f_emlrtBCI, &st);
    }
  }

  k = (int32_T)dims;
  if (!(1 <= k)) {
    emlrtDynamicBoundsCheckR2012b(1, 1, k, (emlrtBCInfo *)&g_emlrtBCI, &st);
  }

  for (k = 0; k < nx; k++) {
    res->data[k] = 1.0;
  }

  if (1.0 > dims) {
    nx = 0;
  } else {
    k = res->size[1];
    if (!(1 <= k)) {
      emlrtDynamicBoundsCheckR2012b(1, 1, k, (emlrtBCInfo *)&i_emlrtBCI, &st);
    }

    k = res->size[1];
    nx = (int32_T)dims;
    if (!((nx >= 1) && (nx <= k))) {
      emlrtDynamicBoundsCheckR2012b(nx, 1, k, (emlrtBCInfo *)&i_emlrtBCI, &st);
    }
  }

  k = res->size[0];
  if (!(1 <= k)) {
    emlrtDynamicBoundsCheckR2012b(1, 1, k, (emlrtBCInfo *)&h_emlrtBCI, &st);
  }

  for (k = 0; k < nx; k++) {
    res->data[res->size[0] * k] = 1.0;
  }

  emlrtForLoopVectorCheckR2012b(2.0, 1.0, range + 1.0, mxDOUBLE_CLASS, (int32_T)
    ((range + 1.0) + -1.0), (emlrtRTEInfo *)&j_emlrtRTEI, &st);
  i = 0;
  while (i <= (int32_T)((range + 1.0) + -1.0) - 1) {
    i2 = 2;
    while (i2 - 2 <= (int32_T)dims - 2) {
      k = res->size[0];
      i0 = (int32_T)((2.0 + (real_T)i) - 1.0);
      if (!((i0 >= 1) && (i0 <= k))) {
        emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&q_emlrtBCI, &st);
      }

      k = res->size[1];
      if (!((i2 >= 1) && (i2 <= k))) {
        emlrtDynamicBoundsCheckR2012b(i2, 1, k, (emlrtBCInfo *)&r_emlrtBCI, &st);
      }

      k = res->size[0];
      ii = (int32_T)(2.0 + (real_T)i);
      if (!((ii >= 1) && (ii <= k))) {
        emlrtDynamicBoundsCheckR2012b(ii, 1, k, (emlrtBCInfo *)&s_emlrtBCI, &st);
      }

      k = res->size[1];
      nx = i2 - 1;
      if (!((nx >= 1) && (nx <= k))) {
        emlrtDynamicBoundsCheckR2012b(nx, 1, k, (emlrtBCInfo *)&t_emlrtBCI, &st);
      }

      k = res->size[0];
      idx = (int32_T)(2.0 + (real_T)i);
      if (!((idx >= 1) && (idx <= k))) {
        emlrtDynamicBoundsCheckR2012b(idx, 1, k, (emlrtBCInfo *)&u_emlrtBCI, &st);
      }

      k = res->size[1];
      if (!((i2 >= 1) && (i2 <= k))) {
        emlrtDynamicBoundsCheckR2012b(i2, 1, k, (emlrtBCInfo *)&v_emlrtBCI, &st);
      }

      res->data[(idx + res->size[0] * (i2 - 1)) - 1] = res->data[(i0 + res->
        size[0] * (i2 - 1)) - 1] + res->data[(ii + res->size[0] * (nx - 1)) - 1];
      i2++;
      if (*emlrtBreakCheckR2012bFlagVar != 0) {
        emlrtBreakCheckR2012b(&st);
      }
    }

    i++;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(&st);
    }
  }

  k = res->size[0];
  i0 = res->size[0];
  if (!((i0 >= 1) && (i0 <= k))) {
    emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&emlrtBCI, sp);
  }

  k = res->size[1];
  i0 = res->size[1];
  if (!((i0 >= 1) && (i0 <= k))) {
    emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&b_emlrtBCI, sp);
  }

  k = y->size[0] * y->size[1];
  y->size[0] = (int32_T)res->data[(res->size[0] + res->size[0] * (res->size[1] -
    1)) - 1];
  y->size[1] = (int32_T)res->data[(res->size[0] + res->size[0] * (res->size[1] -
    1)) - 1];
  emxEnsureCapacity(sp, (emxArray__common *)y, k, (int32_T)sizeof(real_T),
                    &emlrtRTEI);
  nx = (int32_T)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1)) - 1]
    * (int32_T)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1)) - 1];
  for (k = 0; k < nx; k++) {
    y->data[k] = 0.0;
  }

  d0 = (real_T)testm->size[1] - range * 2.0;
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, d0, mxDOUBLE_CLASS, (int32_T)d0,
    (emlrtRTEInfo *)&i_emlrtRTEI, sp);
  its = 0;
  emxInit_uint8_T(sp, &ahist, 2, &c_emlrtRTEI, true);
  emxInit_real_T(sp, &b_ahist, 2, &c_emlrtRTEI, true);
  emxInit_real_T(sp, &afut, 2, &d_emlrtRTEI, true);
  emxInit_boolean_T(sp, &x, 2, &emlrtRTEI, true);
  while (its <= (int32_T)d0 - 1) {
    /* for previous and future of an agent, write event in the result matrix */
    /* incrementing the value by 1 */
    idx = testm->size[1];
    k = ahist->size[0] * ahist->size[1];
    ahist->size[0] = 1;
    ahist->size[1] = (int32_T)muDoubleScalarFloor(range - 1.0) + 1;
    emxEnsureCapacity(sp, (emxArray__common *)ahist, k, (int32_T)sizeof(uint8_T),
                      &emlrtRTEI);
    nx = (int32_T)muDoubleScalarFloor(range - 1.0);
    for (k = 0; k <= nx; k++) {
      d1 = (1.0 + (real_T)its) + (real_T)k;
      if (d1 != (int32_T)d1) {
        emlrtIntegerCheckR2012b(d1, (emlrtDCInfo *)&h_emlrtDCI, sp);
      }

      i0 = (int32_T)d1;
      if (!((i0 >= 1) && (i0 <= idx))) {
        emlrtDynamicBoundsCheckR2012b(i0, 1, idx, (emlrtBCInfo *)&j_emlrtBCI, sp);
      }

      ahist->data[ahist->size[0] * k] = testm->data[testm->size[0] * (i0 - 1)];
    }

    st.site = &b_emlrtRSI;
    k = x->size[0] * x->size[1];
    x->size[0] = 1;
    x->size[1] = ahist->size[1];
    emxEnsureCapacity(&st, (emxArray__common *)x, k, (int32_T)sizeof(boolean_T),
                      &emlrtRTEI);
    nx = ahist->size[0] * ahist->size[1];
    for (k = 0; k < nx; k++) {
      x->data[k] = (ahist->data[k] == 0);
    }

    b_st.site = &h_emlrtRSI;
    nx = x->size[1];
    k = muIntScalarMin_sint32(1, nx);
    if (k <= x->size[1]) {
    } else {
      emlrtErrorWithMessageIdR2012b(&b_st, &l_emlrtRTEI,
        "Coder:builtins:AssertionFailed", 0);
    }

    idx = 0;
    c_st.site = &i_emlrtRSI;
    overflow = ((!(1 > x->size[1])) && (x->size[1] > 2147483646));
    if (overflow) {
      d_st.site = &j_emlrtRSI;
      check_forloop_overflow_error(&d_st);
    }

    ii = 1;
    exitg2 = false;
    while ((!exitg2) && (ii <= nx)) {
      if (x->data[ii - 1]) {
        idx = 1;
        exitg2 = true;
      } else {
        ii++;
      }
    }

    if (idx <= k) {
    } else {
      emlrtErrorWithMessageIdR2012b(&b_st, &k_emlrtRTEI,
        "Coder:builtins:AssertionFailed", 0);
    }

    if (k == 1) {
      if (idx == 0) {
        k = 0;
      }
    } else {
      k = !(1 > idx);
    }

    if (k == 0) {
      st.site = &c_emlrtRSI;
      compmat(&st, ahist, dims, b_ahist);

      /* if there is a 0 in the history or future of an agent, that indicates  */
      /* a break between one agent's history and the next, which is garbage */
      /* data and is therefore skipped */
      d1 = (1.0 + (real_T)its) + range;
      d2 = (1.0 + (real_T)its) + (range * 2.0 - 1.0);
      if (d1 > d2) {
        k = 0;
        ii = 0;
      } else {
        if (d1 != (int32_T)muDoubleScalarFloor(d1)) {
          emlrtIntegerCheckR2012b(d1, (emlrtDCInfo *)&emlrtDCI, sp);
        }

        k = testm->size[1];
        i0 = (int32_T)d1;
        if (!((i0 >= 1) && (i0 <= k))) {
          emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&c_emlrtBCI, sp);
        }

        k = i0 - 1;
        if (d2 != (int32_T)muDoubleScalarFloor(d2)) {
          emlrtIntegerCheckR2012b(d2, (emlrtDCInfo *)&emlrtDCI, sp);
        }

        i0 = testm->size[1];
        ii = (int32_T)d2;
        if (!((ii >= 1) && (ii <= i0))) {
          emlrtDynamicBoundsCheckR2012b(ii, 1, i0, (emlrtBCInfo *)&c_emlrtBCI,
            sp);
        }
      }

      i0 = ahist->size[0] * ahist->size[1];
      ahist->size[0] = 1;
      ahist->size[1] = ii - k;
      emxEnsureCapacity(sp, (emxArray__common *)ahist, i0, (int32_T)sizeof
                        (uint8_T), &emlrtRTEI);
      nx = ii - k;
      for (i0 = 0; i0 < nx; i0++) {
        ahist->data[ahist->size[0] * i0] = testm->data[testm->size[0] * (k + i0)];
      }

      st.site = &d_emlrtRSI;
      k = x->size[0] * x->size[1];
      x->size[0] = 1;
      x->size[1] = ahist->size[1];
      emxEnsureCapacity(&st, (emxArray__common *)x, k, (int32_T)sizeof(boolean_T),
                        &emlrtRTEI);
      nx = ahist->size[0] * ahist->size[1];
      for (k = 0; k < nx; k++) {
        x->data[k] = (ahist->data[k] == 0);
      }

      b_st.site = &h_emlrtRSI;
      nx = x->size[1];
      k = muIntScalarMin_sint32(1, nx);
      if (k <= x->size[1]) {
      } else {
        emlrtErrorWithMessageIdR2012b(&b_st, &l_emlrtRTEI,
          "Coder:builtins:AssertionFailed", 0);
      }

      idx = 0;
      c_st.site = &i_emlrtRSI;
      overflow = ((!(1 > x->size[1])) && (x->size[1] > 2147483646));
      if (overflow) {
        d_st.site = &j_emlrtRSI;
        check_forloop_overflow_error(&d_st);
      }

      ii = 1;
      exitg1 = false;
      while ((!exitg1) && (ii <= nx)) {
        if (x->data[ii - 1]) {
          idx = 1;
          exitg1 = true;
        } else {
          ii++;
        }
      }

      if (idx <= k) {
      } else {
        emlrtErrorWithMessageIdR2012b(&b_st, &k_emlrtRTEI,
          "Coder:builtins:AssertionFailed", 0);
      }

      if (k == 1) {
        if (idx == 0) {
          k = 0;
        }
      } else {
        k = !(1 > idx);
      }

      if (k == 0) {
        st.site = &e_emlrtRSI;
        compmat(&st, ahist, dims, afut);
        st.site = &f_emlrtRSI;
        xcor = compressedindex(&st, b_ahist, res, range, dims);
        st.site = &g_emlrtRSI;
        ycor = compressedindex(&st, afut, res, range, dims);
        k = rmat->size[0];
        i0 = (int32_T)xcor;
        if (!((i0 >= 1) && (i0 <= k))) {
          emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&k_emlrtBCI, sp);
        }

        if (rmat->data[i0 - 1] != -1.0) {
          k = rmat->size[0];
          i0 = (int32_T)xcor;
          if (!((i0 >= 1) && (i0 <= k))) {
            emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&l_emlrtBCI,
              sp);
          }

          xcor = rmat->data[i0 - 1];
        }

        k = rmat->size[0];
        i0 = (int32_T)ycor;
        if (!((i0 >= 1) && (i0 <= k))) {
          emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&m_emlrtBCI, sp);
        }

        if (rmat->data[i0 - 1] != -1.0) {
          k = rmat->size[0];
          i0 = (int32_T)ycor;
          if (!((i0 >= 1) && (i0 <= k))) {
            emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&n_emlrtBCI,
              sp);
          }

          ycor = rmat->data[i0 - 1];
        }

        if ((xcor == 0.0) || (ycor == 0.0)) {
        } else {
          if (ycor != (int32_T)muDoubleScalarFloor(ycor)) {
            emlrtIntegerCheckR2012b(ycor, (emlrtDCInfo *)&b_emlrtDCI, sp);
          }

          k = y->size[0];
          i0 = (int32_T)ycor;
          if (!((i0 >= 1) && (i0 <= k))) {
            emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&d_emlrtBCI,
              sp);
          }

          if (xcor != (int32_T)muDoubleScalarFloor(xcor)) {
            emlrtIntegerCheckR2012b(xcor, (emlrtDCInfo *)&c_emlrtDCI, sp);
          }

          k = y->size[1];
          i0 = (int32_T)xcor;
          if (!((i0 >= 1) && (i0 <= k))) {
            emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&e_emlrtBCI,
              sp);
          }

          k = y->size[0];
          i0 = (int32_T)ycor;
          if (!((i0 >= 1) && (i0 <= k))) {
            emlrtDynamicBoundsCheckR2012b(i0, 1, k, (emlrtBCInfo *)&o_emlrtBCI,
              sp);
          }

          k = y->size[1];
          ii = (int32_T)xcor;
          if (!((ii >= 1) && (ii <= k))) {
            emlrtDynamicBoundsCheckR2012b(ii, 1, k, (emlrtBCInfo *)&p_emlrtBCI,
              sp);
          }

          y->data[(i0 + y->size[0] * (ii - 1)) - 1] = y->data[((int32_T)ycor +
            y->size[0] * ((int32_T)xcor - 1)) - 1] + 1.0;
        }
      }
    }

    its++;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  emxFree_boolean_T(&x);
  emxFree_real_T(&res);
  emxFree_real_T(&afut);
  emxFree_real_T(&b_ahist);
  emxFree_uint8_T(&ahist);
  emlrtHeapReferenceStackLeaveFcnR2012b(sp);
}

/* End of code generation (makeHistFutTablewithRearrange.cpp) */
