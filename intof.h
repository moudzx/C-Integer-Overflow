#pragma once
#include <stdbool.h>

typedef unsigned char int8;
typedef unsigned short int int16;
typedef unsigned int int32;

typedef signed char sint8;
typedef signed short int sint16;
typedef signed int sint32;

#define $1 (int8*)
#define $2 (int16)
#define $4 (int32)
#define $i (int)
#define $c (char*)

#define add(x,y) _Generic((x), \
    int8: add8, int16: add16, int32: add32, \
    sint8: add8s, sint16: add16s, sint32: add32s)(x,y)
#define sub(x,y) _Generic((x), \
    int8: sub8, int16: sub16, int32: sub32, \
    sint8: sub8s, sint16: sub16s, sint32: sub32s)(x,y)
#define mul(x,y) _Generic((x), \
    int8: mul8, int16: mul16, int32: mul32, \
    sint8: mul8s, sint16: mul16s, sint32: mul32s)(x,y)

int8 add8(int8, int8);
int16 add16(int16, int16);
int32 add32(int32, int32);

int8 sub8(int8, int8);
int16 sub16(int16, int16);
int32 sub32(int32, int32);

int8 mul8(int8, int8);
int16 mul16(int16, int16);
int32 mul32(int32, int32);

sint8 add8s(sint8, sint8);
sint16 add16s(sint16, sint16);
sint32 add32s(sint32, sint32);

sint8 sub8s(sint8, sint8);
sint16 sub16s(sint16, sint16);
sint32 sub32s(sint32, sint32);

sint8 mul8s(sint8, sint8);
sint16 mul16s(sint16, sint16);
sint32 mul32s(sint32, sint32);

extern int16 *overflow;
bool overflowed(void);

bool would_overflow_8(int8 a, char op, int8 b);
bool would_overflow_16(int16 a, char op, int16 b);
bool would_overflow_32(int32 a, char op, int32 b);

bool would_overflow_8s(sint8 a, char op, sint8 b);
bool would_overflow_16s(sint16 a, char op, sint16 b);
bool would_overflow_32s(sint32 a, char op, sint32 b);

#define would_overflow(a, op, b) _Generic((a), \
    int8:  would_overflow_8, \
    int16: would_overflow_16, \
    int32: would_overflow_32, \
    sint8:  would_overflow_8s, \
    sint16: would_overflow_16s, \
    sint32: would_overflow_32s)(a, op, b)
