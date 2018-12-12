unit UTF8;
// Description: UTF-8 conversion functions.

interface

uses
  InterfaceDefs, SupportDefs;

//------- Conversion Flavors ---------------------------------
const
  B_ISO1_CONVERSION            =  0; // ISO 8859-1
  B_ISO2_CONVERSION            =  1; // ISO 8859-2
  B_ISO3_CONVERSION            =  2; // ISO 8859-3
  B_ISO4_CONVERSION            =  3; // ISO 8859-4
  B_ISO5_CONVERSION            =  4; // ISO 8859-5
  B_ISO6_CONVERSION            =  5; // ISO 8859-6
  B_ISO7_CONVERSION            =  6; // ISO 8859-7
  B_ISO8_CONVERSION            =  7; // ISO 8859-8
  B_ISO9_CONVERSION            =  8; // ISO 8859-9
  B_ISO10_CONVERSION           =  9; // ISO 8859-10
  B_MAC_ROMAN_CONVERSION       = 10; // Macintosh Roman
  B_SJIS_CONVERSION            = 11; // Shift-JIS
  B_EUC_CONVERSION             = 12; // EUC Packed Japanese
  B_JIS_CONVERSION             = 13; // JIS X 0208-1990
  B_MS_WINDOWS_CONVERSION      = 14; // MS-Windows Codepage 1252
  B_UNICODE_CONVERSION         = 15; // Unicode 2.0
  B_KOI8R_CONVERSION           = 16; // KOI8-R
  B_MS_WINDOWS_1251_CONVERSION = 17; // MS-Windows Codepage 1251
  B_MS_DOS_866_CONVERSION      = 18; // MS-DOS Codepage 866
  B_MS_DOS_CONVERSION          = 19; // MS-DOS Codepage 437
  B_EUC_KR_CONVERSION          = 20; // EUC Korean
  B_ISO13_CONVERSION           = 21; // ISO 8859-13
  B_ISO14_CONVERSION           = 22; // ISO 8859-14
  B_ISO15_CONVERSION           = 23; // ISO 8859-15

//------- Conversion Functions --------------------------------
function convert_to_utf8(srcEncoding : Longword; const src : PChar;
                         srcLen : Longint; dst : PChar; dstLen : Longint;
                         state : Longint; substitute : Char {$ifndef VER1_0}= B_SUBSTITUTE{$endif})
         : status_t; cdecl; external 'be' name 'convert_to_utf8__FUlPCcPlPcT2';
//         : status_t; cdecl; external 'textencoding' name 'convert_to_utf8__FUlPCcPlPcT2T2c';

function convert_from_utf8(dstEncoding : Longword; const src : PChar;
                         srcLen : Longint; dst : PChar; dstLen : Longint;
                         state : Longint; substitute : Char {$ifndef VER1_0}= B_SUBSTITUTE{$endif})
         : status_t; cdecl; external 'be' name 'convert_from_utf8__FUlPCcPlPcT2';
//         : status_t; cdecl; external 'textencoding' name 'convert_from_utf8__FUlPCcPlPcT2T2c';

implementation

end.