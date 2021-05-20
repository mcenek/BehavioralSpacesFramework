/*
 * Academic License - for use in teaching, academic research, and meeting
 * course requirements at degree granting institutions only.  Not for
 * government, commercial, or other organizational use.
 *
 * _coder_makeHistFutTable_info.cpp
 *
 * Code generation for function '_coder_makeHistFutTable_info'
 *
 */

/* Include files */
#include "rt_nonfinite.h"
#include "makeHistFutTable.h"
#include "_coder_makeHistFutTable_info.h"

/* Function Definitions */
mxArray *emlrtMexFcnProperties()
{
  mxArray *xResult;
  mxArray *xEntryPoints;
  const char * fldNames[4] = { "Name", "NumberOfInputs", "NumberOfOutputs",
    "ConstantInputs" };

  mxArray *xInputs;
  const char * b_fldNames[4] = { "Version", "ResolvedFunctions", "EntryPoints",
    "CoverageInfo" };

  xEntryPoints = emlrtCreateStructMatrix(1, 1, 4, fldNames);
  xInputs = emlrtCreateLogicalMatrix(1, 3);
  emlrtSetField(xEntryPoints, 0, "Name", mxCreateString("makeHistFutTable"));
  emlrtSetField(xEntryPoints, 0, "NumberOfInputs", mxCreateDoubleScalar(3.0));
  emlrtSetField(xEntryPoints, 0, "NumberOfOutputs", mxCreateDoubleScalar(1.0));
  emlrtSetField(xEntryPoints, 0, "ConstantInputs", xInputs);
  xResult = emlrtCreateStructMatrix(1, 1, 4, b_fldNames);
  emlrtSetField(xResult, 0, "Version", mxCreateString("9.0.0.341360 (R2016a)"));
  emlrtSetField(xResult, 0, "ResolvedFunctions", (mxArray *)
                emlrtMexFcnResolvedFunctionsInfo());
  emlrtSetField(xResult, 0, "EntryPoints", xEntryPoints);
  return xResult;
}

const mxArray *emlrtMexFcnResolvedFunctionsInfo()
{
  const mxArray *nameCaptureInfo;
  const char * data[18] = {
    "789ced5dcb6f1b45189fd034348742052a6f410b525554942d54425555554ef350d2574c9b94486971d7eb71bceabed85d07f766714039212e48489c804b0542"
    "5c39960b12070e08f81be082c4813f80997da4ebe9da33de9db5d7e967c972be78bed9eff59bf9e66934b57a1591d753e47dff4b8466c8e721f27e0285af8311",
    "3d45de67a2cff0ffd3e870447f4cde9a6df9b8e3875f5aaa8951fc6ad8a66ea996bf7ecfc1c8c59e6dece046f04d5337f0ba6ee22b768258d109612e27beda23"
    "e8576ecbdbab191949227c513d3ae8a11ed3297a2c25f43812d15b4bb717ce291b1e763de586832d0dbbcaa2adb54d6cf99e72757efdcafc4565a1edee6077a1",
    "5a755cec28a67a9788e4f9cb6d7f5dad1b78ce8c9e5fe13c7f9679fe6c603fd3f1692d093dce72ea9961ea9909acdd0e2aa1fc0e87ff02c37f219b1df644a706"
    "60e59e4979ee54e2b9b3d1ff117af0e96f5ffd399f9d3fdd6ee3e03f99e09f4ae14789cf2ce5c71ddfa739cf9fee79fe3481b6d59011cf3cbd57187e4a6fad5e",
    "d90c54afbaf6b6ab9ac76863b2a7f0f5774ebffdaeaaf8b66dd4ed8e824d4331f43ad1dc37d4ba820df28742a59f33b3c745f7970f30c4b548f95d34d8bfefa1"
    "5eff525a967f8f93ef6af4cf843c2b1c799e67e4a1b46637b03ba793ced0b55463ced354437597b685daf32799fa286dd8db3aa923e0ef72f8ab0c7f358b7de8",
    "fb54a085722a564389d5c8830374f29f35c08148f92e2a879f2b1c390e3372505af72cd2a7b8bae6d3744f2c8fc91bf76b0cff5a167bd076a1a97770c3b18939"
    "941e3d48cf97236ebe7fff4588fb498a7b5ebc1e62e4a0b4ee3575d29bb44611ef9718fe4b59ecf048bc87f207491eca152f10ef82e579f9ce26eaf533a565c7",
    "fbf1a6ee7a7e53cf92d7d3989111efbcbc7e99e15fce62879478cf375e8538172d3f6eff5638cf17cd6386c587d6525dc85fc25719f8c7dd9e8f7afcca6b970f"
    "32f250ba69d8b62bc8cf9bafe972f85719fed5dcf668b62d25d0204e63f2c4cd4f1b2720ee65e4eda3f2739523c76b8c1c9466e66b74ef625b37fc55eb5ad87a",
    "4ac1c1f8f23c569d5cf3372bc77efd03f02050be8b26030f2f3372503a75fe722eee15f87950fc4ad61bf3f170b0c1f06d64b14b2a0e4e857a246c94633eff5b"
    "c887260b07773872bcc9c841690607aae318f76e0441b4dcb6345fb7ad55ab6aa85a72bdb6c279ced3cc7328dd8c6aabb554ab413a0c5acf179c7aea4c3df52c",
    "764bc5497f3525cc0bb9ff9d01dc88942fbbff8bea578aceb3a07fd95f38e1f97bd4e36ddefcd0811e790e2053b764ad3313417067d5f2c7d2ef36545fa53d2f"
    "d147c6b8fbdf590de2bf8cf9553f3ff3e2f705460e4a33f16ba9eeb66e69adbb79c6179f71e4b8c5f0dd1ad61e5e4b757143095bffa80f60bb823d4d4213e5e8",
    "079e3d771dc6db22e527c1ef30ff3a74fcc0fcab60f92e9a8c7e40208f2155aeb957d54ea1eb6dc5ed2389c5cf35cf7abbd680b89711f7a3f233e43f90ff9439"
    "ffb98d7afd4e69d93808c6c3b8e3bbd86cc7f31f800bc0c53871c19b475551afdf295d082eeaba95c4462c9f847ca9e77c8184fa869a4782f306fb03275d540e",
    "3f57387288eed31b350e60ff1ee0a04ce70f461dff701e617fc4ff2e1aece7519f47e0ad33bfcac843699a6e916a6b4ddb356cdba9d93bd86d1af64735ad85b5"
    "bbf9f62ff1c6117718be3b59ec939c4f0dcd35409f5ce7927f005c8895ff110df6fb27a8d7ef942edaefc70717a8b5b0e16037dbb985f85c8fec7e64dce740a0",
    "ff009c0cc24996f53652b5a9768a3d1f242dbfead9c7124a2e21bf827e44b0fce38a0fdd9a547c3c5ce0047c3c7ee30fc89b206f82750a69fbbd71c799370c5b"
    "dbab57364e78edc73a53dfba343b26d5cbbbbe87be03dcc8e92f46edef4d8e3caf33f2507a004eaed90be19c555cbf6cbcf0e6b3b698fab60ab15fa4669468e5",
    "98cf3a726f1a7023a3bf69a15ebf53ba90fe264cbb7aba1d5817877571c089184e8abaef60d47919dc7fb0bf70c3f3f7a8cfe5c13a22ac23022e86bfdf58607f"
    "6ed0ce578db697757e7898f3db52ec93de4fc46ac838b774f3191ffa0991f2bc79cd25d4eb6f4acbbcc79e17af69f756d21f3b20a812e23fc8f053ba4d62ee6c",
    "f47c87c37f9ee13f9f4dff48e4bcf3520faa47bf81765ea4fcb8fc3aec7a85e8ef32e4bdbf7585e1a734fc2e833cfefdde4e5738cf4fbb578982c3c59e871b41"
    "df9e79fd7a98df1f5964f817b3d981113d77bbfdb3f535c4b98c382fdabfc3de1fe3b51f3d173009f704c4e7c789fc12f2edeed12d382f2d54be8bcae1e7158e",
    "1c702e34130ee05ca860f92e2a070eb2e4dda40ec7b51bb9f6d3ed72f86e32cfbd19e95fcd6b00c7d577541f2b9112f9f617755f51a1dd172a5f367f17b56e55"
    "f4fc23ac53012e8ac4052f2f7a8e9187d2845f2363895a54554db79cb6efe5db6fcd5bf7c68c1c58b65dd295ca7bafea4bf775e82f44ca97ddff307e80f103e0",
    "a33f3e78fb50df60e4a334830fcdb63cff9a6dddd0ad6d03fbb6b5a8a7efcfcc9267158e9bbe79569a5ab97103f7750b962f3b6e78fd8aecdf7bce3b2f0bfb4c"
    "f7072ebaa81c7eae70e490f57bcf79e31eee5b82b82fd37d4b45c73bdcafb43fe27d170df6f3a49c6f2e7a1fc532c3bf9cc50e709eb92fffb8e37c9ceb4ba2eb",
    "6cba873f6c47fbdb8a6edf2f33fc979194fb2b420df29fab9cfdfbaddf21ee05ca775139fc5ce1c871849123186bd3f321614d35cd76f128e679fadd4b9eb91d"
    "080d12b702ac4a39d70fd089bf603c2b54beac7e5fe1c805eb06b06ef038e5453c3ca4cf779a75ddc2b51dacf9b65bc3060e76ba66dea79de5f76f9b4c3d4dd9",
    "76eaa364cefd4a9f6fc27e25a1f265f73f9c2786f3c4e3c6c9ff95baac6e", "" };

  nameCaptureInfo = NULL;
  emlrtNameCaptureMxArrayR2016a(data, 39864U, &nameCaptureInfo);
  return nameCaptureInfo;
}

/* End of code generation (_coder_makeHistFutTable_info.cpp) */
