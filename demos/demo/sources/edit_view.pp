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
unit Edit_View;

{$M+}
interface
uses
	classes,beobj, application, message, _beep, roster, SysUtils,interfacedefs,
	archivable, handler,  rect, window, view, graphicdefs, dataio,box, scrollview,
	invoker, messenger, Control,textview,font,textcontrol,radiobutton,common;

type 
	TEdit_View = class(BView)
 	public
   	constructor Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal); 

   	aTextView : BTextView;
 		Edit : BTextControl;
   	
   	afont : Bfont;
 		Box1 : BBox;
 		Box2 : BBox;
		Box3 : BBox;
 		Box4 : BBox;
		RadioButton1,
		RadioButton2 : BRadioButton;	
		RadioButton3,
		RadioButton4 : BRadioButton;	
		scroll_vert : BscrollView;
  end;

implementation

constructor TEdit_View.Create(aframe : BRect; name : PChar; aresizingMode, flags : Cardinal);
var
  aRect2,aRect3 : BRect;  
  mess : BMessage;
  rgb : RGB_color;
begin
  inherited;
  SetViewColor(ui_color(B_PANEL_BACKGROUND_COLOR));  

  // Box for textview
  aRect2 := BRect.Create(20, 20, 200, 300);
  Box2 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box2.SetLabel('BTextView ');
  Box2.SetBorder(B_FANCY_BORDER);
  AddChild(Box2, nil);
  aRect2.Free;

  // textView
  aRect2 := BRect.Create(10, 15, 160, 260);
  aRect3 := BRect.Create(0, 0, 140, 500-160);
  aTextView := BTextView.Create(aRect2, 'Test2',aRect3, B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);

  scroll_vert:=BscrollView.create('scroll1',aTextView,B_FOLLOW_ALL, B_WILL_DRAW or B_PULSE_NEEDED or  B_FRAME_EVENTS,true,true,B_PLAIN_BORDER);
  Box2.addchild(scroll_vert,nil);

  aTextView.setStylable(true);
  aRect2.Free;
  aRect3.Free;

  // Box for TextControl
  aRect2 := BRect.Create(220, 20, 400, 300);
  Box1 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box1.SetLabel('BTextControl ');
  Box1.SetBorder(B_FANCY_BORDER);
  AddChild(Box1, nil);
  aRect2.Free;

  mess := BMessage.Create(77780);
  aRect2 := BRect.Create(10, 15, 150, 20);
  Edit:=BTextControl.Create(aRect2,' Zone_calcul',' ','',mess,B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Edit.setdivider(0);
  Edit.setalignment(B_ALIGN_LEFT,B_ALIGN_LEFT);
  //Edit.SetEnabled(false);
  Box1.AddChild(Edit,nil);
  aRect2.Free;

  // Box for Textalignement
  aRect2 := BRect.Create(10, 40, 150, 100);
  Box3 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box3.SetLabel('setalignment ');
  Box3.SetBorder(B_FANCY_BORDER);
  Box1.AddChild(Box3, nil);
  aRect2.Free;

  // RadioButton1
  mess := BMessage.Create(MSG_RADIOBUTTON_BASE + 1);
  aRect2 := BRect.Create(10, 14, 120, 24);
  RadioButton1 := BRadioButton.Create(aRect2, 'RB1', 'B_ALIGN_LEFT', mess,
                   B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Box3.AddChild(RadioButton1, nil);
  RadioButton1.SetValue(1);
  aRect2.Free;

  // RadioButton2
  mess := BMessage.Create(MSG_RADIOBUTTON_BASE + 2);
  aRect2 := BRect.Create(10, 34, 120, 54);
  RadioButton2 := BRadioButton.Create(aRect2, 'RB2', 'B_ALIGN_RIGHT', mess,
                   B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Box3.AddChild(RadioButton2, nil);
  aRect2.Free;

  // Box for SetEnabled
  aRect2 := BRect.Create(10, 120, 150, 180);
  Box4 := BBox.Create(aRect2, 'Box1', B_FOLLOW_LEFT or B_FOLLOW_TOP,
                      B_WILL_DRAW or B_NAVIGABLE, B_PLAIN_BORDER);
  Box4.SetLabel('SetEnabled ');
  Box4.SetBorder(B_FANCY_BORDER);
  Box1.AddChild(Box4, nil);
  aRect2.Free;

  // RadioButton3
  mess := BMessage.Create(MSG_RADIOBUTTON_BASE + 3);
  aRect2 := BRect.Create(10, 14, 120, 24);
  RadioButton3 := BRadioButton.Create(aRect2, 'RB1', 'SetEnabled(true)', mess,
                   B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Box4.AddChild(RadioButton3, nil);
  RadioButton3.SetValue(1);
  aRect2.Free;

  // RadioButton4
  mess := BMessage.Create(MSG_RADIOBUTTON_BASE + 4);
  aRect2 := BRect.Create(10, 34, 120, 54);
  RadioButton4 := BRadioButton.Create(aRect2, 'RB2', 'SetEnabled(false)', mess,
                   B_FOLLOW_LEFT or B_FOLLOW_TOP, B_WILL_DRAW or B_NAVIGABLE);
  Box4.AddChild(RadioButton4, nil);
  aRect2.Free;
end;

end.
