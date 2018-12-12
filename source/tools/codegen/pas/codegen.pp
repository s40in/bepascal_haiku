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
program codegen;

{$H+} // use AnsiStrings 

uses
  dom, xmlread, apireader, typmap, codewrite, SysUtils, OptionReader,
  getopts;

const
  SupportedOptions : array[0..2] of TOption = ((Name : 'aoption'; Has_arg : Optional_Argument; Flag : nil; Value : #0), 
                                               (Name : 'boption'; Has_arg : Optional_Argument; Flag : nil; Value : #0),
                                               (Name : ''; Has_arg : NO_Argument; Flag : nil; Value : #0));
var
  aDoc : TXMLDocument;
  HooksDoc : TXMLDocument;
  Classes, Hooks : TDocument;
  SrcGen : TSourceGen;
  Options : TOptions;
begin
  if ParamCount > 0 then
  begin
    Options := TOptions.Create('a::b::', @SupportedOptions[0]);
    try
      ReadXMLFile(aDoc, Paramstr(1));
      ReadXMLFile(HooksDoc, 'hooks.xml');
      Classes := TDocument.Create(aDoc);
      try
        Hooks := TDocument.Create(HooksDoc);
        try
          SrcGen := TSourceGen.Create(Classes, Hooks, StringReplace(Paramstr(1), '.xml', '', []));
          try
            SrcGen.Gen;
            WriteLn('After gen');
          finally
            SrcGen.Free;
          end;
        finally
          Hooks.Free;
        end;
      finally
        Classes.Free;
      end;
    finally
      Options.Free;
    end;
  end;

end.
