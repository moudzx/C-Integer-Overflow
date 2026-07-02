#include <intof.h>
#include <stdio.h>

bool overflowed(void) {
    int8 bit;
    bit = *overflow & 1;
    *overflow >>= 1;
    return bit != 0;
}

bool would_overflow_8(int8 a, char op, int8 b) {
    switch (op) {
        case '+': add8(a, b); break;
        case '-': sub8(a, b); break;
        case '*': mul8(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}

bool would_overflow_16(int16 a, char op, int16 b) {
    switch (op) {
        case '+': add16(a, b); break;
        case '-': sub16(a, b); break;
        case '*': mul16(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}

bool would_overflow_32(int32 a, char op, int32 b) {
    switch (op) {
        case '+': add32(a, b); break;
        case '-': sub32(a, b); break;
        case '*': mul32(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}

bool would_overflow_8s(sint8 a, char op, sint8 b) {
    switch (op) {
        case '+': add8s(a, b); break;
        case '-': sub8s(a, b); break;
        case '*': mul8s(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}

bool would_overflow_16s(sint16 a, char op, sint16 b) {
    switch (op) {
        case '+': add16s(a, b); break;
        case '-': sub16s(a, b); break;
        case '*': mul16s(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}

bool would_overflow_32s(sint32 a, char op, sint32 b) {
    switch (op) {
        case '+': add32s(a, b); break;
        case '-': sub32s(a, b); break;
        case '*': mul32s(a, b); break;
        default:
            fprintf(stderr, "would_overflow: unknown operator '%c'\n", op);
            return false;
    }
    return overflowed();
}
