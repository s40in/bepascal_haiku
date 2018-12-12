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

unit codewrite;

interface

{$H+} // use AnsiStrings

uses
  Classes, SysUtils, apireader, sourcewrite;

type
  TSourceGen = class(TObject)
  private
    FClasses : TDocument;
    FHooks : TDocument;
  protected
    procedure Enum(Node : TNode);
  public
    constructor Create(Classes, Hooks : TDocument; FileName : string); virtual;
    destructor Destroy; override;
    procedure Gen;
  end;
 
implementation

constructor TSourceGen.Create(Classes, Hooks : TDocument; FileName : string);
begin
  inherited Create;
  FClasses := Classes;
  FHooks := Hooks;
  SourceWriter := TSourceWriter.Create(FileName);
end;

destructor TSourceGen.Destroy;
begin
  SourceWriter.Free;
  inherited;
end;

procedure TSourceGen.Gen;
begin
  Enum(FClasses);
end;

procedure TSourceGen.Enum(Node : TNode);
var
  i : integer;
begin
	if Node <> nil then
	begin
    for i := 0 to Node.Count - 1 do
    begin
      Node.Start;
      WriteLn('Before Enum');
      Node.Middle;
      WriteLn('After enum');
      Node.Ends;
    end;
  end;
end;


end.
