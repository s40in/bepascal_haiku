{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2003 Olivier Coursiere
                            Oscar Lesta

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
unit OS;

interface

uses
  SupportDefs, StorageDefs;

type
  uid_t = Cardinal;
  gid_t = Cardinal;

{$PACKRECORDS C}

const
  B_OS_NAME_LENGTH = 32;
  B_PAGE_SIZE = 4096;

{$ifndef VER1_0}
  B_INFINITE_TIMEOUT : Int64 = $7FFFFFFFFFFFFFFF;
{$else}
var
  B_INFINITE_TIMEOUT : Int64; // workaround - fpc 1.0.* doesn't support int64 const
{$endif}

type
  area_id   = Longint;
  port_id   = Longint;
  sem_id    = Longint;
  thread_id = Longint;
  team_id   = Longint;

const
  B_NO_LOCK       = 0;
  B_LAZY_LOCK     = 1;
  B_FULL_LOCK     = 2;
  B_CONTIGUOUS    = 3;
  B_LOMEM         = 4;

  B_ANY_ADDRESS        = 0;
  B_EXACT_ADDRESS      = 1;
  B_BASE_ADDRESS       = 2;
  B_CLONE_ADDRESS      = 3;
  B_ANY_KERNEL_ADDRESS = 4;

  B_READ_AREA  = 1;
  B_WRITE_AREA = 2;

// area
type
  area_info = record
    area        : area_id;
    name        : string[B_OS_NAME_LENGTH];
    size        : size_t;
    lock,
    protection  : Longword;
    team        : team_id;
    ram_size,
    copy_count,
    in_count,
    out_count   : Longword;
    address     : Pointer;
  end;
  Parea_info = ^area_info;
                                         // void **start_addr;
function create_area(const name : PChar; var start_addr : Pointer;
                     addr_spec : Longword; size : size_t; lock : Longword;
                     protection : Longword)
         : area_id; cdecl; external 'root' name 'create_area';

                                        // void **dest_addr;
function clone_area(const name : PChar; var dest_addr : Pointer;
                    addr_spec : Longword; protection : Longword;
                    source : area_id)
         : area_id; cdecl; external 'root' name 'clone_area';

function find_area(const name : PChar) : area_id;
            cdecl; external 'root' name 'find_area';
function area_for(addr : Pointer) : area_id;
            cdecl; external 'root' name 'area_for';
function delete_area(id : area_id): status_t;
            cdecl; external 'root' name 'delete_area';
function resize_area(id : area_id; new_size : size_t) : status_t;
            cdecl; external 'root' name 'resize_area';

function set_area_protection(id : area_id; new_protection : Longword)
         : status_t; cdecl; external 'root' name 'set_area_protection';

// These were macros.
function get_area_info(id : area_id; ainfo : Parea_info) : status_t;
function get_next_area_info(team : team_id; var cookie : Longint;
                            ainfo : Parea_info) : status_t;

//--------------------------------------------------------------------------

// Ports

type
  port_info = record
    port        : port_id;
    team        : team_id;
    name        : string[B_OS_NAME_LENGTH];
    capacity,              // queue depth
    queue_count,           // # msgs waiting to be read
    total_count : Longint; // total # msgs read so far
  end;
  Pport_info = ^port_info;

function create_port(capacity : Longint; const name : PChar) : port_id;
         cdecl; external 'root' name 'create_port';
function find_port(const name : PChar) : port_id;
         cdecl; external 'root' name 'find_port';

function write_port(port : port_id; code : Longint; const buf : Pointer;
                    buf_size : size_t)
         : status_t; cdecl; external 'root' name 'write_port';

function read_port(port : port_id; var code : Longint; buf : Pointer;
                   buf_size : size_t)
         : status_t; cdecl; external 'root' name 'read_port';

function write_port_etc(port : port_id; code : Longint; const buf : Pointer;
                        buf_size : size_t; flags : Longword;
                        timeout : bigtime_t)
         : status_t; cdecl; external 'root' name 'write_port_etc';

function read_port_etc(port : port_id; var code : Longint; var buf : Pointer;
                       buf_size : size_t; flags : Longword; timeout : bigtime_t)
         : status_t; cdecl; external 'root' name 'read_port_etc';

function port_buffer_size(port : port_id) : ssize_t;
         cdecl; external 'root' name 'port_buffer_size';

function port_buffer_size_etc(port : port_id; flags : Longword;
                              timeout : bigtime_t)
         : ssize_t; cdecl; external 'root' name 'port_buffer_size_etc';

function port_count(port : port_id) : ssize_t;
         cdecl; external 'root' name 'port_count';

function set_port_owner(port : port_id; team : team_id)
         : status_t; cdecl; external 'root' name 'set_port_owner';

function close_port(port : port_id) : status_t;
         cdecl; external 'root' name 'close_port';

function delete_port(port : port_id) : status_t;
         cdecl; external 'root' name 'delete_port';

// These were macros.
function get_port_info(port : port_id; info : Pport_info) : status_t;
function get_next_port_info(team : team_id; var cookie : Longword; info : Pport_info) : status_t;

//--------------------------------------------------------------------------

// Semaphores
type
  sem_info = record
    sem : sem_id;
    team : team_id;
    name : string[B_OS_NAME_LENGTH]; // array [0..B_OS_NAME_LENGTH-1] of Char
    count : Longint;
    latest_holder : thread_id;
  end;
  Psem_info = ^sem_info;

function create_sem(count : Longint; const name : PChar) : sem_id;
         cdecl; external 'root' name 'create_sem';
function delete_sem(sem : sem_id) : status_t;
         cdecl; external 'root' name 'delete_sem';
function acquire_sem(sem : sem_id) : status_t;
         cdecl; external 'root' name 'acquire_sem';
function acquire_sem_etc(sem : sem_id; count : Longint; flags : Longword;
                         microsecond_timeout : bigtime_t) : status_t;
         cdecl; external 'root' name 'acquire_sem_etc';
function release_sem(sem : sem_id) : status_t;
         cdecl; external 'root' name 'release_sem';
function release_sem_etc(sem : sem_id; count : Longint; flags : Longword) : status_t;
         cdecl; external 'root' name 'release_sem_etc';
function get_sem_count(sem : sem_id; var count : Longint) : status_t; // be careful!
         cdecl; external 'root' name 'get_sem_count';
function set_sem_owner(sem : sem_id; team : team_id)  : status_t;
         cdecl; external 'root' name 'set_sem_owner';

function get_sem_info(sem : sem_id; info : Psem_info) : status_t;
function get_next_sem_info(team : team_id; var cookie : Longword; info : Psem_info) : status_t;


// -----
//	flags for semaphore control
//-----
const
  B_CAN_INTERRUPT     =  1; // semaphore can be interrupted by a signal
  B_DO_NOT_RESCHEDULE =  2; // release() without rescheduling
  B_CHECK_PERMISSION  =  4; // disallow users changing kernel semaphores
  B_TIMEOUT           =  8; // honor the (relative) timeout parameter
  B_RELATIVE_TIMEOUT  =  8;
  B_ABSOLUTE_TIMEOUT  = 16; // honor the (absolute) timeout parameter

//--------------------------------------------------------------------------

// alarms
const
  B_ONE_SHOT_ABSOLUTE_ALARM = 1; // alarm is one-shot and time is specified absolutely
  B_ONE_SHOT_RELATIVE_ALARM = 2; // alarm is one-shot and time is specified relatively
  B_PERIODIC_ALARM          = 3; // alarm is periodic and time is the period

function set_alarm(when : bigtime_t; flags : Longword) : bigtime_t;
         cdecl; external 'root' name 'set_alarm';

//--------------------------------------------------------------------------

// Threads
type
  thread_state = (unused_filler,
    B_THREAD_RUNNING,    // = 1
    B_THREAD_READY,
    B_THREAD_RECEIVING,
    B_THREAD_ASLEEP,
    B_THREAD_SUSPENDED,
    B_THREAD_WAITING
  );

const
  B_LOW_LATENCY                =   5;
  B_LOW_PRIORITY               =   5;
  B_NORMAL_PRIORITY            =  10;
  B_DISPLAY_PRIORITY           =  15;
  B_URGENT_DISPLAY_PRIORITY    =  20;
  B_REAL_TIME_DISPLAY_PRIORITY = 100;
  B_URGENT_PRIORITY            = 110;
  B_REAL_TIME_PRIORITY         = 120;

type
  thread_info = record
    thread      : thread_id;
    team        : team_id;
    name        : string[B_OS_NAME_LENGTH];
    state       : thread_state;
    priority    : Longint;
    sem         : sem_id;
    user_time   : bigtime_t;
    kernel_time : bigtime_t;
    stack_base  : Pointer; // not sure, was "void *stack_base;"
    stack_end   : Pointer; // not sure, was "void *stack_end;"
  end;
  Pthread_info = ^thread_info;

  team_usage_info = record
    user_time,
    kernel_time : bigtime_t;
  end;
  Pteam_usage_info = ^team_usage_info;

//typedef int32 (* thread_func) (void * );
  thread_func = function(args : Pointer) : Longint;

// not sure about 'arg', it was: 'void *arg'
function spawn_thread(function_name : thread_func; const thread_name : PChar;
                      priority : Longint; var arg : Pointer) : thread_id;
         cdecl; external 'root' name 'spawn_thread';

function kill_thread(thread : thread_id) : status_t;
         cdecl; external 'root' name 'kill_thread';
function resume_thread(thread : thread_id) : status_t;
         cdecl; external 'root' name 'resume_thread';
function suspend_thread(thread : thread_id) : status_t;
         cdecl; external 'root' name 'suspend_thread';
function rename_thread(thread : thread_id; const new_name : PChar)
         : status_t; cdecl; external 'root' name 'rename_thread';
function set_thread_priority(thread : thread_id; new_priority : Longint)
         : status_t; cdecl; external 'root' name 'set_thread_priority';

procedure exit_thread(status : status_t); cdecl; external 'root' name 'exit_thread';

function wait_for_thread(thread : thread_id; var thread_return_value : status_t)
         : status_t; cdecl; external 'root' name 'wait_for_thread';

type
  callback_t = procedure(args : Pointer);

function on_exit_thread(callback : callback_t; data : Pointer)
         : status_t; cdecl; external 'root' name 'on_exit_thread';

function find_thread(const name : PChar) : thread_id;
{$ifndef CPUI386}
         cdecl; external 'root' name 'find_thread';
{$else}
  {$ifdef _KERNEL_MODE}
         cdecl; external 'root' name 'find_thread';
  {$endif _KERNEL_MODE}
{$endif CPUI386}

function get_thread_info(thread : thread_id; info : Pthread_info) : status_t;
function get_next_thread_info(tmid : team_id; var cookie : Longint; info : Pthread_info) : status_t;
function get_team_usage_info(tmid : team_id; who : Longint; ti : Pteam_usage_info) : status_t;

function send_data(thread : thread_id; code : Longint; const buf : Pointer;
                   buffer_size : size_t) : status_t; cdecl; external 'root' name 'send_data';
function receive_data(var sender : thread_id; var buf : Pointer; buffer_size : size_t)
         : status_t; cdecl; external 'root' name 'receive_data';
function has_data(thread : thread_id) : Boolean; cdecl; external 'root' name 'has_data';
function snooze(microseconds : bigtime_t) : status_t; cdecl; external 'root' name 'snooze';

(*
  Right now you can only snooze_until() on a single time base, the
  system time base given by system_time().  The "time" argument is
  the time (in the future) relative to the current system_time() that
  you want to snooze until.  Eventually there will be multiple time
  bases (and a way to find out which ones exist) but for now just pass
  the value B_SYSTEM_TIMEBASE.
*)
function snooze_until(time : bigtime_t; timebase : Integer) : status_t;
         cdecl; external 'root' name 'snooze_until';
const
  B_SYSTEM_TIMEBASE = 0;

//--------------------------------------------------------------------------

// Teams

const
   B_SYSTEM_TEAM = 2;

type
  team_info = record
    team                : team_id;
    image_count,
    thread_count,
    area_count          : Longint;
    debugger_nub_thread : thread_id;
    debugger_nub_port   : port_id;
    argc                : Longint;    // number of args on the command line
    args                : string[64]; // abbreviated command line args
    uid                 : uid_t;
    gid                 : gid_t;
  end;
  Pteam_info = ^team_info;

function kill_team(team : team_id) : status_t; // see also: send_signal()
         cdecl; external 'root' name 'kill_team';
function get_team_info(team : team_id; info : Pteam_info) : status_t;
function get_next_team_info(var cookie : Longint; info : Pteam_info) : status_t;

//--------------------------------------------------------------------------

// System information

{$ifdef CPUI386}
const
  B_MAX_CPU_COUNT = 8;
{$endif}

{$ifdef CPUPOWERPC}
const
  B_MAX_CPU_COUNT = 8;
{$endif}

const
 // typedef enum cpu_types
  B_CPU_PPC_601  =  1;
  B_CPU_PPC_603  =  2;
  B_CPU_PPC_603e =  3;
  B_CPU_PPC_604  =  4;
  B_CPU_PPC_604e =  5;
  B_CPU_PPC_750  =  6;
  B_CPU_PPC_686  = 13;
  B_CPU_AMD_29K  = 14;
  B_CPU_X86      = 15;
  B_CPU_MC6502   = 16;
  B_CPU_Z80      = 17;
  B_CPU_ALPHA    = 18;
  B_CPU_MIPS     = 19;
  B_CPU_HPPA     = 20;
  B_CPU_M68K     = 21;
  B_CPU_ARM      = 22;
  B_CPU_SH       = 23;
  B_CPU_SPARC    = 24;

  B_CPU_INTEL_X86                     = $1000;
  B_CPU_INTEL_PENTIUM                 = $1051;
  B_CPU_INTEL_PENTIUM75               = B_CPU_INTEL_PENTIUM + 1;
  B_CPU_INTEL_PENTIUM_486_OVERDRIVE   = B_CPU_INTEL_PENTIUM + 2;
  B_CPU_INTEL_PENTIUM_MMX             = B_CPU_INTEL_PENTIUM + 3;
  B_CPU_INTEL_PENTIUM_MMX_MODEL_4     = B_CPU_INTEL_PENTIUM_MMX;
  B_CPU_INTEL_PENTIUM_MMX_MODEL_8     = $1058;
  B_CPU_INTEL_PENTIUM75_486_OVERDRIVE = B_CPU_INTEL_PENTIUM_MMX_MODEL_8 + 1;
  B_CPU_INTEL_PENTIUM_PRO             = $1061;
  B_CPU_INTEL_PENTIUM_II              = $1063;
  B_CPU_INTEL_PENTIUM_II_MODEL_3      = $1063;
  B_CPU_INTEL_PENTIUM_II_MODEL_5      = $1065;
  B_CPU_INTEL_CELERON                 = $1066;
  B_CPU_INTEL_PENTIUM_III             = $1067;
  B_CPU_INTEL_PENTIUM_III_MODEL_8     = $1068;

  B_CPU_AMD_X86       = $1100;
  B_CPU_AMD_K5_MODEL0 = $1150;
  B_CPU_AMD_K5_MODEL1 = B_CPU_AMD_K5_MODEL0 + 1;
  B_CPU_AMD_K5_MODEL2 = B_CPU_AMD_K5_MODEL0 + 2;
  B_CPU_AMD_K5_MODEL3 = B_CPU_AMD_K5_MODEL0 + 3;

  B_CPU_AMD_K6_MODEL6 = $1156;
  B_CPU_AMD_K6_MODEL7 = $1157;

  B_CPU_AMD_K6_MODEL8 = $1158;
  B_CPU_AMD_K6_2      = $1158;

  B_CPU_AMD_K6_MODEL9 = $1159;
  B_CPU_AMD_K6_III    = $1159;

  B_CPU_AMD_ATHLON_MODEL1 = $1161;

  B_CPU_CYRIX_X86    = $1200;
  B_CPU_CYRIX_GXm    = $1254;
  B_CPU_CYRIX_6x86MX = $1260;

  B_CPU_IDT_X86        = $1300;
  B_CPU_IDT_WINCHIP_C6 = $1354;
  B_CPU_IDT_WINCHIP_2  = $1358;

  B_CPU_RISE_X86 = $1400;
  B_CPU_RISE_mP6 = $1450;


  B_CPU_X86_VENDOR_MASK = $1F00;

{$ifdef CPUI386}
type
  _eax_0 = record
    max_eax  : Longword;
    vendorid : string[12];
  end;

  _eax_1 = record
    stepping,              // : 4;
    model,                 // : 4;
    family,                // : 4;
    _type,                 // : 2;
    reserved_0,            // : 18;
    reserved_1,
    features,
    reserved_2 : Longword;
  end;

  _eax_2 = record
    call_num : Byte;
    cache_descriptors : array[0..14] of Byte;
  end;

  _eax_3 = record
    reserved            : array[0..1] of Longword;
	serial_number_high,
	serial_number_low   : Longword;
  end;

  _regs = record
    eax,
    ebx,
    edx,
    ecx : Longword;
  end;

  cpuid_info = record
    eax_0 : _eax_0;
    eax_1 : _eax_1;
    eax_2 : _eax_2;
    eax_3 : _eax_3;
    as_chars : string[16];
    regs : _regs;
  end;
  Pcpuid_info = ^cpuid_info;

function get_cpuid(info : Pcpuid_info; eax_register : Longword; cpu_num : Longword)
         : status_t; cdecl; external 'root' name 'get_cpuid';

{$endif CPUI386}

type
  platform_types = (
    B_BEBOX_PLATFORM,
    B_MAC_PLATFORM,
    B_AT_CLONE_PLATFORM,
    B_ENIAC_PLATFORM,
    B_APPLE_II_PLATFORM,
    B_CRAY_PLATFORM,
    B_LISA_PLATFORM,
    B_TI_994A_PLATFORM,
    B_TIMEX_SINCLAIR_PLATFORM,
    B_ORAC_1_PLATFORM,
    B_HAL_PLATFORM,
    B_BESM_6_PLATFORM,
    B_MK_61_PLATFORM,
    B_NINTENDO_64_PLATFORM
  );

  cpu_info = record
    active_time : bigtime_t; // # usec doing useful work since boot
  end;

  machine_id = array[1..2] of Longint; // unique machine ID

  system_info = record
    id           : machine_id; // unique machine ID
    boot_time    : bigtime_t;  // time of boot (# usec since 1/1/70)
    cpu_count    : Longint;    // # of cpus
    cpu_type     : Longword;   // enum cpu_types  // type of cpu
    cpu_revision : Longint;    // revision # of cpu
    cpu_infos : array[0..B_MAX_CPU_COUNT-1] of cpu_info; // info about individual cpus
    cpu_clock_speed : Int64; // processor clock speed (Hz)
    bus_clock_speed : Int64; // bus clock speed (Hz)
    platform_type   : platform_types; // type of machine we're on
    max_pages,              // total # physical pages
    used_pages,             // # physical pages in use
    page_faults,            // # of page faults
    max_sems,               // maximum # semaphores
    used_sems,              // # semaphores in use
    max_ports,              // maximum # ports
    used_ports,             // # ports in use
    max_threads,            // maximum # threads
    used_threads,           // # threads in use
    max_teams,              // maximum # teams
    used_teams   : Longint; // # teams in use
    kernel_name       : array[0..B_FILE_NAME_LENGTH - 1] of Char; // name of kernel
    kernel_build_date : string[B_OS_NAME_LENGTH]; // date kernel built
    kernel_build_time : string[B_OS_NAME_LENGTH]; // time kernel built
    kernel_version    : Int64;                    // version of this kernel
    _busy_wait_time   : bigtime_t;                // reserved for Be
    pad               : array[0..3]of Longint;    // just in case...
  end;
  Psystem_info = ^system_info;

function get_system_info(info : Psystem_info) : status_t;

function is_computer_on : Longint; cdecl; external 'root' name 'is_computer_on';
function is_computer_on_fire : Double; cdecl; external 'root' name 'is_computer_on_fire';

//--------------------------------------------------------------------------

{
  Time functions

  time is represented at the number of seconds since 00:00:00 Jan 1 1970
  Coordinated Universal Time (UTC).
  The time zone is kept as an offset in seconds from the system time.
  Library functions convert these to the local time.
}

function real_time_clock : Longword;
         cdecl; external 'root' name 'real_time_clock';
procedure set_real_time_clock(secs_since_jan1_1970 : Longword);
          cdecl; external 'root' name 'set_real_time_clock';
function real_time_clock_usecs : bigtime_t; cdecl;
         external 'root' name 'real_time_clock_usecs';
function set_timezone(tz_name : PChar) : status_t;
         cdecl; external 'root' name 'set_timezone';
// time since booting in microseconds
function system_time : bigtime_t; cdecl; external 'root' name 'system_time';


// debugging calls.

procedure debugger(const message : PChar); cdecl; external 'root' name 'debugger';

{
  calling this function with a non-zero value will cause your thread
  to receive signals for any exceptional conditions that occur (i.e.
  you'll get SIGSEGV for data access exceptions, SIGFPE for floating
  point errors, SIGILL for illegal instructions, etc).

  to re-enable the default debugger pass a zero.
}
function disable_debugger(state : Integer) : Integer;
         cdecl; external 'root' name 'disable_debugger';

//--------------------------------------------------------------------------

implementation

//--- These were macros ---

function _get_area_info(id : area_id; ainfo : Parea_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_area_info';

function _get_next_area_info(team : team_id; var cookie : Longint;
                             ainfo : Parea_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_next_area_info';

function get_area_info(id : area_id; ainfo : Parea_info) : status_t;
begin
  Result := _get_area_info(id, ainfo, SizeOf(ainfo^));
end;

function get_next_area_info(team : team_id; var cookie : Longint; ainfo : Parea_info) : status_t;
begin
  Result := _get_next_area_info(team, cookie, ainfo, SizeOf(ainfo^));
end;

//---

function _get_port_info(port : port_id; info : Pport_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_port_info';

function _get_next_port_info(team : team_id; var cookie : Longword;
                             info : Pport_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_next_port_info';

function get_port_info(port : port_id; info : Pport_info) : status_t;
begin
  Result := _get_port_info(port, info, SizeOf(info^));
end;

function get_next_port_info(team : team_id; var cookie : Longword;
                            info : Pport_info) : status_t;
begin
  Result := _get_next_port_info(team, cookie, info, SizeOf(info^));
end;

//---

function _get_sem_info(sem : sem_id; info : Psem_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_sem_info';

function _get_next_sem_info(team : team_id; var cookie : Longword; info : Psem_info;
                            size : size_t) : status_t;
                            cdecl; external 'root' name '_get_next_sem_info';

function get_sem_info(sem : sem_id; info : Psem_info) : status_t;
begin
  Result := _get_sem_info(sem, info, SizeOf(info^));
end;

function get_next_sem_info(team : team_id; var cookie : Longword; info : Psem_info) : status_t;
begin
  Result := _get_next_sem_info(team, cookie, info, SizeOf(info^));
end;

//---

function _get_thread_info(thread : thread_id; info : Pthread_info;
                          size : size_t) : status_t;
         cdecl; external 'root' name '_get_thread_info';
function _get_next_thread_info(tmid : team_id; var cookie : Longint;
                               info : Pthread_info; size : size_t) : status_t;
         cdecl; external 'root' name '_get_next_thread_info';
function _get_team_usage_info(tmid : team_id; who : Longint;
                              ti : Pteam_usage_info; size : size_t) : status_t;
         cdecl; external 'root' name '_get_team_usage_info';

function get_thread_info(thread : thread_id; info : Pthread_info) : status_t;
begin
  Result := _get_thread_info(thread, info, SizeOf(info^));
end;

function get_next_thread_info(tmid : team_id; var cookie : Longint; info : Pthread_info) : status_t;
begin
  Result := _get_next_thread_info(tmid, cookie, info, SizeOf(info^));
end;

function get_team_usage_info(tmid : team_id; who : Longint; ti : Pteam_usage_info) : status_t;
begin
  Result := _get_team_usage_info(tmid, who, ti, SizeOf(ti^));
end;

//---

function _get_team_info(team : team_id; info : Pteam_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_team_info';
function _get_next_team_info(var cookie : Longint; info : Pteam_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_next_team_info';

function get_team_info(team : team_id; info : Pteam_info) : status_t;
begin
  Result := _get_team_info(team, info, SizeOf(info^));
end;

function get_next_team_info(var cookie : Longint; info : Pteam_info) : status_t;
begin
  Result := _get_next_team_info(cookie, info, SizeOf(info^));
end;

//---

function _get_system_info(returned_info : Psystem_info; size : size_t)
         : status_t; cdecl; external 'root' name '_get_system_info';

function get_system_info(info : Psystem_info): status_t;
begin
  Result := _get_system_info(info, SizeOf(info^));
end;

//---

{$ifndef _KERNEL_MODE}
function _kfind_thread_(const name : PChar) : thread_id; cdecl; external 'root' name '_kfind_thread_';
{$inline ON} {$asmmode intel}
function find_thread(const name : PChar) : thread_id; // inline; // needs -Sd
begin
 Result := 0;
  if (name = nil) then
  asm
    mov  eax,fs:[4]
    mov  Result,eax
  end
  else Result := _kfind_thread_(name);
end;
{$endif _KERNEL_MODE}

//---

{$ifdef VER1_0}
initialization
// workaround because fpc 1.0.* don't support int64 const
//  B_INFINITE_TIMEOUT := 9223372036854775807;
  B_INFINITE_TIMEOUT := Int64($7FFFFFFF) shl 32 + Int64($FFFFFFFF);
{$endif VER1_0}

end.
