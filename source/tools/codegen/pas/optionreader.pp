{   BePascal - A pascal wrapper around the BeOS API                             
    Copyright (C) 2003 Olivier Coursiere                                        
                                                                                
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
unit optionreader;

interface

{$H+} // use AnsiStrings

uses
  Classes, SysUtils, GetOpts;
  
type
  TAnOption = class(TObject)
  private
    FName    : String;
    FHas_arg : Integer;
    FFlag    : PChar;
    FValue   : Char;
    FArg : string;
  public
    constructor Create(Option : TOption; aArg : string); virtual;
    property Name    : String  read FName;
    property Has_arg : Integer read FHas_arg;
    property Flag    : PChar   read FFlag;
    property Value   : Char    read FValue;
    property Arg     : string  read FArg; 
  end; 
  TOptions = class(TObject)
  private
    FStringList : TStringList;
    function GetOptions(OptionName : string) : TAnOption;
  public
    constructor Create(OptionList : string; LongOpts : POption); virtual;
    destructor Destroy; override;
    property Options[OptionName : string] : TAnOption read GetOptions;
  end;

implementation

constructor TAnOption.Create(Option : TOption; aArg : string);
begin
  inherited Create;
  FName := Option.Name;
  FHas_arg := Option.Has_arg;
  FFlag := Option.Flag;
  FValue := Option.Value;
  FArg := aArg;
end;

constructor TOptions.Create(OptionList : string; LongOpts : POption);
var
  OptionIndex : Longint;
  c : Char;
  i : integer;
  aOption : TOption;
begin
  inherited Create;
  OptionIndex := 0;
  FStringList := TStringList.Create;
  FStringList.Sorted := True;
  c := GetLongOpts(OptionList, LongOpts, OptionIndex);
  while c <> EndOfOptions do
  begin
    case c of 
      'a',
      'b' : 
        begin
          FillChar(aOption, SizeOf(aOption), #0);
          aOption.Name := c;          
          FStringList.AddObject(c, TAnOption.Create(aOption, OptArg));
        end;
      #0 : 
        begin
          FStringList.AddObject(LongOpts[OptionIndex - 1].Name, TAnOption.Create(LongOpts[OptionIndex - 1], OptArg));
        end;  
      '?' : WriteLn('Error');  
    end;
    c := GetLongOpts(OptionList, LongOpts, OptionIndex);
  end;
  WriteLn(FStringList.Text);
  for i := 0 to FStringList.Count - 1 do
  begin
    WriteLn(FStringList[i] + ' : ' + (FStringList.Objects[i] as TAnOption).Arg);
  end;
end;

destructor TOptions.Destroy;
var
  i : integer;
begin
  for i := 0 to FStringList.Count - 1 do
  begin
    FStringList.Objects[i].Free;
  end;
  FStringList.Free;
  inherited;
end;

function TOptions.GetOptions(OptionName : string) : TAnOption;
var
  index : integer;
begin
  if FStringList.Find(OptionName, index) then
  begin
    Result := FStringList.Objects[index] as TAnOption;
  end
  else
    Result := nil;
end;

end.
