//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: compmat.cpp
//
// MATLAB Coder version            : 3.1
// C/C++ source code generated on  : 18-May-2017 14:02:42
//

// Include Files
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "compmat.h"
#include "makeHistFutTable_emxutil.h"

// Function Definitions

//
// UNTITLED Summary of this function goes here
//    Detailed explanation goes here
// Arguments    : const emxArray_uint8_T *x
//                double dims
//                emxArray_real_T *y
// Return Type  : void
//
void compmat(const emxArray_uint8_T *x, double dims, emxArray_real_T *y)
{
  int i0;
  int ii;
  int i;
  emxArray_boolean_T *b_x;
  emxArray_int32_T *b_ii;
  int nx;
  int idx;
  boolean_T exitg1;
  boolean_T guard1 = false;
  i0 = y->size[0] * y->size[1];
  y->size[0] = 1;
  y->size[1] = (int)dims;
  emxEnsureCapacity((emxArray__common *)y, i0, (int)sizeof(double));
  ii = (int)dims;
  for (i0 = 0; i0 < ii; i0++) {
    y->data[i0] = 0.0;
  }

  i = 0;
  emxInit_boolean_T(&b_x, 2);
  emxInit_int32_T(&b_ii, 2);
  while (i <= (int)dims - 1) {
    i0 = b_x->size[0] * b_x->size[1];
    b_x->size[0] = 1;
    b_x->size[1] = x->size[1];
    emxEnsureCapacity((emxArray__common *)b_x, i0, (int)sizeof(boolean_T));
    ii = x->size[0] * x->size[1];
    for (i0 = 0; i0 < ii; i0++) {
      b_x->data[i0] = (x->data[i0] == 1.0 + (double)i);
    }

    nx = b_x->size[1];
    idx = 0;
    i0 = b_ii->size[0] * b_ii->size[1];
    b_ii->size[0] = 1;
    b_ii->size[1] = b_x->size[1];
    emxEnsureCapacity((emxArray__common *)b_ii, i0, (int)sizeof(int));
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

    if (b_x->size[1] == 1) {
      if (idx == 0) {
        i0 = b_ii->size[0] * b_ii->size[1];
        b_ii->size[0] = 1;
        b_ii->size[1] = 0;
        emxEnsureCapacity((emxArray__common *)b_ii, i0, (int)sizeof(int));
      }
    } else {
      i0 = b_ii->size[0] * b_ii->size[1];
      if (1 > idx) {
        b_ii->size[1] = 0;
      } else {
        b_ii->size[1] = idx;
      }

      emxEnsureCapacity((emxArray__common *)b_ii, i0, (int)sizeof(int));
    }

    y->data[i] = b_ii->size[1];
    i++;
  }

  emxFree_int32_T(&b_ii);
  emxFree_boolean_T(&b_x);
}

//
// File trailer for compmat.cpp
//
// [EOF]
//
