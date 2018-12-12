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
unit Button_View;

{$M+}
interface

uses
  Box, Button, GraphicDefs, InterfaceDefs, ListView, ListItem, Message,
  OutlineListView, Rect, View,
  Common;

type 
	TButton_View = class(BView)
	public
   	constructor Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal); 
   	Button1: BButton;    
   	Button2: BButton;    
   	Button3: BButton;    
   		
  	ListView1 : BListView;
 		ItemString : BStringItem;
 		outlineListView : BOutlineListView;
 		Box1 : BBox;
 		Box2 : BBox;

  end;

implementation

constructor TButton_View.Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal);
Var
  aRect2 : BRect;  
  mess : BMessage;
  rgb : RGB_color;
begin
  inherited;
  SetViewColor(ui_color(B_PANEL_BACKGROUND_COLOR));
  // Button 1
  aRect2 := BRect.Create(20, 20, 100, 30);
  mess := BMessage.Create(MSG_BUTTON_BASE+1);
  Button1 := BButton.Create(aRect2, 'Button 1', 'Button 1', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button1.SetViewColor(rgb);
  AddChild(Button1, nil);
  aRect2.Free;

  // Button 2
  aRect2 := BRect.Create(20, 20+30, 100, 30+30);
  mess := BMessage.Create(MSG_BUTTON_BASE+2);
  Button2 := BButton.Create(aRect2, 'Add Item', 'Add Item', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button2.SetViewColor(rgb);
  AddChild(Button2, nil);
  aRect2.Free;

  // Button 3
  aRect2 := BRect.Create(20, 20+60, 100, 30+60);
  mess := BMessage.Create(MSG_BUTTON_BASE+3);
  Button3 := BButton.Create(aRect2, 'Add Outline', 'Add Outline', mess, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Button3.SetViewColor(rgb);
  AddChild(Button3, nil);
  aRect2.Free;

  // Box for ListView
  aRect2 := BRect.Create(120, 30, 250, 300);
  Box1 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box1.SetLabel('BListView');
  Box1.SetBorder(B_FANCY_BORDER);
  AddChild(Box1, nil);
  aRect2.Free;

  // ListView1
  aRect2 := BRect.Create(10, 15, 120, 250);
  ListView1 := BListView.create(aRect2,'toto', B_SINGLE_SELECTION_LIST,
                                B_FOLLOW_LEFT or B_FOLLOW_TOP,
                                B_WILL_DRAW or B_NAVIGABLE or B_FRAME_EVENTS);
  Box1.AddChild(ListView1, nil);
  aRect2.Free;

{
  ItemString := BStringItem.create('test 1',0,true);
  ListView1.AddItem(ItemString);
  ItemString := BStringItem.create('test 2',1,true);
  ListView1.AddItem(ItemString);
}  

  // Box for OutLineListItem
  aRect2 := BRect.Create(260, 30, 400, 300);
  Box2 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box2.SetLabel('BOutlineListView ');
  Box2.SetBorder(B_FANCY_BORDER);
  AddChild(Box2, nil);
  aRect2.Free;

  // Outlinelistitem
  aRect2 := BRect.Create(10, 15, 120, 250);
  outlineListView := BOutlineListView.create(aRect2,'toto',
                        B_SINGLE_SELECTION_LIST,
                        B_FOLLOW_LEFT or B_FOLLOW_TOP,
                        B_WILL_DRAW or B_NAVIGABLE or B_FRAME_EVENTS);
  Box2.AddChild(outlineListView, nil);
  aRect2.Free;

  ItemString := BStringItem.create('test 1',0,true);
  outlineListView.AddItem(ItemString);
  ItemString := BStringItem.create('test 1.1',1,true);
  outlineListView.AddItem(ItemString);
  ItemString := BStringItem.create('test 1.2',1,true);
  outlineListView.AddItem(ItemString);
  ItemString := BStringItem.create('test 2',0,true);
  outlineListView.AddItem(ItemString);
  ItemString := BStringItem.create('test 2.1',1,true);
  outlineListView.AddItem(ItemString);
  ItemString := BStringItem.create('test 3',0,true);
  outlineListView.AddItem(ItemString);
end;

end.
