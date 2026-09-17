#ifndef _BACKEND_REGS_H
#define _BACKEND_REGS_H

#include "../lib/c_std.h"

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

// Registers

#define REGISTER_KIND int
#define REG_Ax 0
#define REG_Bx 1
#define REG_Cx 2
#define REG_Dx 3
#define REG_Di 4
#define REG_Si 5
#define REG_R8 6
#define REG_R9 7
#define REG_R10 8
#define REG_R11 9
#define REG_R12 10
#define REG_R13 11
#define REG_R14 12
#define REG_R15 13
#define REG_Sp 14
#define REG_Bp 15
#define REG_Xmm0 16
#define REG_Xmm1 17
#define REG_Xmm2 18
#define REG_Xmm3 19
#define REG_Xmm4 20
#define REG_Xmm5 21
#define REG_Xmm6 22
#define REG_Xmm7 23
#define REG_Xmm8 24
#define REG_Xmm9 25
#define REG_Xmm10 26
#define REG_Xmm11 27
#define REG_Xmm12 28
#define REG_Xmm13 29
#define REG_Xmm14 30
#define REG_Xmm15 31

#define REGISTER_MASK_SIZE 26
#define REGISTER_MASK_FALSE 0ul
#define NULL_REGISTER_MASK ((uint8_t)1u) << REGISTER_MASK_SIZE

#endif
