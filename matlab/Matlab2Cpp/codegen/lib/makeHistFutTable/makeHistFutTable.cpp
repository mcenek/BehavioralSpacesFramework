//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: makeHistFutTable.cpp
//
// MATLAB Coder version            : 3.1
// C/C++ source code generated on  : 18-May-2017 14:02:42
//

// Include Files
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "compressedindex.h"
#include "compmat.h"
#include "makeHistFutTable_emxutil.h"

// Function Definitions

//
// Arguments    : const emxArray_uint8_T *testm
//                double range
//                double dims
//                emxArray_real_T *y
// Return Type  : void
//
void makeHistFutTable(const emxArray_uint8_T *testm, double range, double dims,
                      emxArray_real_T *y)
{
  emxArray_real_T *res;
  int ii;
  int idx;
  int i;
  int i2;
  double d0;
  int its;
  emxArray_uint8_T *ahist;
  emxArray_real_T *b_ahist;
  emxArray_real_T *afut;
  emxArray_boolean_T *x;
  int k;
  boolean_T exitg2;
  double d1;
  double d2;
  boolean_T exitg1;
  double xcor;
  double ycor;
  emxInit_real_T(&res, 2);

  // Generates a reference table for the size of the square transition table
  // RData in the main program. Useful for finding which combinations of range
  // and dimensions are computationally feasible, and for preallocating
  // matrices which store this data.
  ii = res->size[0] * res->size[1];
  res->size[0] = (int)(range + 1.0);
  res->size[1] = (int)dims;
  emxEnsureCapacity((emxArray__common *)res, ii, (int)sizeof(double));
  idx = (int)(range + 1.0) * (int)dims;
  for (ii = 0; ii < idx; ii++) {
    res->data[ii] = 0.0;
  }

  if (1.0 > range + 1.0) {
    idx = 0;
  } else {
    idx = (int)(range + 1.0);
  }

  for (ii = 0; ii < idx; ii++) {
    res->data[ii] = 1.0;
  }

  if (1.0 > dims) {
    idx = 0;
  } else {
    idx = (int)dims;
  }

  for (ii = 0; ii < idx; ii++) {
    res->data[res->size[0] * ii] = 1.0;
  }

  for (i = 1; i - 1 < (int)((range + 1.0) + -1.0); i++) {
    for (i2 = 0; i2 <= (int)dims - 2; i2++) {
      res->data[i + res->size[0] * (i2 + 1)] = res->data[((int)((2.0 + (double)
        (i - 1)) - 1.0) + res->size[0] * (i2 + 1)) - 1] + res->data[i +
        res->size[0] * i2];
    }
  }

  ii = y->size[0] * y->size[1];
  y->size[0] = (int)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1))
    - 1];
  y->size[1] = (int)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1))
    - 1];
  emxEnsureCapacity((emxArray__common *)y, ii, (int)sizeof(double));
  idx = (int)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1)) - 1] *
    (int)res->data[(res->size[0] + res->size[0] * (res->size[1] - 1)) - 1];
  for (ii = 0; ii < idx; ii++) {
    y->data[ii] = 0.0;
  }

  d0 = (double)testm->size[1] - range * 2.0;
  its = 0;
  emxInit_uint8_T(&ahist, 2);
  emxInit_real_T(&b_ahist, 2);
  emxInit_real_T(&afut, 2);
  emxInit_boolean_T(&x, 2);
  while (its <= (int)d0 - 1) {
    // for previous and future of an agent, write event in the result matrix
    // incrementing the value by 1 in the location corresponding to its
    // behavior
    ii = ahist->size[0] * ahist->size[1];
    ahist->size[0] = 1;
    ahist->size[1] = (int)floor(range - 1.0) + 1;
    emxEnsureCapacity((emxArray__common *)ahist, ii, (int)sizeof(unsigned char));
    idx = (int)floor(range - 1.0);
    for (ii = 0; ii <= idx; ii++) {
      ahist->data[ahist->size[0] * ii] = testm->data[testm->size[0] * ((int)
        ((1.0 + (double)its) + (double)ii) - 1)];
    }

    ii = x->size[0] * x->size[1];
    x->size[0] = 1;
    x->size[1] = ahist->size[1];
    emxEnsureCapacity((emxArray__common *)x, ii, (int)sizeof(boolean_T));
    idx = ahist->size[0] * ahist->size[1];
    for (ii = 0; ii < idx; ii++) {
      x->data[ii] = (ahist->data[ii] == 0);
    }

    k = (1 <= x->size[1]);
    idx = 0;
    ii = 1;
    exitg2 = false;
    while ((!exitg2) && (ii <= x->size[1])) {
      if (x->data[ii - 1]) {
        idx = 1;
        exitg2 = true;
      } else {
        ii++;
      }
    }

    if (k == 1) {
      if (idx == 0) {
        k = 0;
      }
    } else {
      k = !(1 > idx);
    }

    if (k == 0) {
      compmat(ahist, dims, b_ahist);

      // if there is a 0 in the history or future of an agent, that indicates
      // a break between one agent's history and the next, which is garbage
      // data and is therefore skipped. This preserves the deliniation between
      // agents
      d1 = (1.0 + (double)its) + range;
      d2 = (1.0 + (double)its) + (range * 2.0 - 1.0);
      if (d1 > d2) {
        ii = 0;
        k = 0;
      } else {
        ii = (int)d1 - 1;
        k = (int)d2;
      }

      idx = ahist->size[0] * ahist->size[1];
      ahist->size[0] = 1;
      ahist->size[1] = k - ii;
      emxEnsureCapacity((emxArray__common *)ahist, idx, (int)sizeof(unsigned
        char));
      idx = k - ii;
      for (k = 0; k < idx; k++) {
        ahist->data[ahist->size[0] * k] = testm->data[testm->size[0] * (ii + k)];
      }

      ii = x->size[0] * x->size[1];
      x->size[0] = 1;
      x->size[1] = ahist->size[1];
      emxEnsureCapacity((emxArray__common *)x, ii, (int)sizeof(boolean_T));
      idx = ahist->size[0] * ahist->size[1];
      for (ii = 0; ii < idx; ii++) {
        x->data[ii] = (ahist->data[ii] == 0);
      }

      k = (1 <= x->size[1]);
      idx = 0;
      ii = 1;
      exitg1 = false;
      while ((!exitg1) && (ii <= x->size[1])) {
        if (x->data[ii - 1]) {
          idx = 1;
          exitg1 = true;
        } else {
          ii++;
        }
      }

      if (k == 1) {
        if (idx == 0) {
          k = 0;
        }
      } else {
        k = !(1 > idx);
      }

      if (k == 0) {
        compmat(ahist, dims, afut);
        xcor = compressedindex(b_ahist, res, range, dims);
        ycor = compressedindex(afut, res, range, dims);
        y->data[((int)ycor + y->size[0] * ((int)xcor - 1)) - 1]++;
      }
    }

    its++;
  }

  emxFree_boolean_T(&x);
  emxFree_real_T(&res);
  emxFree_real_T(&afut);
  emxFree_real_T(&b_ahist);
  emxFree_uint8_T(&ahist);
}

//
// File trailer for makeHistFutTable.cpp
//
// [EOF]
//
