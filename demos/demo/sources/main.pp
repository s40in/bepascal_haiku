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
program Main;

{$M+}
uses
  Application, Message, Roster, Rect, Window,
  Main_Window, SysUtils;
	
type

  TMonApplication = class(BApplication)
  public
  	function QuitRequested : Boolean; override;
    procedure RefsReceived(amessage : BMessage); override;
    procedure ArgvReceived(argc : integer; argv : PPChar); override;
    procedure AboutRequested; override;
    procedure Pulse; override;
  	procedure ReadyToRun; override;
  end;

procedure TMonApplication.RefsReceived(amessage : BMessage);
begin
  WriteLn('RefsReceived');
  WriteLn('message.what : ' + IntToStr(amessage.what));
  amessage.PrintToStream;
end;

procedure TMonApplication.ArgvReceived(argc : integer; argv : PPChar);
var
  i : integer;
begin
  WriteLn('Nb argument : ' + IntToStr(argc));
  for i := 0 to argc - 1 do
    WriteLn(argv[i]);
end;

procedure TMonApplication.AboutRequested;
begin
  WriteLn('AboutRequested');
end;

procedure TMonApplication.Pulse;
begin
  WriteLn('Pulse');
end;


function TMonApplication.QuitRequested : Boolean;
begin
  Result := inherited;
  be_app.Free;
end;

procedure TMonApplication.ReadyToRun;
var
  Mess : BMessage;
begin
  inherited;
  Mess := BMessage.Create;
  try
    Mess.What := 7777;
    be_roster.Broadcast(Mess);
  finally
    Mess.Free;
  end;
end;


var
  aRect : BRect;
  win : TMyWindow;
begin
  TMonApplication.Create;
  try
    aRect := BRect.Create(20, 20, 740, 500);
    win := TMyWindow.Create(aRect, 'BP Demo', B_TITLED_WINDOW, B_NOT_RESIZABLE or B_NOT_ZOOMABLE or B_QUIT_ON_WINDOW_CLOSE, B_CURRENT_WORKSPACE);
    win.Show;
    be_app.Run;
    be_app.HideCursor;  	  
    be_app.ShowCursor;
  finally
    aRect.Free;
    win.Free;
  end;	
end.
