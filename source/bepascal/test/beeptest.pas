program BeepTest;

uses
  _Beep;

const
  kUnitName = '_Beep';

var
  Errors : Byte;
begin
  Errors := 0;
  WriteLn('Testing unit: ' + kUnitName);
  WriteLn('===================');

  WriteLn('Beeping..');
  if beep < 0 then
  begin
    Inc(Errors);
    WriteLn('Failed.');
  end;

  WriteLn('Now the system beeps...');
  if system_beep('bla') < 0 then
  begin
    WriteLn('Failed (ok).');
  end
  else
    Inc(Errors);

  if system_beep('Beep') < 0 then
  begin
    Inc(Errors);
    WriteLn('Failed (shouldn''t).');
  end;

  if Errors = 0 then
    WriteLn('Test of unit ' + kUnitName + ' PASSED')
  else
    WriteLn('Test of unit ' + kUnitName + ' FAILED with ', Errors, ' Error(s)');
end.