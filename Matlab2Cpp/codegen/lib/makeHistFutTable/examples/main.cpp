//
// Academic License - for use in teaching, academic research, and meeting
// course requirements at degree granting institutions only.  Not for
// government, commercial, or other organizational use.
// File: main.cpp
//
// MATLAB Coder version            : 3.1
// C/C++ source code generated on  : 18-May-2017 14:02:42
//

//***********************************************************************
// This automatically generated example C main file shows how to call
// entry-point functions that MATLAB Coder generated. You must customize
// this file for your application. Do not modify this file directly.
// Instead, make a copy of this file, modify it, and integrate it into
// your development environment.
//
// This file initializes entry-point function arguments to a default
// size and value before calling the entry-point functions. It does
// not store or use any values returned from the entry-point functions.
// If necessary, it does pre-allocate memory for returned values.
// You can use this file as a starting point for a main function that
// you can deploy in your application.
//
// After you copy the file, and before you deploy it, you must make the
// following changes:
// * For variable-size function arguments, change the example sizes to
// the sizes that your application requires.
// * Change the example values of function arguments to the values that
// your application requires.
// * If the entry-point functions return values, store these values or
// otherwise use them as required by your application.
//
//***********************************************************************
// Include Files
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "main.h"
#include "makeHistFutTable_terminate.h"
#include "makeHistFutTable_emxAPI.h"
#include "makeHistFutTable_initialize.h"

// Function Declarations
static emxArray_uint8_T *argInit_1xUnbounded_uint8_T();
static double argInit_real_T();
static unsigned char argInit_uint8_T();
static void main_makeHistFutTable();

// Function Definitions

//
// Arguments    : void
// Return Type  : emxArray_uint8_T *
//
static emxArray_uint8_T *argInit_1xUnbounded_uint8_T()
{
  emxArray_uint8_T *result;
  static int iv0[2] = { 1, 2 };

  int idx1;

  // Set the size of the array.
  // Change this size to the value that the application requires.
  result = emxCreateND_uint8_T(2, *(int (*)[2])&iv0[0]);

  // Loop over the array to initialize each element.
  for (idx1 = 0; idx1 < result->size[1U]; idx1++) {
    // Set the value of the array element.
    // Change this value to the value that the application requires.
    result->data[result->size[0] * idx1] = argInit_uint8_T();
  }

  return result;
}

//
// Arguments    : void
// Return Type  : double
//
static double argInit_real_T()
{
  return 0.0;
}

//
// Arguments    : void
// Return Type  : unsigned char
//
static unsigned char argInit_uint8_T()
{
  return 0;
}

//
// Arguments    : void
// Return Type  : void
//
static void main_makeHistFutTable()
{
  emxArray_real_T *y;
  emxArray_uint8_T *testm;
  emxInitArray_real_T(&y, 2);

  // Initialize function 'makeHistFutTable' input arguments.
  // Initialize function input argument 'testm'.
  testm = argInit_1xUnbounded_uint8_T();

  // Call the entry-point 'makeHistFutTable'.
  makeHistFutTable(testm, argInit_real_T(), argInit_real_T(), y);
  emxDestroyArray_real_T(y);
  emxDestroyArray_uint8_T(testm);
}

//
// Arguments    : int argc
//                const char * const argv[]
// Return Type  : int
//
int main(int, const char * const [])
{
  // Initialize the application.
  // You do not need to do this more than one time.
  makeHistFutTable_initialize();

  // Invoke the entry-point functions.
  // You can call entry-point functions multiple times.
  main_makeHistFutTable();

  // Terminate the application.
  // You do not need to do this more than one time.
  makeHistFutTable_terminate();
  return 0;
}

//
// File trailer for main.cpp
//
// [EOF]
//
