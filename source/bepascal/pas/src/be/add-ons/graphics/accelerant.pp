unit accelerant;

interface

uses
  GraphicDefs, OS, SupportDefs;

{$PACKRECORDS C}

const
  B_ACCELERANT_ENTRY_POINT = 'get_accelerant_hook';
  B_ACCELERANT_VERSION = 1;

type
  GetAccelerantHook = function(feature : Longword; var data : Pointer) : Pointer;

//_EXPORT void * get_accelerant_hook(uint32 feature, void *data);
var
  get_accelerant_hook : GetAccelerantHook;

const
  // initialization
  B_INIT_ACCELERANT               = 0;                     // required
  B_ACCELERANT_CLONE_INFO_SIZE    = B_INIT_ACCELERANT + 1; // required
  B_GET_ACCELERANT_CLONE_INFO     = B_INIT_ACCELERANT + 2; // required
  B_CLONE_ACCELERANT              = B_INIT_ACCELERANT + 3; // required
  B_UNINIT_ACCELERANT             = B_INIT_ACCELERANT + 4; // required
  B_GET_ACCELERANT_DEVICE_INFO    = B_INIT_ACCELERANT + 5; // required
  B_ACCELERANT_RETRACE_SEMAPHORE  = B_INIT_ACCELERANT + 6; // optional

  // mode configuration
  B_ACCELERANT_MODE_COUNT   = $100; // required
  B_GET_MODE_LIST           = B_ACCELERANT_MODE_COUNT +  1; // required
  B_PROPOSE_DISPLAY_MODE    = B_ACCELERANT_MODE_COUNT +  2; // optional
  B_SET_DISPLAY_MODE        = B_ACCELERANT_MODE_COUNT +  3; // required
  B_GET_DISPLAY_MODE        = B_ACCELERANT_MODE_COUNT +  4; // required
  B_GET_FRAME_BUFFER_CONFIG = B_ACCELERANT_MODE_COUNT +  5; // required
  B_GET_PIXEL_CLOCK_LIMITS  = B_ACCELERANT_MODE_COUNT +  6; // required
  B_GET_TIMING_CONSTRAINTS  = B_ACCELERANT_MODE_COUNT +  7; // optional
  B_MOVE_DISPLAY            = B_ACCELERANT_MODE_COUNT +  8; // optional
  B_SET_INDEXED_COLORS      = B_ACCELERANT_MODE_COUNT +  9; // required if driver supports 8bit indexed modes
  B_DPMS_CAPABILITIES       = B_ACCELERANT_MODE_COUNT + 10; // required if driver supports DPMS
  B_DPMS_MODE               = B_ACCELERANT_MODE_COUNT + 11; // required if driver supports DPMS
  B_SET_DPMS_MODE           = B_ACCELERANT_MODE_COUNT + 12; // required if driver supports DPMS

  // cursor managment
  B_MOVE_CURSOR       = $200;              // optional
  B_SET_CURSOR_SHAPE  = B_MOVE_CURSOR + 1; // optional
  B_SHOW_CURSOR       = B_MOVE_CURSOR + 2; // optional

  // synchronization
  B_ACCELERANT_ENGINE_COUNT = $300;                          // required
  B_ACQUIRE_ENGINE          = B_ACCELERANT_ENGINE_COUNT + 1; // required
  B_RELEASE_ENGINE          = B_ACCELERANT_ENGINE_COUNT + 2; // required
  B_WAIT_ENGINE_IDLE        = B_ACCELERANT_ENGINE_COUNT + 3; // required
  B_GET_SYNC_TOKEN          = B_ACCELERANT_ENGINE_COUNT + 4; // required
  B_SYNC_TO_TOKEN           = B_ACCELERANT_ENGINE_COUNT + 5; // required

  // 2D acceleration
  B_SCREEN_TO_SCREEN_BLIT                 = $400; // optional
  B_FILL_RECTANGLE                        = B_SCREEN_TO_SCREEN_BLIT + 1; // optional
  B_INVERT_RECTANGLE                      = B_SCREEN_TO_SCREEN_BLIT + 2; // optional
  B_FILL_SPAN                             = B_SCREEN_TO_SCREEN_BLIT + 3; // optional
  B_SCREEN_TO_SCREEN_TRANSPARENT_BLIT     = B_SCREEN_TO_SCREEN_BLIT + 4; // optional
  B_SCREEN_TO_SCREEN_SCALED_FILTERED_BLIT = B_SCREEN_TO_SCREEN_BLIT + 5; // optional. NOTE: source and dest may NOT overlap

  // 3D acceleration
  B_ACCELERANT_PRIVATE_START : Longint = $80000000;

type
  accelerant_device_info = record
    version   : Longword;
    name,
    chipset,
    serial_no : string[32];
    memory,
    dac_speed : Longword;
  end;
  Paccelerant_device_info = ^accelerant_device_info;

  display_timing = record
    pixel_clock   : Longword;
    h_display,
    h_sync_start,
    h_sync_end,
    h_total,
    v_display,
    v_sync_start,
    v_sync_end,
    v_total       : Word;
    flags         : Longword;
  end;
  Pdisplay_timing = ^display_timing;

  display_mode = record
    timing           : display_timing;
    space            : Longword;
    virtual_width,
    virtual_height,
    h_display_start,
    v_display_start  : Word;
    flags            : Longword;	
  end;
  Pdisplay_mode = ^display_mode;

  frame_buffer_config = record
    frame_buffer,                // pointer to first byte of frame buffer in virtual memory
    frame_buffer_dma : Pointer;  // pointer to first byte of frame buffer in physical memory for DMA
    bytes_per_row    : Longword; // number of bytes in one virtual_width line
  end;                           // not neccesarily the same as virtual_width * byte_per_pixel
  Pframe_buffer_config = ^frame_buffer_config;

  display_timing_constraints = record
    h_res,
    h_sync_min,
    h_sync_max,
    h_blank_min,
    h_blank_max,
    v_res,
    v_sync_min,
    v_sync_max,
    v_blank_min,
    v_blank_max  : Word;
  end;
  Pdisplay_timing_constraints = ^display_timing_constraints;

const
  // mode flags
  B_SCROLL          = 1 shl 0;
  B_8_BIT_DAC       = 1 shl 1;
  B_HARDWARE_CURSOR = 1 shl 2;
  B_PARALLEL_ACCESS = 1 shl 3;
  B_DPMS            = 1 shl 4;
  B_IO_FB_NA        = 1 shl 5;

  // power saver flags
  B_DPMS_ON       = 1 shl 0;
  B_DPMS_STAND_BY = 1 shl 1;
  B_DPMS_SUSPEND  = 1 shl 2;
  B_DPMS_OFF      = 1 shl 3;

  // timing flags
  B_BLANK_PEDESTAL    = 1 shl 27;
  B_TIMING_INTERLACED = 1 shl 28;
  B_POSITIVE_HSYNC    = 1 shl 29;
  B_POSITIVE_VSYNC    = 1 shl 30;
  B_SYNC_ON_GREEN     = 1 shl 31;

type

  blit_params = record
    src_left,          // guaranteed constrained to virtual width and height
    src_top,
    dest_left,
    dest_top,
    width,             // 0 to N, where zero means one pixel, one means two pixels, etc.
    height : Smallint; // 0 to M, where zero means one line, one means two lines, etc.
  end;
  Pblit_params = ^blit_params;

  scaled_blit_params = record
    src_left,               // guaranteed constrained to virtual width and height
    src_top,
    src_width,              // 0 to N, where zero means one pixel, one means two pixels, etc.
    src_height,             // 0 to M, where zero means one line, one means two lines, etc.
    dest_left,
    dest_top,
    dest_width,             // 0 to N, where zero means one pixel, one means two pixels, etc.
    dest_height : Smallint; // 0 to M, where zero means one line, one means two lines, etc.
  end;
  Pscaled_blit_params = ^scaled_blit_params;

  fill_rect_params = record
    left,              // guaranteed constrained to virtual width and height
    top,
    right,
    bottom : Smallint;
  end;
  Pfill_rect_params = ^fill_rect_params;

  engine_token = record
    engine_id,                  // 0 == no engine, 1,2,3 etc individual engines
    capability_mask : Longword; // features this engine supports
    opaque          : Pointer;  // optional pointer to engine private storage
  end;
  Pengine_token = ^engine_token;

const
// engine capabilities
  B_2D_ACCELERATION = 1 shl 0;
  B_3D_ACCELERATION = 1 shl 1;

type
  sync_token = record
    counter   : QWord;                // counts issued primatives
    engine_id : Longword;             // what engine the counter is for
    opaque    : array[0..11] of Byte; // 12 bytes of private storage
  end;
  Psync_token = ^sync_token;

// Masks for color info
// B_CMAP8    - $000000ff
// B_RGB15/16 - $0000ffff
// B_RGB24    - $00ffffff
// B_RGB32    - $ffffffff

  init_accelerant = function(fd : Integer) : status_t;
  accelerant_clone_info_size = function : ssize_t;
  get_accelerant_clone_info = procedure(var data : Pointer);
  clone_accelerant = function(var data : Pointer) : status_t;
  uninit_accelerant = procedure;
  get_accelerant_device_info = function(adi : Paccelerant_device_info) : status_t;
  accelerant_mode_count = function : Longword;
  get_mode_list = function(modes : Pdisplay_mode) : status_t;
  propose_display_mode = function(target, low, high : Pdisplay_mode) : status_t;
  set_display_mode = function(mode_to_set : Pdisplay_mode) : status_t;
  get_display_mode = function(current_mode : Pdisplay_mode) : status_t;
  get_frame_buffer_config = function(a_frame_buffer : Pframe_buffer_config) : status_t;
  get_pixel_clock_limits = function(dm : Pdisplay_mode; low, high : PLongword) : status_t;
  move_display_area = function(h_display_start, v_display_start : Word) : status_t;
  get_timing_constraints = function(dtc : Pdisplay_timing_constraints) : status_t;
  set_indexed_colors = procedure(count : Longword; first : Byte; color_data : PByte; flags : Longword);
  dpms_capabilities = function : Longword;
  dpms_mode = function : Longword;
  set_dpms_mode = function(dpms_flags : Longword) : status_t;
  accelerant_retrace_semaphore = function : sem_id;
                                                             // was uint8 * . maybe use array of byte?
  set_cursor_shape = function(width,  height, hot_x, hot_y : Word; andMask, xorMask : PByte) : status_t;
  move_cursor = procedure(x, y : Word);
  show_cursor = procedure(is_visible : Boolean);

  accelerant_engine_count = function : Longword;
  acquire_engine = function(capabilities : Longword; max_wait : Longword; st : Psync_token; et : Pengine_token) : status_t;
  release_engine = function(et : Pengine_token; st : Psync_token) : status_t;
  wait_engine_idle = procedure;
  get_sync_token = function(et : Pengine_token; st : Psync_token) : status_t;
  sync_to_token = function(st : Psync_token) : status_t;

  screen_to_screen_blit = procedure(et : Pengine_token; list : Pblit_params; count : Longword);
  fill_rectangle = procedure(et : Pengine_token; color : Longword; list : Pfill_rect_params; count : Longword);
  invert_rectangle = procedure(et : Pengine_token; list : Pfill_rect_params; count : Longword);
  screen_to_screen_transparent_blit = procedure(et : Pengine_token; transparent_color : Longword; list : Pblit_params; count : Longword);
  screen_to_screen_scaled_filtered_blit = procedure(et : Pengine_token; list : Pscaled_blit_params; count : Longword);
  fill_span = procedure(et : Pengine_token; color : Longword; list : PSmallint; count : Longword);

{
  The uint16 *list points to a list of tripples:
    list[N+0]  Y co-ordinate of span
    list[N+1]  Left x co-ordinate of span
    list[N+2]  Right x co-ordinate of span
  where N is in the range 0 to count-1.
}

implementation

end.