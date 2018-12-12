{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
                            Eric Jourde

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
unit Other_View;

{$M+}
interface

uses
  Box, Button, GraphicDefs, InterfaceDefs, Message, Rect, StatusBar,
  Stringview, View,
  Common;

type 
	Tother_View = class(BView)
	public
   	constructor Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal); 

 		Box1 : BBox;
 		Box2 : BBox;
 	  StatusBar1 : BStatusBar;
   	Button1: BButton;    
   	Button2: BButton;    
   	Button3: BButton;    
   	Value : BStringView;
  end;

implementation

constructor Tother_View.Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal);
Var
  aRect2,aRect3 : BRect;  
  mess : BMessage;
  rgb : RGB_color;
begin
  inherited;
  SetViewColor(ui_color(B_PANEL_BACKGROUND_COLOR));  

  // Box for Statusbar
  aRect2 := BRect.Create(20, 20, 200, 300);
  Box2 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box2.SetLabel('BStatusBar ');
  Box2.SetBorder(B_FANCY_BORDER);
  AddChild(Box2, nil);
  aRect2.Free;

  // StatusBar1 
  aRect2 := BRect.Create(20, 20, 170, 200); 
  StatusBar1 := BStatusBar.Create(aRect2, 'SB1', 'StatusBar1', 'Trailing Label'); 
  Box2.AddChild(StatusBar1, nil); 
  aRect2.Free; 

  // Button 1
  aRect2 := BRect.Create(20, 60, 100, 70);
  mess := BMessage.Create(MSG_BUTTON_BASE+4);
  Button1 := BButton.Create(aRect2, 'Button 1', 'Inc', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button1.SetViewColor(rgb);
  Box2.AddChild(Button1, nil);
  aRect2.Free;

  // Button 2
  aRect2 := BRect.Create(20, 60+30, 100, 70+30);
  mess := BMessage.Create(MSG_BUTTON_BASE+5);
  Button2 := BButton.Create(aRect2, 'Add Item', 'Dec', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button2.SetViewColor(rgb);
  Box2.AddChild(Button2, nil);
  aRect2.Free;
    
  // Show text Message
  aRect2:= BRect.Create(20, 120, 100, 130);
  Value := BStringView.Create(aRect2,'explain','Position : ',B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Box2.AddChild(Value, nil);
  aRect2.Free;

  // Box for Alert
  aRect2 := BRect.Create(220, 20, 350, 300);
  Box1 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box1.SetLabel('BAlert');
  Box1.SetBorder(B_FANCY_BORDER);
  AddChild(Box1, nil);
  aRect2.Free;

  // Button 3
  aRect2 := BRect.Create(20, 20, 100, 30);
  mess := BMessage.Create(MSG_BUTTON_BASE+6);
  Button3 := BButton.Create(aRect2, 'Add Item', 'Alert', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button3.SetViewColor(rgb);
  Box1.AddChild(Button3, nil);
  aRect2.Free;
end;

end.
