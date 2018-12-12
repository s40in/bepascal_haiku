{  headertoxml - A tool from the befpc project
    Copyright (C) 2002 Olivier Coursiere

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
program headertoxml;

{
<?xml version="1.0"?>
<CLASSES>
  <CLASSE NAME="">
    <FUNCTION NAME="">
      <PARAMS>
        <PARAM NAME="" TYPE=""/>
        <PARAM NAME="" TYPE=""/>
	  </PARAMS>
      <RESULT TYPE=""/>
    </FUNCTION>  
  </CLASSE>
</CLASSES>
}

{$H+} // use AnsiStrings

uses
  Classes, SysUtils, stubgen;
  
const
  Eol = #10;

function Convert(s : string) : string;
begin
  Result := StringReplace(s, '&', '&amp;', [rfReplaceAll]);
end;
  
type
  TXMLWriter = class(TObject)
  private
    FFileName : string;
    FLevel : integer;
    FList : TStringList;
    procedure StartTag(TagName : string);
    procedure EndTags;
  public
    constructor Create(FileName : string);
    destructor Destroy; override;
    procedure StartClasses;
    procedure EndClasses;
    procedure StartClasse(Elem : PSyntaxelem);
    procedure EndClasse;
    procedure StartFunction(Elem : PSyntaxelem);
    procedure EndFunction;
    procedure StartParams;
    procedure EndParams;
    procedure StartParam(Elem : PArgument);
    procedure StartResult(aType : PChar);
  end;

constructor TXMLWriter.Create(FileName : string);
begin
  inherited Create;
  FLevel := 0;  
  FList := TStringList.Create;
  FFileName := ChangeFileExt(FileName, '.xml');
end;

destructor TXMLWriter.Destroy;
begin
  FList.SaveToFile(FFileName);
  FList.Free;
  inherited;
end;
 
procedure TXMLWriter.StartTag(TagName : string);
begin
  Inc(FLevel);
end;

procedure TXMLWriter.EndTags;
var
  i : integer;
begin
  for i := 0 to FLevel - 1 do
  begin
//    Write
  end;
end;

procedure TXMLWriter.StartClasses;
begin
  FList.Add('<CLASSES>');
end;

procedure TXMLWriter.EndClasses;
begin
  FList.Add('</CLASSES>');
end;

procedure TXMLWriter.StartClasse(Elem : PSyntaxelem);
begin
  if Elem <> nil then
    FList.Add(Format('<CLASSE NAME="%s">', [Elem^.aName]))
  else
    WriteLn('Classe nil');
end;

procedure TXMLWriter.EndClasse;
begin
  FList.Add('</CLASSE>');
end;

procedure TXMLWriter.StartFunction(Elem : PSyntaxelem);
begin
  FList.Add(Format('<FUNCTION NAME="%s">', [Elem^.aName]));
end;

procedure TXMLWriter.EndFunction;
begin
  FList.Add('</FUNCTION>');
end;

procedure TXMLWriter.StartParams;
begin
  FList.Add('<PARAMS>');
end;

procedure TXMLWriter.EndParams;
begin
  FList.Add('</PARAMS>');
end;

procedure TXMLWriter.StartParam(Elem : PArgument);
begin
  if (Elem^.aType <> 'void') or (Elem^.aName <> '') then
    FList.Add(Format('<PARAM NAME="%s" TYPE="%s"/>', [Elem^.aName, Convert(Elem^.aType)]));
end;

procedure TXMLWriter.StartResult(aType : PChar);
begin
  if aType <> nil then
    FList.Add(Format('<RESULT TYPE="%s"/>', [Convert(aType)]));
end;

var
  Elem : PSyntaxelem;  
  fic : PChar;
  s : string;
  XMLWriter : TXMLWriter;
  Current : PSyntaxelem;
  CurrentArg : PArgument;
begin
  WriteLn('headertoxml');
  if ParamCount > 0 then
  begin
    WriteLn(Paramstr(1));
    init_tables;
    s := Paramstr(1) + #0;
    UniqueString(s);
    fic := PChar(s);    
    Elem := scan(fic);    
    XMLWriter := TXMLWriter.Create(s);
    try
      XMLWriter.StartClasses;
      while Elem <> nil do
      begin       
        if Elem <> nil then
          WriteLn(Elem^.aName);
        XMLWriter.StartClasse(Elem);
        XMLWriter.StartFunction(Elem^.children);
        CurrentArg := Elem^.args;
        if CurrentArg <> nil then
        begin
          XMLWriter.StartParam(CurrentArg);
          while CurrentArg^.Next <> nil do
          begin
            CurrentArg := CurrentArg^.Next;
            XMLWriter.StartParam(CurrentArg);
          end;
        end;
        XMLWriter.StartResult(Elem^.ret_type);
        XMLWriter.EndFunction;
        Current := Elem^.children;
          while Current^.next <> nil do
          begin
            Current := Current^.next;
            XMLWriter.StartFunction(Current);
            CurrentArg := Current^.args;
            if CurrentArg <> nil then
            begin
              XMLWriter.StartParam(CurrentArg);
              while CurrentArg^.next <> nil do
              begin
                CurrentArg := CurrentArg^.next;
                XMLWriter.StartParam(CurrentArg);
              end;
            end;
            XMLWriter.StartResult(Current^.ret_type);          
            XMLWriter.EndFunction;
          end; 
        XMLWriter.EndClasse;
        Elem := Elem^.next;
      end;  
      XMLWriter.EndClasses;
    finally
      XMLWriter.Free;
    end;
    free_tables;
  end;
end.
