program OpTest;

uses
  BeObj, SysUtils, AppDefs;

const
 B_TESTING  = 'TeSt';

var
  Testing : Longword;
  tmp : Longword;

begin
  WriteLn('This value correspond to AppDefs''s B_ABOUT_REQUESTED:');
  WriteLn(IntToStr(B_ABOUT_REQUESTED));
  WriteLn('and this other is made using the := operator');
  Testing := '_ABR';
  WriteLn(IntToStr(Testing));
  WriteLn('Comparing both as integer types:');
  if Testing = B_ABOUT_REQUESTED then
    WriteLn('Fear C! this coder knows things! :-)')
  else
    WriteLn('Boooo!!! the programmer must be dumb!');

  WriteLn('--------------------------------');
  WriteLn('Direct assignment to Longword type:');
  tmp := B_TESTING;
  WriteLn('tmp: ', tmp);
  WriteLn('Typecasting to Longword type:');
  tmp := tmp + Longword(B_TESTING);
  WriteLn('tmp: ', tmp);
  WriteLn('Typecasting to integer type:');
  tmp := tmp - Integer(Longword(B_TESTING));
  WriteLn('tmp: ', tmp);
end.