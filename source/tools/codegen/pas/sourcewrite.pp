{   BePascal - A pascal wrapper around the BeOS API                             
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

unit sourcewrite;

{$H+} // use AnsiStrings

interface

uses
  SysUtils, Classes, apireader;
  
const
  Eol = #10;
  CLicense = 
'/*  BePascal - A pascal wrapper around the BeOS API                             ' + Eol +
'    Copyright (C) 2002 Olivier Coursiere                                        ' + Eol +
'                       Eric Jourde                                              ' + Eol +
'                                                                                ' + Eol +
'    This library is free software; you can redistribute it and/or               ' + Eol +
'    modify it under the terms of the GNU Library General Public                 ' + Eol +
'    License as published by the Free Software Foundation; either                ' + Eol +
'    version 2 of the License, or (at your option) any later version.            ' + Eol +
'                                                                                ' + Eol +
'    This library is distributed in the hope that it will be useful,             ' + Eol +
'    but WITHOUT ANY WARRANTY; without even the implied warranty of              ' + Eol +
'    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           ' + Eol +
'    Library General Public License for more details.                            ' + Eol +
'                                                                                ' + Eol +
'    You should have received a copy of the GNU Library General Public           ' + Eol +
'    License along with this library; if not, write to the Free                  ' + Eol +
'    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   ' + Eol +
'*/                                                                              ';
  PasLicense = 
'{   BePascal - A pascal wrapper around the BeOS API                             ' + Eol +
'    Copyright (C) 2002 Olivier Coursiere                                        ' + Eol +
'                       Eric Jourde                                              ' + Eol +
'                                                                                ' + Eol +
'    This library is free software; you can redistribute it and/or               ' + Eol +
'    modify it under the terms of the GNU Library General Public                 ' + Eol +
'    License as published by the Free Software Foundation; either                ' + Eol +
'    version 2 of the License, or (at your option) any later version.            ' + Eol +
'                                                                                ' + Eol +
'    This library is distributed in the hope that it will be useful,             ' + Eol +
'    but WITHOUT ANY WARRANTY; without even the implied warranty of              ' + Eol +
'    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU           ' + Eol +
'    Library General Public License for more details.                            ' + Eol +
'                                                                                ' + Eol +
'    You should have received a copy of the GNU Library General Public           ' + Eol +
'    License along with this library; if not, write to the Free                  ' + Eol +
'    Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA   ' + Eol +
'}                                                                               ';
    
type
  TSourceWriter = class(TObject)
  private
    FH : TStringList;
    FCpp : TStringList;
    FPas : TStringList;
    FFileName : string;
    FHooks : TDocument;
    FInterfacePas : TStringList;
    FImplementationPas : TStringList;
    FImportFuncsPas : TStringList;
  public
    constructor Create(FileName : string); virtual;
    destructor Destroy; override;
    property H : TStringList read FH;
    property Cpp : TStringList read FCpp;
    property Pas : TStringList read FPas;
    property Hooks : TDocument read FHooks write FHooks;    
    property InterfacePas : TStringList read FInterfacePas;
    property ImplementationPas : TStringList read FImplementationPas;
    property ImportFuncsPas : TStringList read FImportFuncsPas;
  end;

var
  SourceWriter : TSourceWriter;

implementation

constructor TSourceWriter.Create(FileName : string);
begin
  inherited Create;
  FFileName := FileName;
  FH := TStringList.Create;
  FH.Add(CLicense);
  FCpp := TStringList.Create;
  FCpp.Add(CLicense);
  FPas := TStringList.Create;  
  FPas.Add(PasLicense);
  FPas.Add('unit ' + LowerCase(FFileName) + ';');
  FPas.Add('');
  FPas.Add('interface');
  FPas.Add('');
  FPas.Add('uses');
  FPas.Add('  beobj;');
  FInterfacePas := TStringList.Create;
  FImplementationPas := TStringList.Create;
  FImportFuncsPas := TStringList.Create;
end;

destructor TSourceWriter.Destroy;
begin
  // Writing files
  FH.SaveToFile(FFileName + '.h');
  FH.Free;
  FCpp.SaveToFile(FFileName + '.cpp');
  FCpp.Free;
  FPas.Add(FInterfacePas.Text);
  FPas.Add(FImportFuncsPas.Text);
  FPas.Add('implementation');
  FPas.Add('');
  FPas.Add(FImplementationPas.Text);
  // write the end of pascal unit
  FPas.Add('end.');
  FPas.SaveToFile(LowerCase(FFileName) + '.pp');
  FPas.Free;
  FInterfacePas.Free;
  FImplementationPas.Free;
  FImportFuncsPas.Free;
  inherited;
end;

end.
