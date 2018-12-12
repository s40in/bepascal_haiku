{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2002-2004 Oscar Lesta
                            Olivier Coursiere                            

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
unit debugger;
// Description: kernel interface for a debugger.

interface

uses
{$ifdef CPUI386}
  signal,
{$endif CPUI386}
  {BeBuild,} OS, image, SupportDefs;

// kernel calls
function install_default_debugger(to_debugger_port : port_id) : status_t;
         cdecl; external 'root' name 'install_default_debugger';
function install_team_debugger(team : team_id; to_debugger_port : port_id) : port_id;
         cdecl; external 'root' name 'install_team_debugger';
function remove_team_debugger(team : team_id) : status_t;
         cdecl; external 'root' name 'remove_team_debugger';
function debug_thread(thread : thread_id) : status_t;
         cdecl; external 'root' name 'debug_thread';

// undocumented syscall to trace syscalls
// this function is used to configure the tracing level
// (see also DEBUG_* const at the end of this file)
function strace_init(thread : thread_id; flags : Cardinal) : status_t; 
         cdecl; external 'root' name '_kstrace_init_';
         
{ per-thread debugging flags (returned by the get_thread_debug_info request to
  the debugging nub) }
const
  B_STOP_CHILD_THREADS = $01;

// ids for why a thread is invoking the debugger

{$ifdef POWERPC}
type
  db_why_stopped = (
    B_THREAD_NOT_RUNNING,
    B_DEBUGGER_CALL,
    B_BREAKPOINT_HIT,
    B_NMI,
    B_MACHINE_CHECK_EXCEPTION,
    B_DATA_ACCESS_EXCEPTION,
    B_INSTRUCTION_ACCESS_EXCEPTION,
    B_ALIGNMENT_EXCEPTION,
    B_PROGRAM_EXCEPTION,
    B_GET_PROFILING_INFO,
    B_WATCHPOINT_HIT,
    B_SYSCALL_HIT
  );
{$endif POWERPC}

{$ifdef CPUI386}
type
  db_why_stopped = (
    B_THREAD_NOT_RUNNING,
    B_DEBUGGER_CALL,
    B_BREAKPOINT_HIT,
    B_SNGLSTP,
    B_NMI,
    B_MACHINE_CHECK_EXCEPTION,
    B_SEGMENT_VIOLATION,
    B_ALIGNMENT_EXCEPTION,
    B_DIVIDE_ERROR,
    B_OVERFLOW_EXCEPTION,
    B_BOUNDS_CHECK_EXCEPTION,
    B_INVALID_OPCODE_EXCEPTION,
    B_SEGMENT_NOT_PRESENT,
    B_STACK_FAULT,
    B_GENERAL_PROTECTION_FAULT,
    B_FLOATING_POINT_EXCEPTION,
    B_GET_PROFILING_INFO,
    B_WATCHPOINT_HIT,
    B_SYSCALL_HIT
  );
{$endif CPUI386}

{ cpu state.  It is arranged to be useable by the kernel, hence all the
  C volatile regs are grouped at the beginning.  The non-volatile ones
  are only saved when neccessary. }

{$ifdef POWERPC}
type
  cpu_state = packed record
    filler1,
    fpscr,
    pc,
    msr,
    lr,
    ctr,
    xer,
    cr,
    sprg0,
    filler2, // force alignment on quad-word
    filler3,
    filler4,
    r0,
    r1,     // stack ptr
    r2,
    r3,
    r4,
    r5,
    r6,
    r7,
    r8,
    r9,
    r10,
    r11,
    r12,
    r13,
    r14,
    r15,
    r16,
    r17,
    r18,
    r19,
    r20,
    r21,
    r22,
    r23,
    r24,
    r25,
    r26,
    r27,
    r28,
    r29,
    r30,
    r31 : Longint;
    f0,
    f1,
    f2,
    f3,
    f4,
    f5,
    f6,
    f7,
    f8,
    f9,
    f10,
    f11,
    f12,
    f13,	// C non-volatile regs start here
    f14,
    f15,
    f16,
    f17,
    f18,
    f19,
    f20,
    f21,
    f22,
    f23,
    f24,
    f25,
    f26,
    f27,
    f28,
    f29,
    f30,
    f31 : Double;
  end;
{$endif POWERPC}

{$ifdef CPUI386}

{ all the 486 registers including the segment registers and the
  general registers. }
type
  cpu_state = packed record
    xregs : extended_regs;  // fpu/mmx/xmm registers
    gs,
    reserved0,
    fs,
    reserved1,
    es,
    reserved2,
    ds,
    reserved3 : Word;
    edi,
    esi,
    ebp,
    esp_res,
    ebx,
    edx,
    ecx,
    eax,
    trap_no,                // trap or int number
    error_code,             // trap error code
    eip         : Cardinal; // user eip
    cs,                     // user cs
    reserved4 : Word;
    eflags,                 // user elfags
    uesp    : Cardinal;     // user esp
    ss,                     // user ss
    reserved5 : Word;
  end;
{$endif CPUI386}

{ messages from debug server to the nub running in a target
  thread's address space. }
type
  debug_nub_message = (
    B_READ_MEMORY,               // read some memory
    B_WRITE_MEMORY,              // write some memory
    B_RUN_THREAD,                // run thread full speed
    B_STEP_THREAD,               // step thread while pc in range
    B_STEP_OVER_THREAD,          // step thread while pc in range, skip calls
    B_STEP_OUT_THREAD,           // step thread till exit current proc
    B_SET_BREAKPOINT,            // set a breakpoint
    B_CLEAR_BREAKPOINT,          // set a breakpoint
    B_STOP_NEW_THREADS,          // en/disable stopping of child threads
    B_GET_THREAD_DEBUG_INFO,     // get debugging info
    B_ACKNOWLEGE_IMAGE_CREATED,  // acknowlege image created
    B_START_PROFILER,            // start profiler
    B_STOP_PROFILER,             // stop profiler
    B_SET_WATCHPOINT,            // set a watchpoint
    B_CLEAR_WATCHPOINT,          // clear a watchpoint
    B_STOP_ON_DEBUG,             // stop all threads in team when one enters db
    B_GET_THREAD_STACK_TOP,      // get top of ustack of a thread in the kernel
    B_HANDOFF_TO_OTHER_DEBUGGER, // prepare debug nub for handing off to another debugger
    B_GET_WHY_STOPPED            // ask why the thread is stopped
  );

// structures passed to the nub
  nub_read_memory_msg = packed record
    reply_port : port_id; // port for reply from kernel
    count : Longint;      // # bytes
    addr : PChar;         // address to read
  end;

  nub_write_memory_msg = packed record
    reply_port : port_id; // port for reply from kernel
    count : Longint;      // # bytes
    addr : PChar;         // address to write
  end;

  nub_run_thread_msg = packed record
    thread : thread_id;        // thread id
    align_to_double : Longint; // for alignment
    cpu : cpu_state;           // cpu state
  end;

  nub_step_thread_msg = packed record
    thread : thread_id;        // thread id
    align_to_double : Longint; // for alignment
    cpu : cpu_state;           // cpu state
    low_pc : PChar;            // low end of pc range
    high_pc : PChar;           // highend of pc range
  end;

  nub_step_over_thread_msg = packed record
    thread : thread_id;        // thread id
    align_to_double : Longint; // for alignment
    cpu : cpu_state;           // cpu state
    low_pc : PChar;            // low end of pc range
    high_pc : PChar;           // highend of pc range
  end;

  nub_step_out_thread_msg = packed record
    thread : thread_id;        // thread id
    align_to_double : Longint; // for alignment
    cpu : cpu_state;           // cpu state
  end;

  nub_set_breakpoint_msg = packed record
    reply_port : port_id;      // port for reply from kernel
    addr : PChar; {char *addr} // breakpoint address
  end;

  nub_clear_breakpoint_msg = packed record
    reply_port : port_id; // port for reply from kernel
    addr : PChar;         // breakpoint address
  end;

  nub_stop_new_threads_msg = packed record
    reply_port : port_id; // port for reply from kernel
    thread : thread_id;
    enabled : Boolean;    // en/disable stop of child threads
  end;

  nub_get_thread_debug_info_msg = packed record
    reply_port : port_id; // port for reply from kernel
    thread : thread_id;
  end;

  nub_get_thread_debug_info_reply = packed record
    debug_flags : Longint; // returned thread debugging flags
  end;

  nub_acknowlege_image_created_msg = packed record
    token : Longint;
  end;


  perfmon_privilege = (
    PERFMON_USER_MODE,
    PERFMON_KERNEL_MODE,
    PERFMON_KERNEL_AND_USER_MODE
  );

  perfmon_event_selector = packed record
    event,
    event_qualifier : Longword;
    privilege : perfmon_privilege;
    init_val : Longint; // usually should be 0; should be negative for interrupts
    flags : Longword;   // HW-specific bits, usually 0
  end;

  nub_start_profiler_msg = packed record
    reply_port : port_id; // port for reply from kernel
    thid : thread_id;
    perfmon_counter : Longint;
    perfmon_event : perfmon_event_selector;
    num : Longint;
    slots : array[0..1] of Longint;
  end;

  nub_stop_profiler_msg = packed record
    reply_port : port_id; // port for reply from kernel
    thid : thread_id;
    perfmon_counter : Longint;
  end;

  nub_stop_profiler_reply = packed record
    num : Longint;
    slots : array[0..1] of Longint;
  end;

  nub_set_watchpoint_msg = packed record
    reply_port : port_id; // port for reply from kernel
    addr : PChar;         // watchpoint address
    _type : Integer;       // watchpoint type
  end;

  nub_clear_watchpoint_msg = packed record
    reply_port : port_id; // port for reply from kernel
    addr : PChar;         // watchpoint address
  end;

  nub_stop_on_debug_msg = packed record
    reply_port : port_id; // port for reply from kernel
    thread : thread_id;   // thid of thread to set this for
    enabled : Boolean;
  end;

  nub_get_thread_stack_top_msg = packed record
    reply_port : port_id;
    thread : thread_id;
  end;

  nub_get_thread_stack_top_reply = packed record
    stack_top : Pointer; // stack ptr at entry to the kernel
    pc        : Pointer; // program ctr at entry to the kernel
  end;

  nub_handoff_msg = packed record
    reply_port,
    new_db_port : port_id;
  end;

  nub_get_why_stopped_msg = packed record
    thread : thread_id;
  end;

// union of all stuctures passed to the nub
  to_nub_msg = packed record
    case Integer of
      0: (  
        nub_read_memory              : nub_read_memory_msg;
        );    
      1: (          
        nub_write_memory             : nub_write_memory_msg;
        );
      2: (            
        nub_run_thread               : nub_run_thread_msg;
        );    
      3: (        
        nub_step_thread              : nub_step_thread_msg;
        );    
      4: (        
        nub_step_over_thread         : nub_step_over_thread_msg;
        );    
      5: (        
        nub_step_out_thread          : nub_step_out_thread_msg;
        );    
      6: (        
        nub_set_breakpoint           : nub_set_breakpoint_msg;
        );
      7: (            
        nub_clear_breakpoint         : nub_clear_breakpoint_msg;
        );
      8: (            
        nub_stop_new_threads         : nub_stop_new_threads_msg;
        );    
      9: (        
        nub_get_thread_debug_info    : nub_get_thread_debug_info_msg;
        );    
      10: (        
        nub_acknowlege_image_created : nub_acknowlege_image_created_msg;
        );    
      11: (
        nub_start_profiler           : nub_start_profiler_msg;
        );
      12: (            
        nub_stop_profiler            : nub_stop_profiler_msg;
        );
      13: (            
        nub_set_watchpoint           : nub_set_watchpoint_msg;
        );
      14: (            
        nub_clear_watchpoint         : nub_clear_watchpoint_msg;
        );
      15: (            
        nub_stop_on_debug            : nub_stop_on_debug_msg;
        );
      16: (            
        nub_get_thread_stack_top     : nub_get_thread_stack_top_msg;
        );
      17: (            
        nub_handoff                  : nub_handoff_msg;
        );
      18: (            
        nub_get_why_stopped          : nub_get_why_stopped_msg;
        );    
  end;

{ messages passed to the external debugger

  *** DANGER WILL ROBINSON!! *** Don't change the ordering/numbering
  of these messages. Doing so will break 3rd party debuggers (i.e.,
  MWDebug) between releases. }

  debugger_message = (
    B_THREAD_STOPPED,    // thread stopped, here is its state
    B_TEAM_CREATED,      // team was created
    B_TEAM_DELETED,      // team was deleted
{$ifdef POWERPC}
    B_PEF_IMAGE_CREATED, // pef image was created
    B_PEF_IMAGE_DELETED, // pef image was deleted
{$endif}
{$ifdef CPUI386}
    B_ELF_IMAGE_CREATED, // pe image was created
    B_ELF_IMAGE_DELETED, // pe image was deleted
{$endif}
    B_THREAD_CREATED,    // thread was created
    B_THREAD_DELETED,    // thread was deleted
    B_SYSCALL_POST       // end of syscall
  );

// structures passed to the external debugger
type

  db_thread_stopped_msg = packed record
    thread   : thread_id;      // thread id
    team     : team_id;        // team id
    why      : db_why_stopped; // reason for contacting debugger
    nub_port : port_id;        // port to nub for this team
    cpu      : cpu_state;      // cpu state
    data     : Pointer;        // additional data
  end;

  db_team_created_msg = packed record
    team : team_id; // id of new team
  end;

  db_team_deleted_msg = packed record
    team : team_id; // id of deleted team
  end;

  db_pef_image_created_msg = packed record
    reply_token : Longint; // token to acknowledge receipt (REQUIRED!)
    team : team_id;        // team id
    thread : thread_id;    // id of thread that is loading the image
    info : image_info;     // info for the image
    nub_port : port_id;    // port to nub for this team
  end;

  db_pef_image_deleted_msg = packed record
    team : team_id;
    info : image_info; // info for the image
  end;

  db_thread_created_msg = packed record
    thread : thread_id; // thread id
    team : team_id;     // team id
  end;

  db_thread_deleted_msg = packed record
    thread : thread_id; // thread id
    team : team_id;     // team id
  end;

  db_get_profile_info_msg = packed record
    thread : thread_id;
  end;

  db_syscall_post_msg = packed record
    thread : thread_id;     // thread id
    team : team_id;         // team id
    start_time : bigtime_t; // time of syscall start
    end_time : bigtime_t;   // time of syscall completion
    rethi,                  // upper word of return value
    retlo,                  // lower word of return value
    syscall : Longword;     // the syscall number
    args : array[0..7] of Longword; // syscall args
  end;

// union of all structures passed to external debugger

  to_debugger_msg = packed record
    case Integer of
      0: (
        thread_stopped    : db_thread_stopped_msg;
        );
      1: (                
        team_created      : db_team_created_msg;
        );
      2: (                
        team_deleted      : db_team_deleted_msg;
        );
      3: (                
        pef_image_created : db_pef_image_created_msg;
        );
      4: (                
        pef_image_deleted : db_pef_image_deleted_msg;
        );
      5: (                
        thread_created    : db_thread_created_msg;
        );
      6: (                
        thread_deleted    : db_thread_deleted_msg;
        );
      7: (                
        get_profile_info  : db_get_profile_info_msg;
        );
      8: (                
        syscall_post      : db_syscall_post_msg;
        );
  end;

{
  debugger flags, state constants.
  Bottom sixteen bits of a word are reserved for Kernel use.
  Rest are used for user-level control by debuggers
  using the debugging API. See nukernel/inc/thread.h.
}
const
  DEBUG_USER_FLAGS_MASK = $ffff0000;

  DEBUG_syscall_tracing_only         = $00010000; // used by _kstrace_init_
  DEBUG_syscall_fast_trace           = $00020000;
  DEBUG_syscall_trace_through_spawns = $00040000;
  DEBUG_syscall_trace_whole_team     = $00080000;

implementation

end.
