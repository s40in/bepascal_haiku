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

unit apireader;

{$H+} // use AnsiStrings

interface

uses
  Classes, SysUtils, xmlread, dom;
  
const
  ImportFuncString =  ' cdecl; external BePascalLibName name ''%s_%s'';';

type
  TNode = class(TObject)
  private
    function GetCount : integer;
    function GetNode(Index : integer) : TNode;
  protected
    FNode : TDOMNode;
    FChildren : TStringList;      
  public
    constructor Create(Node : TDOMNode); virtual;
    destructor Destroy; override;
    procedure Start; virtual;
    procedure Middle; virtual;
    procedure Ends; virtual;
    property Count : integer read GetCount;
    property Nodes[Index : integer] : TNode read GetNode;
  end;
  TClassess = class;
  TDocument = class(TNode)
  private
    function GetClasses(Index : integer) : TClassess;
  protected
  public
    constructor Create(Node : TDOMNode); override;  
    procedure Start; override;
    procedure Middle; override;
    procedure Ends; override;    
    property Classes[Index : integer] : TClassess read GetClasses;
  end;
  TClasse = class;
  TClassess = class(TNode)
  private
    function GetClasse(Index : integer) : TClasse;
  protected
  public
    constructor Create(Node : TDOMNode); override;
    procedure Start; override;
    procedure Middle; override;
    procedure Ends; override;    
    property Classes[Index : integer] : TClasse read GetClasse;
  end;
  TNamedItem = class(TNode)
  private 
  protected
    function GetName : string;
  public
    property Name : string read GetName;  
  end;
  TFunction = class;
  TClasse = class(TNamedItem)
  private    
    function GetFunction(Index : integer) : TFunction;
  protected
    function GetAncestor : string;
  public
    constructor Create(Node : TDOMNode); override;  
    procedure Start; override;
    procedure Ends; override;
    property Ancestor : string read GetAncestor;
    property Functions[Index : integer] : TFunction read GetFunction;
  end;
  TResultType = class;
  TParam = class;  
  TFunction = class(TNamedItem)
  private
    FResultType : TResultType;
    FClasse : TClasse;
    BodyPas : string;
    function GetParam(Index : integer) : TParam;
  protected
  public
    constructor Create(Node : TDOMNode); override;  
    destructor Destroy; override;
    function IsConstructor : boolean;
    function IsDestructor : boolean;
    function HasParams : boolean;
    function ProcName : string;
    function ProcNameInObject : string;    
    function SelfParam : string;
    function SelfParamImpl : string;
    procedure Start; override;
    procedure Ends; override;    
    property ResultType : TResultType read FResultType;
    property Params[Index : integer] : TParam read GetParam;
    property Classe : TClasse read FClasse;
  end;
  TTypedItem = class(TNamedItem)
  private
  protected
    function GetType : string;
  public
    function IsObject : boolean;
    property Typ : string read GetType;
  end;
  TParam = class(TTypedItem)
  private
    FFunction : TFunction;
  protected
  public
    procedure Middle; override;
    property ParentFunction : TFunction read FFunction;
  end;
  TResultType = class(TNode)
  private
  protected
    function GetType : string;
  public
    property Typ : string read GetType;    
  end;

implementation

uses
  sourcewrite, typmap;
  
// Debug proc
procedure NodeInfo(Node : TDOMNode);
begin
  WriteLn(Node.NodeName + ',' + Node.NodeValue + ',' + IntToStr(Node.NodeType));
end;

constructor TNode.Create(Node : TDOMNode);
begin
  inherited Create;
  FNode := Node;
end;

destructor TNode.Destroy;
var
  i : integer;
begin
  if FChildren <> nil then
  begin
    for i := 0 to FChildren.Count - 1 do
    begin
      if FChildren.Objects[i] <> nil then
        FChildren.Objects[i].Free;
    end;
    FChildren.Free;
  end;
  inherited;
end;

function TNode.GetCount : integer;
begin
  if FChildren <> nil then
    Result := FChildren.Count
  else
    Result := 0;
end;

function TNode.GetNode(Index : integer) : TNode;
begin
  Result := FChildren.Objects[Index] as TNode;
end;

procedure TNode.Start;
begin
  Write('Start : '); 
  if FNode <> nil then
    NodeInfo(FNode); 
end;

procedure TNode.Middle;
var
  i : integer;
begin
  Write('Middle : '); 
  if FNode <> nil then  
  begin
    NodeInfo(FNode); 
    for i := 0 to Count - 1 do
    begin
      Nodes[i].Start;
      Nodes[i].Middle;
      Nodes[i].Ends;
    end;
  end;
end;

procedure TNode.Ends;
begin
  Write('Ends : '); 
  if FNode <> nil then
    NodeInfo(FNode); 
end;

constructor TDocument.Create(Node : TDOMNode);
var
  i : integer;
  aClasses : TClassess;
  List : TStringList;
begin
  if Node.HasChildNodes then
  begin
    List := TStringList.Create;
    for i := 0 to Node.ChildNodes.count - 1 do
    begin
      aClasses := TClassess.Create(Node.ChildNodes.Item[i]);
      List.AddObject(IntToStr(i), aClasses);
    end;
    FChildren := List; 
  end;
end;

function TDocument.GetClasses(Index : integer) : TClassess;
begin
  Result := FChildren.Objects[Index] as TClassess;
end;

procedure TDocument.Start;
begin
end;

procedure TDocument.Middle;
var
  i : integer;
begin
  for i := 0 to Count - 1 do
  begin
    Classes[i].Start;
    Classes[i].Middle;
    Classes[i].Ends;
  end;
end;

procedure TDocument.Ends;
begin
end;
 
constructor TClassess.Create(Node : TDOMNode);
var
  i : integer;
  aClasse : TClasse;
  List : TStringList;
begin
  inherited;
  if Node.HasChildNodes then
  begin
    List := TStringList.Create;
    for i := 0 to Node.ChildNodes.count - 1 do
    begin
      aClasse := TClasse.Create(Node.ChildNodes.Item[i]);
      List.AddObject(aClasse.Name, aClasse);
    end;
    FChildren := List; 
  end;
end;

function TClassess.GetClasse(Index : integer) : TClasse;
begin
  Result := FChildren.Objects[Index] as TClasse;
end;

function TNamedItem.GetName : string;
var
  DomNode : TDOMNode;
begin
  DomNode := FNode.Attributes.GetNamedItem('NAME');
  if DomNode <> nil then
  begin
    Result := DomNode.NodeValue;
  end;
end;

procedure TClassess.Start;
begin
  SourceWriter.Pas.Add('');
end;

procedure TClassess.Middle;
var
  i : integer;
begin
  for i := 0 to Count - 1 do
  begin
    Nodes[i].Start;
    Nodes[i].Middle;
    Nodes[i].Ends;
  end;
end;

procedure TClassess.Ends;
begin
end;

constructor TClasse.Create(Node : TDOMNode);
var
  i : integer;
  aFunc : TFunction;
  List : TStringList;
begin
  inherited;
  if Node.HasChildNodes then
  begin
    List := TStringList.Create;
    for i := 0 to Node.ChildNodes.count - 1 do
    begin
      aFunc := TFunction.Create(Node.ChildNodes.Item[i]);
      aFunc.FClasse := Self;
      WriteLn(aFunc.Name);
      WriteLn('');
      List.AddObject(aFunc.Name, aFunc);
    end;
    FChildren := List; 
  end;  
end;

function TClasse.GetAncestor : string;
begin
  if FNode.Attributes.GetNamedItem('ANCESTOR') <> nil then
    Result := FNode.Attributes.GetNamedItem('ANCESTOR').NodeValue
  else
    Result := '';
end;

function TClasse.GetFunction(Index : integer) : TFunction;
begin
  Result := FChildren.Objects[Index] as TFunction;
end;

procedure TClasse.Start;
begin
  with SourceWriter.InterfacePas do
  begin
    Add('type');
    Add(Format('  %s = class(%s)', [CppToPas(Name + ' *'), CppToPas(Ancestor + ' *')]));
    Add('  private');
    Add('  public');
  end;
end;

procedure TClasse.Ends;
begin
  with SourceWriter.InterfacePas do
  begin
    Add('  end;');
  end;
end;

constructor TFunction.Create(Node : TDOMNode);
var
  i : integer;
  aParam : TParam;
  List : TStringList;
begin
  inherited;
  if Node.HasChildNodes then
  begin
    List := TStringList.Create;
    for i := 0 to Node.ChildNodes.count - 1 do
    begin
      if Node.ChildNodes.Item[i].Attributes.GetNamedItem('NAME') <> nil then
      begin
        aParam := TParam.Create(Node.ChildNodes.Item[i]);
        aParam.FFunction := Self;
        WriteLn('Param : ' + aParam.Name + '; ' + 'Type : ' + aParam.Typ);
        List.AddObject(aParam.Name, aParam);
      end
      else
      begin
        FResultType := TResultType.Create(Node.ChildNodes.Item[i]);
        WriteLn('ResultType : ' + FResultType.Typ);
      end;
    end;
    FChildren := List; 
  end;  
end;

destructor TFunction.Destroy;
begin
  if Assigned(FResultType) then
    FResultType.Free;
  inherited;
end;

function TFunction.IsConstructor : boolean;
begin
  Result := (Name = Classe.Name);
end;

function TFunction.IsDestructor : boolean;
begin
  Result := (Name[1] = '~');
end;

function TFunction.GetParam(Index : integer) : TParam;
begin
  Result := FChildren.Objects[Index] as TParam;
end;

function TFunction.HasParams : boolean;
begin
  Result := (Count > 0);
end;

function TFunction.ProcName : string;
begin
  if IsConstructor then
    Result := 'Create'
  else if IsDestructor then
    Result := 'Free'
  else
    Result := Name;
end;

function TFunction.ProcNameInObject : string;
begin
  if IsConstructor then
    Result := 'Create'
  else if IsDestructor then
    Result := 'Destroy'
  else
    Result := Name;
end;

function TFunction.SelfParam : string;
begin
  if IsConstructor then
    Result := '(AObject : TBeObject; '
  else
    Result := '(AObject : TCPlusObject; '
end;

function TFunction.SelfParamImpl : string;
begin
  if IsConstructor then
    Result := '(Self, '
  else
    Result := '(CPlusObject, '
end;

procedure TFunction.Start;
var
  EndChar : string;
begin
  WriteLn('Function Start');
  if HasParams then
    EndChar := '('
  else
    EndChar := '';
  with SourceWriter.InterfacePas do
  begin
    if IsConstructor then
      Add(Format('    constructor %s%s', [ProcNameInObject, EndChar]))
    else if IsDestructor then
      Add(Format('    destructor %s%s', [ProcNameInObject, EndChar]))
    else if (ResultType.Typ = '') or (ResultType.Typ = 'void') then
      Add(Format('    procedure %s%s', [Name, EndChar]))
    else
      Add(Format('    function %s%s', [Name, EndChar]));
  end;
    // Import of C functions
  with SourceWriter.ImportFuncsPas do
  begin
    if ((ResultType.Typ = '') or (ResultType.Typ = 'void')) and
        not IsConstructor then
      Add(Format('procedure %s_%s%s', [Classe.Name, ProcName, SelfParam]))
    else
      Add(Format('function %s_%s%s', [Classe.Name, ProcName, SelfParam]));
  end;
  with SourceWriter.ImplementationPas do
  begin
    if (ResultType.Typ = '') or (ResultType.Typ = 'void') then
    begin
      if IsConstructor then
        Add(Format('constructor %s.%s%s', [CppToPas(Classe.Name + ' *'), ProcNameInObject, EndChar]))
      else if IsDestructor then
        Add(Format('destructor %s.%s%s', [CppToPas(Classe.Name + ' *'), ProcNameInObject, EndChar]))
      else
        Add(Format('procedure %s.%s%s', [CppToPas(Classe.Name + ' *'), ProcName, EndChar]));
    end
    else
      Add(Format('function %s.%s%s', [CppToPas(Classe.Name + ' *'), ProcName, EndChar]));    
  end;
  // Implementation body
    if IsConstructor then
      BodyPas := Format('  CPlusObject := %s_%s%s', [Classe.Name, ProcName, SelfParamImpl])      
    else if (ResultType.Typ = '') or (ResultType.Typ = 'void') then
      BodyPas := Format('  %s_%s%s', [Classe.Name, ProcName, SelfParamImpl])
    else
      BodyPas := Format('  Result := %s_%s%s', [Classe.Name, ProcName, SelfParamImpl]);
end;

procedure TFunction.Ends;
var
  EndChar : string;
  procedure DeleteLastSep(List : TStringList);
  var
    s : string;
  begin
    // Delete the last '; '
    s := List.Strings[List.Count - 1];
    System.Delete(s, Length(s) - 1, 2);
    List.Strings[List.Count - 1] := s; 
  end;
  procedure AddLastSep(List : TStringList);
  var
    s : string;
  begin
    if not((ResultType.Typ = '') or (ResultType.Typ = 'void')) then
    begin
      WriteLn(ResultType.Typ);
      WriteLn(Name);
      s := Format('%s%s : %s;', [List.Strings[List.Count - 1], EndChar, CppToPas(ResultType.Typ)]);
      List.Strings[List.Count - 1] := s;
    end
    else if IsConstructor then
    begin
      WriteLn(ResultType.Typ);
      WriteLn(Name);
      s := Format('%s%s;', [List.Strings[List.Count - 1], EndChar]);
      List.Strings[List.Count - 1] := s;    
    end
    else
      List.Strings[List.Count - 1] := Format('%s%s;', [List.Strings[List.Count - 1], EndChar]);
  end;
var
  s : string;
begin
  WriteLn('Function ends');
  if hasParams then
  begin
    EndChar := ')';
    DeleteLastSep(SourceWriter.InterfacePas);
  end
  else
  begin
    EndChar := '';
  end;
  AddLastSep(SourceWriter.InterfacePas);
    // Import C functions
  EndChar := ')';
  DeleteLastSep(SourceWriter.ImportFuncsPas);
  AddLastSep(SourceWriter.ImportFuncsPas);
  with SourceWriter.ImportFuncsPas do
  begin
    s := Format('%s' + ImportFuncString, [Strings[Count - 1], Classe.Name, ProcName]);
    Strings[Count - 1] := s;
  end;
  
  if hasParams then
  begin
    EndChar := ')';
    DeleteLastSep(SourceWriter.ImplementationPas);
  end
  else
  begin
    EndChar := '';
  end;
  AddLastSep(SourceWriter.ImplementationPas);
  SourceWriter.ImplementationPas.Add('begin');  
  System.Delete(BodyPas, Length(BodyPas) - 1, 2);
  SourceWriter.ImplementationPas.Add(BodyPas + ');');
  SourceWriter.ImplementationPas.Add('end;');
  SourceWriter.ImplementationPas.Add('');      
end;

function TTypedItem.GetType : string;
begin
  Result := FNode.Attributes.GetNamedItem('TYPE').NodeValue;
end;

function TTypedItem.IsObject : boolean;
begin
  // The first letter is a 'B' -> this is an object !
  Result := (Typ[1] = 'B');
end;

procedure TParam.Middle;
  procedure WriteParamImport(List : TStringList);
  var
    s : string;
  begin
    WriteLn('WriteParamImport');
    WriteLn(List.Strings[List.Count - 1]);
    if IsObject then
    begin
      WriteLn('IsObject');
      s := Format('%s%s : %s; ', [List.Strings[List.Count - 1], Name, 'TCPlusObject']);
    end
    else
      s := Format('%s%s : %s; ', [List.Strings[List.Count - 1], Name, CppToPas(Typ)]);
    List.Strings[List.Count - 1] := s;
    WriteLn(List.Strings[List.Count - 1]);    
  end;
  procedure WriteParam(List : TStringList);
  var
    s : string;
  begin
    WriteLn(List.Strings[List.Count - 1]);
    s := Format('%s%s : %s; ', [List.Strings[List.Count - 1], Name, CppToPas(Typ)]);
    List.Strings[List.Count - 1] := s;
    WriteLn(List.Strings[List.Count - 1]);    
  end;
begin
  WriteLn('Param Middle');
  WriteParam(SourceWriter.InterfacePas);
  WriteParamImport(SourceWriter.ImportFuncsPas);
  WriteParam(SourceWriter.ImplementationPas);
  if IsObject then
    ParentFunction.BodyPas := Format('%s%s.CPlusObject, ', [ParentFunction.BodyPas, Name])
  else
    ParentFunction.BodyPas := Format('%s%s, ', [ParentFunction.BodyPas, Name]);
end;

function TResultType.GetType : string;
begin
  Result := FNode.Attributes.GetNamedItem('TYPE').NodeValue;
end;

end.
