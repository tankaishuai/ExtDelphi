#pragma once

const char * __stdcall RegExprMatchStdcall(const char * szText, const char * szPatten, int iGroup);

#define __pascal
const char * __pascal RegExprMatchPascal(const char * szText, const char * szPatten, int iGroup);
