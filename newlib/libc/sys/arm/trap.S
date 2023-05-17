        /* Run-time exception support */
#ifndef __ARM_EABI__
#include "swi.h"

/* .text is used instead of .section .text so it works with arm-aout too.  */
	.text
        .align 0
        .global __rt_stkovf_split_big
        .global __rt_stkovf_split_small

/* The following functions are provided for software stack checking.
   If hardware stack-checking is being used then the code can be
   compiled without the PCS entry checks, and simply rely on VM
   management to extend the stack for a thread.

   The stack extension event occurs when the PCS function entry code
   would result in a stack-pointer beneath the stack-limit register
   value.  The system relies on the following map:

        +-----------------------------------+ <-- end of stack block
        | ...                               |
        | ...                               |
        | active stack                      |
        | ...                               | <-- sp (stack-pointer) somewhere in here
        | ...                               |
        +-----------------------------------+ <-- sl (stack-limit)
        | stack-extension handler workspace |
        +-----------------------------------+ <-- base of stack block

   The "stack-extension handler workspace" is an amount of memory in
   which the stack overflow support code must execute.  It must be
   large enough to deal with the worst case path through the extension
   code.  At the moment the compiler expects this to be AT LEAST
   256bytes.  It uses this fact to code functions with small local
   data usage within the overflow space.

   In a true target environment We may need to increase the space
   between sl and the true limit to allow for the stack extension
   code, SWI handlers and for undefined instruction handlers of the
   target environment.  */

__rt_stkovf_split_small:
        mov ip, sp
__rt_stkovf_split_big:
        SUB     ip, sp, ip
        swi     SWI_Exit
#endif
