{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 by the BePascal Team members:
                  Olivier Coursiere
                  Eric Jourde
                  Oscar Lesta

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
unit GraphicDefs;

interface

uses
  SupportDefs;

{$PACKRECORDS C}

type
  // This one must be find a better place.
  PCardinal = ^Cardinal;
  PLongword = ^Longword;

(*----------------------------------------------------------------*)
type
  pattern = record
    data : array [0..7] of Byte;
  end;

var
  B_SOLID_HIGH : pattern; cvar; external;
  B_MIXED_COLORS : pattern; cvar; external;
  B_SOLID_LOW : pattern; cvar; external;

(*----------------------------------------------------------------*)
type
  rgb_Color = record
    red,
    green,
    blue,
    alpha : Byte;
  end;

(*----------------------------------------------------------------*)
var
  B_TRANSPARENT_COLOR : rgb_color; cvar; external;
  B_TRANSPARENT_MAGIC_CMAP8 : Byte; cvar; external;
  B_TRANSPARENT_MAGIC_RGBA15 : Word; cvar; external;
  B_TRANSPARENT_MAGIC_RGBA15_BIG : Word; cvar; external;
  B_TRANSPARENT_MAGIC_RGBA32 : Cardinal; cvar; external;
  B_TRANSPARENT_MAGIC_RGBA32_BIG : Cardinal; cvar; external;

  B_TRANSPARENT_8_BIT : Byte; cvar; external;
  B_TRANSPARENT_32_BIT : rgb_color; cvar; external;

(*----------------------------------------------------------------*)
type
  color_map = record
    id : Longint;
    color_list: array [0..255] of rgb_color;
    inversion_map : array [0..255] of Byte;
    index_map : array [0..32767] of Byte;
  end;

  overlay_rect_limits = record
    horizontal_alignment,
    vertical_alignment,
    width_alignment,
    height_alignment,
    min_width,
    max_width,
    min_height,
    max_height : Word;
    reserved : array [0..7] of Longword;
  end;

  overlay_restrictions = record
    source,
    destination : overlay_rect_limits;
    min_width_scale,
    max_width_scale,
    min_height_scale,
    max_height_scale : Single;
    reserved : array [0..7] of Longword;
  end;

(*----------------------------------------------------------------*)
  screen_id = record
    id : Longint;
  end;

var
  B_MAIN_SCREEN_ID : screen_id; cvar; external;

(*----------------------------------------------------------------*)
type
  color_space = Cardinal;

const
  B_NO_COLOR_SPACE = $0000; // byte in memory order, high bit first

  // linear color space (little endian is the default)
  B_RGB32  = $0008; // B[7:0]  G[7:0]  R[7:0]  -[7:0]
  B_RGBA32 = $2008; // B[7:0]  G[7:0]  R[7:0]  A[7:0]
  B_RGB24  = $0003; // B[7:0]  G[7:0]  R[7:0]
  B_RGB16  = $0005; // G[2:0],B[4:0]  R[4:0],G[5:3]
  B_RGB15  = $0010; // G[2:0],B[4:0]  	   -[0],R[4:0],G[4:3]
  B_RGBA15 = $2010; // G[2:0],B[4:0]  	   A[0],R[4:0],G[4:3]
  B_CMAP8  = $0004; // D[7:0]
  B_GRAY8  = $0002; // Y[7:0]
  B_GRAY1  = $0001; // Y0[0],Y1[0],Y2[0],Y3[0],Y4[0],Y5[0],Y6[0],Y7[0]

  // big endian version, when the encoding is not endianess independant
  B_RGB32_BIG  = $1008; // -[7:0]  R[7:0]  G[7:0]  B[7:0]
  B_RGBA32_BIG = $3008; // A[7:0]  R[7:0]  G[7:0]  B[7:0]
  B_RGB24_BIG  = $1003; // R[7:0]  G[7:0]  B[7:0]
  B_RGB16_BIG  = $1005; // R[4:0],G[5:3]  G[2:0],B[4:0]
  B_RGB15_BIG  = $1010; // -[0],R[4:0],G[4:3]  G[2:0],B[4:0]
  B_RGBA15_BIG = $3010; // A[0],R[4:0],G[4:3]  G[2:0],B[4:0]

  // little-endian declarations, for completness
  B_RGB32_LITTLE  = B_RGB32;
  B_RGBA32_LITTLE = B_RGBA32;
  B_RGB24_LITTLE  = B_RGB24;
  B_RGB16_LITTLE  = B_RGB16;
  B_RGB15_LITTLE  = B_RGB15;
  B_RGBA15_LITTLE = B_RGBA15;

  // non linear color space -- note that these are here for exchange purposes;
  // a BBitmap or BView may not necessarily support all these color spaces.

  // Loss/Saturation points are Y 16-235 (absoulte); Cb/Cr 16-240 (center 128)

  B_YCbCr422 = $4000; // Y0[7:0]  Cb0[7:0]  Y1[7:0]  Cr0[7:0]  Y2[7:0]...
                      // Cb2[7:0]  Y3[7:0]  Cr2[7:0]
  B_YCbCr411 = $4001; // Cb0[7:0]  Y0[7:0]  Cr0[7:0]  Y1[7:0]  Cb4[7:0]...
                      // Y2[7:0]  Cr4[7:0]  Y3[7:0]  Y4[7:0]  Y5[7:0]...
                      // Y6[7:0]  Y7[7:0]
  B_YCbCr444 = $4003; // Y0[7:0]  Cb0[7:0]  Cr0[7:0]
  B_YCbCr420 = $4004; // Non-interlaced only, Cb0  Y0  Y1  Cb2 Y2  Y3  on even scan lines ...
                      // Cr0  Y0  Y1  Cr2 Y2  Y3  on odd scan lines

  // Extrema points are Y 0 - 207 (absolute) U -91 - 91 (offset 128) V -127 - 127 (offset 128)
  // note that YUV byte order is different from YCbCr
  // USE YCbCr, not YUV, when that's what you mean!
  B_YUV422 = $4020; // U0[7:0]  Y0[7:0]   V0[7:0]  Y1[7:0] ...
                    // U2[7:0]  Y2[7:0]   V2[7:0]  Y3[7:0]
  B_YUV411 = $4021; // U0[7:0]  Y0[7:0]  Y1[7:0]  V0[7:0]  Y2[7:0]  Y3[7:0]
                    // U4[7:0]  Y4[7:0]  Y5[7:0]  V4[7:0]  Y6[7:0]  Y7[7:0]
  B_YUV444 = $4023; // U0[7:0]  Y0[7:0]  V0[7:0]  U1[7:0]  Y1[7:0]  V1[7:0]
  B_YUV420 = $4024; // Non-interlaced only, U0  Y0  Y1  U2 Y2  Y3  on even scan lines ...
                    // V0  Y0  Y1  V2 Y2  Y3  on odd scan lines
  B_YUV9   = $402C; // planar? 410?
  B_YUV12  = $402D; // planar? 420?

  B_UVL24  = $4030; // U0[7:0] V0[7:0] L0[7:0] ...
  B_UVL32  = $4031; // U0[7:0] V0[7:0] L0[7:0] X0[7:0]...
  B_UVLA32 = $6031; // U0[7:0] V0[7:0] L0[7:0] A0[7:0]...

  B_LAB24  = $4032; // L0[7:0] a0[7:0] b0[7:0] ...         (a is not alpha!)
  B_LAB32  = $4033; // L0[7:0] a0[7:0] b0[7:0] X0[7:0] ... (b is not alpha!)
  B_LABA32 = $6033; // L0[7:0] a0[7:0] b0[7:0] A0[7:0] ... (A is alpha)

  // red is at hue = 0
  B_HSI24  = $4040; // H[7:0]  S[7:0]  I[7:0]
  B_HSI32  = $4041; // H[7:0]  S[7:0]  I[7:0]  X[7:0]
  B_HSIA32 = $6041; // H[7:0]  S[7:0]  I[7:0]  A[7:0]

  B_HSV24  = $4042; // H[7:0]  S[7:0]  V[7:0]
  B_HSV32  = $4043; // H[7:0]  S[7:0]  V[7:0]  X[7:0]
  B_HSVA32 = $6043; // H[7:0]  S[7:0]  V[7:0]  A[7:0]

  B_HLS24  = $4044; // H[7:0]  L[7:0]  S[7:0]
  B_HLS32  = $4045; // H[7:0]  L[7:0]  S[7:0]  X[7:0]
  B_HLSA32 = $6045; // H[7:0]  L[7:0]  S[7:0]  A[7:0]

  B_CMY24  = $C001; // C[7:0]  M[7:0]  Y[7:0]         No gray removal done
  B_CMY32  = $C002; // C[7:0]  M[7:0]  Y[7:0]  X[7:0] No gray removal done
  B_CMYA32 = $E002; // C[7:0]  M[7:0]  Y[7:0]  A[7:0] No gray removal done
  B_CMYK32 = $C003; // C[7:0]  M[7:0]  Y[7:0]  K[7:0]

  // compatibility declarations
  B_MONOCHROME_1_BIT = B_GRAY1;
  B_GRAYSCALE_8_BIT  = B_GRAY8;
  B_COLOR_8_BIT      = B_CMAP8;
  B_RGB_32_BIT       = B_RGB32;
  B_RGB_16_BIT       = B_RGB15;
  B_BIG_RGB_32_BIT   = B_RGB32_BIG;
  B_BIG_RGB_16_BIT   = B_RGB15_BIG;

// Find out whether a specific color space is supported by BBitmaps.
// Support_flags will be set to what kinds of support are available.
// If support_flags is set to 0, false will be returned.
const
  B_VIEWS_SUPPORT_DRAW_BITMAP      = $1;
  B_BITMAPS_SUPPORT_ATTACHED_VIEWS = $2;

function bitmaps_support_space(space : color_space; support_flags : PLongword)
         : Boolean; cdecl; external 'be' name 'bitmaps_support_space';

// "pixel_chunk" is the native increment from one pixel starting on an integral
// byte to the next.
// "row_alignment" is the native alignment for pixel scanline starts.
// "pixels_per_chunk" is the number of pixels in a pixel_chunk. For instance,
// B_GRAY1 sets pixel_chunk to 1, row_alignment to 4 and pixels_per_chunk to 8,
// whereas B_RGB24 sets pixel_chunk to 3, row_alignment to 4 and
// pixels_per_chunk to 1.
function get_pixel_size_for(space : color_space; var pixel_chunk : size_t;
                            var row_alignment : size_t; var pixels_per_chunk : size_t)
         : status_t; cdecl; external 'be' name 'get_pixel_size_for';

(*----------------------------------------------------------------*)
type
  buffer_orientation = (B_BUFFER_TOP_TO_BOTTOM, B_BUFFER_BOTTOM_TO_TOP);

  buffer_layout = (unused_filler,
    B_BUFFER_NONINTERLEAVED // = 1
  );

(*----------------------------------------------------------------*)
  drawing_mode = (B_OP_COPY, B_OP_OVER, B_OP_ERASE, B_OP_INVERT, B_OP_ADD,
                 B_OP_SUBTRACT, B_OP_BLEND, B_OP_MIN, B_OP_MAX, B_OP_SELECT,
                 B_OP_ALPHA);

  source_alpha = (B_PIXEL_ALPHA, B_CONSTANT_ALPHA);
  alpha_function = (B_ALPHA_OVERLAY, B_ALPHA_COMPOSITE);

const
  B_8_BIT_640x480    = $00000001;
  B_8_BIT_800x600    = $00000002;
  B_8_BIT_1024x768   = $00000004;
  B_8_BIT_1280x1024  = $00000008;
  B_8_BIT_1600x1200  = $00000010;
  B_16_BIT_640x480   = $00000020;
  B_16_BIT_800x600   = $00000040;
  B_16_BIT_1024x768  = $00000080;
  B_16_BIT_1280x1024 = $00000100;
  B_16_BIT_1600x1200 = $00000200;
  B_32_BIT_640x480   = $00000400;
  B_32_BIT_800x600   = $00000800;
  B_32_BIT_1024x768  = $00001000;
  B_32_BIT_1280x1024 = $00002000;
  B_32_BIT_1600x1200 = $00004000;
  B_8_BIT_1152x900   = $00008000;
  B_16_BIT_1152x900  = $00010000;
  B_32_BIT_1152x900  = $00020000;
  B_15_BIT_640x480   = $00040000;
  B_15_BIT_800x600   = $00080000;
  B_15_BIT_1024x768  = $00100000;
  B_15_BIT_1280x1024 = $00200000;
  B_15_BIT_1600x1200 = $00400000;
  B_15_BIT_1152x900  = $00800000;

  // do not use B_FAKE_DEVICE--it will go away!
  B_FAKE_DEVICE      = $40000000;
  B_8_BIT_640x400    = $80000000;

(*---------------------------------------------------------------------------*)

implementation

end.