(*
  This unit shows a difference between FPC's compiler modes.
  In the mode objfpc (-S2) this units doesn't compile, the error message is:
    "Duplicate identifier Preset."
  If we use Delphi mode (-Sd) it compiles without any errors.

  From FPC developers: "we made that desicion so you write less bogus code."
  
  This means, fpc modes are stricter on the sintaxis than Delphi is.
  Nothing on FPC docs indicates this difference. According to one of the FPC
  developers, they will add this to the documentation.

  To avoid this: either use other names for parameters, or use:
  {$mode Delphi}

*)

unit CompilerModes;

{.$mode Delphi} // <<-- remove the dot to compile

interface

type
  TAClass = class
  private
    fPreset : Boolean;
  public
    procedure SetPreset(Preset : Boolean);
    property Preset : Boolean read fPreset write SetPreset;
  end;

implementation

procedure TAClass.SetPreset(Preset : Boolean);
begin
  if Preset = fPreset then Exit;
  fPreset := Preset;
end;

end.