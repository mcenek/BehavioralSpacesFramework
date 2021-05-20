/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * compressedindex.cpp
 *
 * Code generation for function 'compressedindex'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "compressedindex.h"
#include "eml_int_forloop_overflow_check.h"
#include "makeHistFutTable_data.h"

/* Variable Definitions */
static emlrtRSInfo l_emlrtRSI = { 9, "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m" };

static emlrtRSInfo m_emlrtRSI = { 9, "sum",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\datafun\\sum.m"
};

static emlrtRSInfo n_emlrtRSI = { 58, "sumprod",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\sumprod.m"
};

static emlrtRSInfo o_emlrtRSI = { 69, "combine_vector_elements",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\combine_vector_elements.m"
};

static emlrtRTEInfo o_emlrtRTEI = { 6, 1, "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m" };

static emlrtDCInfo i_emlrtDCI = { 9, 32, "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 1 };

static emlrtBCInfo t_emlrtBCI = { -1, -1, 9, 32, "ctable", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

static emlrtDCInfo j_emlrtDCI = { 9, 57, "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 1 };

static emlrtBCInfo u_emlrtBCI = { -1, -1, 9, 57, "ctable", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

static emlrtRTEInfo p_emlrtRTEI = { 20, 15, "sumprod",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\sumprod.m"
};

static emlrtRTEInfo q_emlrtRTEI = { 48, 9, "sumprod",
  "C:\\Program Files\\MATLAB\\R2016a\\toolbox\\eml\\lib\\matlab\\datafun\\private\\sumprod.m"
};

static emlrtBCInfo v_emlrtBCI = { -1, -1, 13, 10, "x", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

static emlrtBCInfo w_emlrtBCI = { -1, -1, 7, 8, "x", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

static emlrtBCInfo x_emlrtBCI = { -1, -1, 9, 41, "x", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

static emlrtBCInfo y_emlrtBCI = { -1, -1, 10, 26, "x", "compressedindex",
  "C:\\Users\\Spencer\\Documents\\MATLAB\\CurverCPPprep\\compressedindex.m", 0 };

/* Function Definitions */
real_T compressedindex(const emlrtStack *sp, const emxArray_real_T *x, const
  emxArray_real_T *ctable, real_T range, real_T dims)
{
  real_T y;
  real_T py;
  int32_T i;
  int32_T i2;
  int32_T i3;
  real_T d4;
  int32_T k;
  int32_T vlen;
  boolean_T p;
  boolean_T b_p;
  int32_T exitg1;
  int32_T b_k;
  emlrtStack st;
  emlrtStack b_st;
  emlrtStack c_st;
  emlrtStack d_st;
  emlrtStack e_st;
  st.prev = sp;
  st.tls = sp->tls;
  b_st.prev = &st;
  b_st.tls = st.tls;
  c_st.prev = &b_st;
  c_st.tls = b_st.tls;
  d_st.prev = &c_st;
  d_st.tls = c_st.tls;
  e_st.prev = &d_st;
  e_st.tls = d_st.tls;

  /* for a  given vector, find its index within the transition space matrix */
  /* workspace; */
  py = 1.0;
  range++;
  emlrtForLoopVectorCheckR2012b(1.0, 1.0, dims - 2.0, mxDOUBLE_CLASS, (int32_T)
    (dims - 2.0), (emlrtRTEInfo *)&o_emlrtRTEI, sp);
  i = 0;
  while (i <= (int32_T)(dims - 2.0) - 1) {
    i2 = x->size[1];
    if (!((i + 1 >= 1) && (i + 1 <= i2))) {
      emlrtDynamicBoundsCheckR2012b(i + 1, 1, i2, (emlrtBCInfo *)&w_emlrtBCI, sp);
    }

    if (x->data[i] == 0.0) {
    } else {
      i2 = x->size[1];
      if (!((i + 1 >= 1) && (i + 1 <= i2))) {
        emlrtDynamicBoundsCheckR2012b(i + 1, 1, i2, (emlrtBCInfo *)&x_emlrtBCI,
          sp);
      }

      d4 = range - (x->data[i] - 1.0);
      if (d4 > range) {
        i3 = 1;
        i2 = 1;
      } else {
        if (d4 != (int32_T)muDoubleScalarFloor(d4)) {
          emlrtIntegerCheckR2012b(d4, (emlrtDCInfo *)&i_emlrtDCI, sp);
        }

        i2 = ctable->size[0];
        i3 = (int32_T)d4;
        if (!((i3 >= 1) && (i3 <= i2))) {
          emlrtDynamicBoundsCheckR2012b(i3, 1, i2, (emlrtBCInfo *)&t_emlrtBCI,
            sp);
        }

        if (range != (int32_T)muDoubleScalarFloor(range)) {
          emlrtIntegerCheckR2012b(range, (emlrtDCInfo *)&i_emlrtDCI, sp);
        }

        i2 = ctable->size[0];
        k = (int32_T)range;
        if (!((k >= 1) && (k <= i2))) {
          emlrtDynamicBoundsCheckR2012b(k, 1, i2, (emlrtBCInfo *)&t_emlrtBCI, sp);
        }

        i2 = k + 1;
      }

      st.site = &l_emlrtRSI;
      d4 = dims - (1.0 + (real_T)i);
      if (d4 != (int32_T)muDoubleScalarFloor(d4)) {
        emlrtIntegerCheckR2012b(d4, (emlrtDCInfo *)&j_emlrtDCI, &st);
      }

      k = ctable->size[1];
      vlen = (int32_T)d4;
      if (!((vlen >= 1) && (vlen <= k))) {
        emlrtDynamicBoundsCheckR2012b(vlen, 1, k, (emlrtBCInfo *)&u_emlrtBCI,
          &st);
      }

      b_st.site = &m_emlrtRSI;
      if ((i2 - i3 == 1) || (i2 - i3 != 1)) {
        p = true;
      } else {
        p = false;
      }

      if (p) {
      } else {
        emlrtErrorWithMessageIdR2012b(&b_st, &p_emlrtRTEI,
          "Coder:toolbox:autoDimIncompatibility", 0);
      }

      p = false;
      b_p = false;
      k = 0;
      do {
        exitg1 = 0;
        if (k < 2) {
          if (k + 1 <= 1) {
            b_k = i2 - i3;
          } else {
            b_k = 1;
          }

          if (b_k != 0) {
            exitg1 = 1;
          } else {
            k++;
          }
        } else {
          b_p = true;
          exitg1 = 1;
        }
      } while (exitg1 == 0);

      if (!b_p) {
      } else {
        p = true;
      }

      if (!p) {
      } else {
        emlrtErrorWithMessageIdR2012b(&b_st, &q_emlrtRTEI,
          "Coder:toolbox:UnsupportedSpecialEmpty", 0);
      }

      c_st.site = &n_emlrtRSI;
      if (i2 - i3 == 0) {
        y = 0.0;
      } else {
        vlen = i2 - i3;
        y = ctable->data[(i3 + ctable->size[0] * ((int32_T)(dims - (1.0 +
          (real_T)i)) - 1)) - 1];
        d_st.site = &o_emlrtRSI;
        if ((!(2 > i2 - i3)) && (i2 - i3 > 2147483646)) {
          e_st.site = &j_emlrtRSI;
          check_forloop_overflow_error(&e_st);
        }

        for (k = 0; k + 2 <= vlen; k++) {
          y += ctable->data[(i3 + k) + ctable->size[0] * ((int32_T)(dims - (1.0
            + (real_T)i)) - 1)];
        }
      }

      py += y;
      i2 = x->size[1];
      if (!((i + 1 >= 1) && (i + 1 <= i2))) {
        emlrtDynamicBoundsCheckR2012b(i + 1, 1, i2, (emlrtBCInfo *)&y_emlrtBCI,
          sp);
      }

      range -= x->data[i];
    }

    i++;
    if (*emlrtBreakCheckR2012bFlagVar != 0) {
      emlrtBreakCheckR2012b(sp);
    }
  }

  i2 = x->size[1];
  i3 = x->size[1] - 1;
  if (!((i3 >= 1) && (i3 <= i2))) {
    emlrtDynamicBoundsCheckR2012b(i3, 1, i2, (emlrtBCInfo *)&v_emlrtBCI, sp);
  }

  return py + x->data[i3 - 1];
}

/* End of code generation (compressedindex.cpp) */
