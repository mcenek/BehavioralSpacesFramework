//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: compressedindex.cpp
//
// MATLAB Coder version            : 3.1
// C/C++ source code generated on  : 18-May-2017 14:02:42
//

// Include Files
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "compressedindex.h"

// Function Definitions

//
// for a  given vector, find its index within the transition space matrix
// workspace;
// Arguments    : const emxArray_real_T *x
//                const emxArray_real_T *ctable
//                double range
//                double dims
// Return Type  : double
//
double compressedindex(const emxArray_real_T *x, const emxArray_real_T *ctable,
  double range, double dims)
{
  double y;
  double py;
  int i;
  double d3;
  int i1;
  int i2;
  int k;
  py = 1.0;
  range++;
  for (i = 0; i < (int)(dims - 2.0); i++) {
    if (x->data[i] == 0.0) {
    } else {
      d3 = range - (x->data[i] - 1.0);
      if (d3 > range) {
        i1 = 1;
        i2 = 1;
      } else {
        i1 = (int)d3;
        i2 = (int)range + 1;
      }

      if (i2 - i1 == 0) {
        y = 0.0;
      } else {
        y = ctable->data[(i1 + ctable->size[0] * ((int)(dims - (1.0 + (double)i))
          - 1)) - 1];
        for (k = 0; k + 2 <= i2 - i1; k++) {
          y += ctable->data[(i1 + k) + ctable->size[0] * ((int)(dims - (1.0 +
            (double)i)) - 1)];
        }
      }

      py += y;
      range -= x->data[i];
    }
  }

  return py + x->data[x->size[1] - 2];
}

//
// File trailer for compressedindex.cpp
//
// [EOF]
//
