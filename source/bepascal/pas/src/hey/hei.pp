unit hei;

interface

uses
  beobj, Messenger, Message, SupportDefs, Roster;
 
function Hey(atarget : TMessenger; aarg : string; areply : TMessage) : TStatus_t;

implementation

function Hey2(target : TCPlusObject; arg : PChar; reply : TCPlusObject) : TStatus_t; cdecl; external BePascalLibName name 'Hey__FP10BMessengerPCcP8BMessage';//'Hey__FP10BMessengerPPcPllP8BMessage';

function Hey(atarget : TMessenger; aarg : string; areply : TMessage) : TStatus_t;
var
  local : string;
begin
  local := aarg + #0;
  Result := Hey2(atarget.CPlusObject, @local[1], areply.CPlusObject);
end;

var
  List : TList;
begin
  List := TList.Create;
  try
    be_roster.GetAppList(List);		    
    SendText(IntToStr(List.CountItems));
    for i := 0 to List.CountItems - 1 do
    begin
      SendText('begin');
      Team_id := TTeam_id(List.ItemAt(i));
      SendText('  ' + IntToStr(Team_id));
      be_roster.GetRunningAppInfo(Team_id, AppInfo);
      SendText('  ' + PChar(AppInfo.Signature));
      SendText('  ' + IntToStr(AppInfo.team));
      SendText('  ' + AppInfo.ref.name);
      SendText('end');
    end;
  finally
    List.Free;
  end;
end;


end.  
