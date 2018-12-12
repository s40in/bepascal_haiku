program BitmapTest;

uses
  BeObj, Application, Bitmap, GraphicDefs, Rect,
  SysUtils;

const
  BitmapWith = 80;
  BitmapHeight = 40;

type
  TBitsData = array[0..9] of Byte;

var
  thisApp : BApplication;
  aBitmap : BBitmap;
  aRect : BRect;
  data : TBitsData;
  i : Byte;

begin
  try
    thisApp := BApplication.Create;
    aRect := BRect.Create(0, 0, BitmapWith - 1, BitmapHeight - 1);
    aBitmap := BBitmap.Create(aRect, B_CMAP8, false, false);
    WriteLn('BBitmap tester');
    WriteLn('==============');
    WriteLn('BBitmap Created');
    if aBitmap.IsValid then
       WriteLn('BBitmap is valid')
    else
       WriteLn('BBitmap is not valid');
    WriteLn('BBitmap.BitsLength: ' + IntToStr(aBitmap.BitsLength) +
            ' - should be: ' + IntToStr(BitmapWith * BitmapHeight));
    WriteLn('BBitmap.BytesPerRow: ' + IntToStr(aBitmap.BytesPerRow) +
            ' - should be: ' + IntToStr(BitmapWith));


    WriteLn('BBitmap.ColorSpace: ' + IntToStr(aBitmap.ColorSpace) +
            ' - should be: ' + IntToStr(B_CMAP8));

    if aBitmap.IsLocked then
       WriteLn('BBitmap locked')
    else
       WriteLn('BBitmap is not locked, or doesn''t accepts views');

    WriteLn('BBitmap Setting Bits...');
    for i := 0 to 9 do
      data[i] := i;
    aBitmap.SetBits(@data, High(data) + 1, 0, B_CMAP8);

//    WriteLn('BBitmap Reading Bits back...');
    WriteLn('... To be continued ;-P');
  finally
    aRect.Free;
    aBitmap.Free;
    WriteLn('Bitmap Destroyed');
    thisApp.Free;
  end;	
end.