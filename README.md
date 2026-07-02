# C-Integer-Overflow

<img width="1773" height="1148" alt="integer-overflow" src="https://github.com/user-attachments/assets/7f22e870-8aab-4a0c-801e-9404178af58d" />
Image Reference: https://wizardzines.com/comics/integer-overflow/ <br>
<br>
Integer overflow is especially problematic for signed integer overflow, which is undefined behavior. <br><br>

`uint x = UINT_MAX + 1;` -> overflow + round to 0 <br>
`int x = INT_MAX + 1;` -> overflow + undefined behavior

There's no way to detect int overflows directly in C <br>
But there is hardware support in the CPU, so maybe we can mix C and assembly? <br> 

## Assembly 

after arithmetic instructions [add, sub, mul] <br>
CPU sets flag registers <br>
- OF = Overflow flag (signed overflow) <br>
- CF = Carry flag (unsigned overflow) <br>

these flags are available in assembly, but are not directly exposed in C

Assembly instructions: <br>
- jo (jump if OF=1) <br>
- seto (set if OF=1) <br>
- jno (jump if OF=0) <br>
- jc (jump if CF=1)

GCC and Clang provide compiler intrinsics that perform arithmetic while reporting whether an overflow occurred <br>
`bool __builtin_add_overflow(type a, type b, type *result);` [/sub/mul] <br>

This is a recreational project.


## Usage
 
```c
int8 a=250;
if (!would_overflow(a,'+',5)) {
    // ..
}
```

Supports '+', '-' and '*' <br>

typedef unsigned char int8; <br>
typedef unsigned short int int16; <br>
typedef unsigned int int32; <br>
 
typedef signed char sint8; <br>
typedef signed short int sint16; <br>
typedef signed int sint32; <br>

## Build
 
Requires `nasm` and a 32-bit capable `gcc` (`gcc-multilib` on most distros):
 
```sh
sudo apt install nasm gcc-multilib
make
```
 
This produces `libioverflow.a`. <br>
Install system-wide with:
 
```sh
sudo make install
```
 
which drops `libioverflow.a` into `/usr/local/lib` and `ioverflow.h` into `/usr/local/include`.
 

