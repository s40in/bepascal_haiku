{  BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2004 Olivier Coursiere

    This library is free software; you can redistribute it and/or
    modify it under the terms of the GNU Library General Public
    License as published by the Free Software Foundation; either
    version 2 of the License, or (at your option) any later version.

    This library is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
    Library General Public License for more details.

    You should have received a copy of the GNU Library General Public
    License along with this library; if not, write to the Free
    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
}
unit signal;

interface

(*
typedef struct packed_fp_stack {
	unsigned char	st0[10];
	unsigned char	st1[10];
	unsigned char	st2[10];
	unsigned char	st3[10];
	unsigned char	st4[10];
	unsigned char	st5[10];
	unsigned char	st6[10];
	unsigned char	st7[10];
} packed_fp_stack;
*)

type
  packed_fp_stack = packed record
    st0 : array[0..9] of Byte;
    st1 : array[0..9] of Byte;
    st2 : array[0..9] of Byte;
    st3 : array[0..9] of Byte;
    st4 : array[0..9] of Byte;
    st5 : array[0..9] of Byte;
    st6 : array[0..9] of Byte;
    st7 : array[0..9] of Byte;
  end;

(*
typedef struct packed_mmx_regs {
	unsigned char	mm0[10];
	unsigned char	mm1[10];
	unsigned char	mm2[10];
	unsigned char	mm3[10];
	unsigned char	mm4[10];
	unsigned char	mm5[10];
	unsigned char	mm6[10];
	unsigned char	mm7[10];
} packed_mmx_regs;
*)

type
  packed_mmx_regs = packed record
    mm0 : array[0..9] of Byte;
    mm1 : array[0..9] of Byte;
    mm2 : array[0..9] of Byte;
    mm3 : array[0..9] of Byte;
    mm4 : array[0..9] of Byte;
    mm5 : array[0..9] of Byte;
    mm6 : array[0..9] of Byte;
    mm7 : array[0..9] of Byte;
  end;

(*
typedef struct old_extended_regs {
	unsigned short	fp_control;
	unsigned short	_reserved1;
	unsigned short	fp_status;
	unsigned short	_reserved2;
	unsigned short	fp_tag;
	unsigned short	_reserved3;
	unsigned long	fp_eip;
	unsigned short	fp_cs;
	unsigned short	fp_opcode;
	unsigned long	fp_datap;
	unsigned short	fp_ds;
	unsigned short	_reserved4;
	union {
		packed_fp_stack	fp;
		packed_mmx_regs	mmx;
	} fp_mmx;
} old_extended_regs;
*)

type
  old_extended_regs = packed record
    fp_control : word;
    _reserved1 : word;
    fp_status  : word;
    _reserved2 : word;
    fp_tag     : word;
    _reserved3 : word;
    fp_eip     : cardinal;
    fp_cs      : word;
    fp_opcode  : word;
    fp_datap   : cardinal;
    fp_ds      : word;
    _reserved4 : word;
    case integer of
      1 : (
         fp  : packed_fp_stack
         );
      2 : (
         mmx : packed_mmx_regs
         );
  end;
  
(*
typedef struct fp_stack {
	unsigned char	st0[10];
	unsigned char	_reserved_42_47[6];
	unsigned char	st1[10];
	unsigned char	_reserved_58_63[6];
	unsigned char	st2[10];
	unsigned char	_reserved_74_79[6];
	unsigned char	st3[10];
	unsigned char	_reserved_90_95[6];
	unsigned char	st4[10];
	unsigned char	_reserved_106_111[6];
	unsigned char	st5[10];
	unsigned char	_reserved_122_127[6];
	unsigned char	st6[10];
	unsigned char	_reserved_138_143[6];
	unsigned char	st7[10];
	unsigned char	_reserved_154_159[6];
} fp_stack;
*)

type
  fp_stack = packed record
    st0 : array[0..9] of Byte;
    _reserved_42_47 : array[0..5] of Byte;
    st1 : array[0..9] of Byte;
    _reserved_58_63 : array[0..5] of Byte;
    st2 : array[0..9] of Byte;
    _reserved_74_79 : array[0..5] of Byte;
    st3 : array[0..9] of Byte;
    _reserved_90_95 : array[0..5] of Byte;
    st4 : array[0..9] of Byte;
    _reserved_106_111 : array[0..5] of Byte;
    st5 : array[0..9] of Byte;
    _reserved_122_127 : array[0..5] of Byte;
    st6 : array[0..9] of Byte;
    _reserved_138_143 : array[0..5] of Byte;
    st7 : array[0..9] of Byte;
    _reserved_154_159 : array[0..5] of Byte;    
  end;
  
(*
typedef struct mmx_regs {
	unsigned char	mm0[10];
	unsigned char	_reserved_42_47[6];
	unsigned char	mm1[10];
	unsigned char	_reserved_58_63[6];
	unsigned char	mm2[10];
	unsigned char	_reserved_74_79[6];
	unsigned char	mm3[10];
	unsigned char	_reserved_90_95[6];
	unsigned char	mm4[10];
	unsigned char	_reserved_106_111[6];
	unsigned char	mm5[10];
	unsigned char	_reserved_122_127[6];
	unsigned char	mm6[10];
	unsigned char	_reserved_138_143[6];
	unsigned char	mm7[10];
	unsigned char	_reserved_154_159[6];
} mmx_regs;
*)

type
  mmx_regs = packed record
    mm0 : array[0..9] of Byte;
    _reserved_42_47 : array[0..5] of Byte;
    mm1 : array[0..9] of Byte;
    _reserved_58_63 : array[0..5] of Byte;
    mm2 : array[0..9] of Byte;
    _reserved_74_79 : array[0..5] of Byte;
    mm3 : array[0..9] of Byte;
    _reserved_90_95 : array[0..5] of Byte;  
    mm4 : array[0..9] of Byte;
    _reserved_106_111 : array[0..5] of Byte;
    mm5 : array[0..9] of Byte;
    _reserved_122_127 : array[0..5] of Byte;
    mm6 : array[0..9] of Byte;
    _reserved_138_143 : array[0..5] of Byte;
    mm7 : array[0..9] of Byte;
    _reserved_154_159 : array[0..5] of Byte;    
  end;
(*	
typedef struct xmmx_regs {
	unsigned char	xmm0[16];
	unsigned char	xmm1[16];
	unsigned char	xmm2[16];
	unsigned char	xmm3[16];
	unsigned char	xmm4[16];
	unsigned char	xmm5[16];
	unsigned char	xmm6[16];
	unsigned char	xmm7[16];
} xmmx_regs;
*)

type
  xmmx_regs = packed record
    xmm0 : array[0..15] of Byte;
    xmm1 : array[0..15] of Byte;
    xmm2 : array[0..15] of Byte;
    xmm3 : array[0..15] of Byte;
    xmm4 : array[0..15] of Byte;
    xmm5 : array[0..15] of Byte;
    xmm6 : array[0..15] of Byte;
    xmm7 : array[0..15] of Byte;    
  end;
(*
typedef struct new_extended_regs {
	unsigned short	fp_control;
	unsigned short	fp_status;
	unsigned short	fp_tag;  
	unsigned short	fp_opcode;
	unsigned long	fp_eip;
	unsigned short	fp_cs;
	unsigned short	res_14_15;
	unsigned long	fp_datap;
	unsigned short	fp_ds;
	unsigned short	_reserved_22_23;
	unsigned long	mxcsr;
	unsigned long	_reserved_28_31;
	union {
		fp_stack fp;
		mmx_regs mmx;
	} fp_mmx;
	xmmx_regs xmmx;
	unsigned char	_reserved_288_511[224];
} new_extended_regs;
*)

type
  new_extended_regs = packed record
    fp_control : word;
    fp_status  : word;
    fp_tag     : word;
    fp_opcode  : word;
    fp_eip     : cardinal;
    fp_cs      : word;
    res_14_15  : word;
    fp_datap   : cardinal;
    fp_ds      : word;
    _reserved_22_23 : word;
    mxcsr      : cardinal;
    _reserved_28_31 : cardinal;
    fp_mmx : packed record
      case integer of
        1 : (
           fp : fp_stack
           );
        2 : (
            mmx : mmx_regs
            );
    end;
    xmmx : xmmx_regs;
    _reserved_288_511 : array[0..223] of Byte;
  end;
  
(*
typedef struct extended_regs {
	union {
		old_extended_regs	old_format;
		new_extended_regs	new_format;
	} state;
	unsigned long	format;  
} extended_regs;
*)

type
  extended_regs = packed record
    state : packed record
      case integer of
        1 : (old_format : old_extended_regs);
        2 : (new_format : new_extended_regs);
    end;
    format : cardinal;
  end;
(*
struct vregs {
	unsigned long			eip;
	unsigned long			eflags;
	unsigned long			eax;
	unsigned long			ecx;
	unsigned long			edx;
	unsigned long			esp;
	unsigned long			ebp;
	unsigned long			_reserved_1;
	extended_regs	xregs;
	unsigned long			_reserved_2[3];
};
*) 

type
  vregs = packed record
    eip    : cardinal;
    eflags : cardinal;
    eax    : cardinal;
    ecx    : cardinal;
    edx    : cardinal;
    esp    : cardinal;
    ebp    : cardinal;
    _reserved_1 : cardinal;
    xregs  : extended_regs;
    _reserved_2 : array[0..3] of cardinal;
  end;
  
implementation

end.
