unit scheduler;

// Description: Scheduling inquiry functions

interface

uses
  OS, SupportDefs;
{
  To get a good thread priority, call suggest_thread_priority() with the
  following information:
  'what' is a bit mask describing what you're doing in the thread.
  'period' is how many times a second your thread needs to run (-1 if you're
           running continuously.)
  'jitter' is an estimate (in us) of how much that period can vary, as long as
           it stays centered on the average.
  'length' is how long (in us) you expect to run for each invocation.
  "invocation" means, typically, receiving a message, dispatching it, and then
               returning to reading a message.

  MANIPULATION means both filtering and compression/decompression.
  PLAYBACK and RECORDING means threads feeding/reading ACTUAL HARDWARE ONLY.
  0 means don't care
}

// enum be_task_flags {};
const
  // bitmasks for "what"
  B_DEFAULT_MEDIA_PRIORITY  =   $0;
  B_OFFLINE_PROCESSING      =   $1;
  B_STATUS_RENDERING        =   $2; // can also use this for "preview" type things
  B_USER_INPUT_HANDLING     =   $4;
  B_LIVE_VIDEO_MANIPULATION =   $8; // non-live processing is OFFLINE_PROCESSING
  B_VIDEO_PLAYBACK          =  $10; // feeding hardware
  B_VIDEO_RECORDING         =  $20; // grabbing from hardware
  B_LIVE_AUDIO_MANIPULATION =  $40; // non-live processing is OFFLINE_PROCESSING
  B_AUDIO_PLAYBACK          =  $80; // feeding hardware
  B_AUDIO_RECORDING         = $100; // grabbing from hardware
  B_LIVE_3D_RENDERING       = $200; // non-live rendering is OFFLINE_PROCESSING
  B_NUMBER_CRUNCHING        = $400;
  B_MIDI_PROCESSING         = $800;


function suggest_thread_priority(
            task_flags : Longword{$ifndef VER1_0} = B_DEFAULT_MEDIA_PRIORITY{$endif};
            period     : Longint{$ifndef VER1_0} = 0{$endif};
            jitter     : bigtime_t{$ifndef VER1_0} = 0{$endif};
            length     : bigtime_t{$ifndef VER1_0} = 0{$endif})
         : Longint; cdecl; external 'root' name 'suggest_thread_priority';

// default is current thread
function estimate_max_scheduling_latency(th : thread_id{$ifndef VER1_0} = -1{$endif})
         : bigtime_t; cdecl; external 'root' name 'estimate_max_scheduling_latency';

implementation

end.