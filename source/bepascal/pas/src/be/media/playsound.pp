unit PlaySound;
// Description: Interface for a simple beep sound.

interface

uses
  Entry, OS, SupportDefs;

type
  sound_handle = sem_id;

function play_sound(const soundRef : Pentry_ref; mix : Boolean; queue : Boolean;
                    background : Boolean) : sound_handle;
         cdecl; external 'media' name 'play_sound';
function stop_sound(handle : sound_handle) : status_t;
         cdecl; external 'media' name 'stop_sound';
function wait_for_sound(handle : sound_handle) : status_t;
         cdecl; external 'media' name 'wait_for_sound';

implementation

end.