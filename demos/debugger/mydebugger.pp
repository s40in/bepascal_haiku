program mydebugger;

uses
  debugger, OS, image, SysUtils, SupportDefs, signal;

{$ifdef POWERPC}
function db_why_stoppedToStr(why_stopped : db_why_stopped) : string;
begin
  case why_stopped of
    B_THREAD_NOT_RUNNING : Result := 'B_THREAD_NOT_RUNNING';
    B_DEBUGGER_CALL : Result := 'B_DEBUGGER_CALL';
    B_BREAKPOINT_HIT : Result := 'B_BREAKPOINT_HIT';
    B_NMI : Result := 'B_NMI';
    B_MACHINE_CHECK_EXCEPTION : Result := 'B_MACHINE_CHECK_EXCEPTION';
    B_DATA_ACCESS_EXCEPTION : Result := 'B_DATA_ACCESS_EXCEPTION';
    B_INSTRUCTION_ACCESS_EXCEPTION : Result := 'B_INSTRUCTION_ACCESS_EXCEPTION';
    B_ALIGNMENT_EXCEPTION : Result := 'B_ALIGNMENT_EXCEPTION';
    B_PROGRAM_EXCEPTION : Result : 'B_PROGRAM_EXCEPTION';
    B_GET_PROFILING_INFO : Result := 'B_GET_PROFILING_INFO';
    B_WATCHPOINT_HIT : Result := 'B_WATCHPOINT_HIT';
    B_SYSCALL_HIT : Result := 'B_SYSCALL_HIT';
  end;
end;
{$endif POWERPC}

{$ifdef CPUI386}
function db_why_stoppedToStr(why_stopped : db_why_stopped) : string;
begin
  case why_stopped of
    B_THREAD_NOT_RUNNING : Result := 'B_THREAD_NOT_RUNNING';
    B_DEBUGGER_CALL : Result := 'B_DEBUGGER_CALL';
    B_BREAKPOINT_HIT : Result := 'B_BREAKPOINT_HIT';
    B_SNGLSTP : Result := 'B_SNGLSTP';
    B_NMI : Result := 'B_NMI';
    B_MACHINE_CHECK_EXCEPTION : Result := 'B_MACHINE_CHECK_EXCEPTION';
    B_SEGMENT_VIOLATION : Result := 'B_SEGMENT_VIOLATION';
    B_ALIGNMENT_EXCEPTION : Result := 'B_ALIGNMENT_EXCEPTION';
    B_DIVIDE_ERROR : Result := 'B_DIVIDE_ERROR';
    B_OVERFLOW_EXCEPTION : Result := 'B_OVERFLOW_EXCEPTION';
    B_BOUNDS_CHECK_EXCEPTION : Result := 'B_BOUNDS_CHECK_EXCEPTION';
    B_INVALID_OPCODE_EXCEPTION : Result := 'B_INVALID_OPCODE_EXCEPTION';
    B_SEGMENT_NOT_PRESENT : Result := 'B_SEGMENT_NOT_PRESENT';
    B_STACK_FAULT : Result := 'B_STACK_FAULT';
    B_GENERAL_PROTECTION_FAULT : Result := 'B_GENERAL_PROTECTION_FAULT';
    B_FLOATING_POINT_EXCEPTION : Result := 'B_FLOATING_POINT_EXCEPTION';
    B_GET_PROFILING_INFO : Result := 'B_GET_PROFILING_INFO';
    B_WATCHPOINT_HIT : Result := 'B_WATCHPOINT_HIT';
    B_SYSCALL_HIT : Result := 'B_SYSCALL_HIT';
  end;
end;
{$endif CPUI386}

function debugger_messageToStr(debugger_msg : debugger_message) : string;
begin
  case debugger_msg of
    B_THREAD_STOPPED : Result := 'B_THREAD_STOPPED';    // thread stopped, here is its state
    B_TEAM_CREATED   : Result := 'B_TEAM_CREATED';      // team was created
    B_TEAM_DELETED   : Result := 'B_TEAM_DELETED';      // team was deleted
{$ifdef POWERPC}
    B_PEF_IMAGE_CREATED : Result := 'B_PEF_IMAGE_CREATED'; // pef image was created
    B_PEF_IMAGE_DELETED : Result := 'B_PEF_IMAGE_DELETED'; // pef image was deleted
{$endif}
{$ifdef CPUI386}
    B_ELF_IMAGE_CREATED : Result := 'B_ELF_IMAGE_CREATED'; // pe image was created
    B_ELF_IMAGE_DELETED : Result := 'B_ELF_IMAGE_DELETED'; // pe image was deleted
{$endif}
    B_THREAD_CREATED : Result := 'B_THREAD_CREATED';    // thread was created
    B_THREAD_DELETED : Result := 'B_THREAD_DELETED';    // thread was deleted
    B_SYSCALL_POST   : Result := 'B_SYSCALL_POST';      // end of syscall
  end;
end;

procedure WriteCpuState(CpuState : cpu_state);
begin
  WriteLn('  cpu : ' + IntToStr(SizeOf(cpu_state)));
  WriteLn('  gs : $' + Hexstr(CpuState.gs, 4));
  WriteLn('  fs : $' + Hexstr(CpuState.fs, 4));
  WriteLn('  es : $' + Hexstr(CpuState.es, 4));
  WriteLn('  ds : $' + Hexstr(CpuState.ds, 4));        
  WriteLn('  edi : $' + Hexstr(CpuState.edi, 8));  
  WriteLn('  esi : $' + Hexstr(CpuState.esi, 8));
  WriteLn('  ebp : $' + Hexstr(CpuState.ebp, 8));
  WriteLn('  esp_res : $' + Hexstr(CpuState.esp_res, 8));      
  WriteLn('  ebx : $' + Hexstr(CpuState.ebx, 8));
  WriteLn('  edx : $' + Hexstr(CpuState.edx, 8));    
  WriteLn('  ecx : $' + Hexstr(CpuState.ecx, 8));  
  WriteLn('  eax : $' + Hexstr(CpuState.eax, 8));  
  WriteLn('  trap_no : $' + Hexstr(CpuState.trap_no, 8));
  WriteLn('  error_code : $' + Hexstr(CpuState.error_code, 8));  
  WriteLn('  eip : $' + Hexstr(CpuState.eip, 8));
end;

procedure WriteThreadStopped(thread_stopped : db_thread_stopped_msg);
begin
  WriteLn('  thread_id : ' + IntToStr(thread_stopped.thread));
  WriteLn('  team_id :' + IntToStr(thread_stopped.team));
  WriteLn('  why : ' + db_why_stoppedToStr(thread_stopped.why));
  WriteLn('  nub_port : ' + IntToStr(thread_stopped.nub_port));
  WriteCPUState(thread_stopped.cpu);
   // TODO Writing CPU_STATE and data pointer (need up to date implementation of CPU_STATE)
end;

procedure WriteTeamCreated(team_created : db_team_created_msg);
begin
  WriteLn('  team_id :' + IntToStr(team_created.team));
end;

procedure WriteTeamDeleted(team_deleted : db_team_deleted_msg);
begin
  WriteLn('  team_id :' + IntToStr(team_deleted.team));
end;

procedure WriteElfImageCreated(pef_image_created : db_pef_image_created_msg);
begin
  WriteLn('  reply_token : ' + IntToStr(pef_image_created.reply_token));
  WriteLn('  team : ' + IntToStr(pef_image_created.team));
  WriteLn('  thread : ' + IntToStr(pef_image_created.thread));
  WriteLn('  info : TODO');
  WriteLn('  nub_port : ' + IntToStr(pef_image_created.nub_port));      
end;

procedure WriteElfImageDeleted(pef_image_deleted : db_pef_image_deleted_msg);
begin
  WriteLn('  team : ' + IntToStr(pef_image_deleted.team));
  WriteLn('  info : TODO');
end;

procedure WriteThreadCreated(thread_created : db_thread_created_msg);
begin
  WriteLn('  thread_id : ' + IntToStr(thread_created.thread));
  WriteLn('  team_id :' + IntToStr(thread_created.team));
end;

procedure WriteThreadDeleted(thread_deleted : db_thread_deleted_msg);
begin
  WriteLn('  thread_id : ' + IntToStr(thread_deleted.thread));
  WriteLn('  team_id :' + IntToStr(thread_deleted.team));
end;

procedure  WriteSyscallPost(syscall_post : db_syscall_post_msg);
begin
  WriteLn('  thread_id : ' + IntToStr(syscall_post.thread));
  WriteLn('  team_id :' + IntToStr(syscall_post.team));
  WriteLn('  syscall Nr : ' + IntToStr(syscall_post.syscall));
end;

procedure WriteDebugMsg(msg_code : debugger_message; msg : to_debugger_msg);
begin
      case msg_code of
        B_THREAD_STOPPED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteThreadStopped(msg.thread_stopped);
          end;
        B_TEAM_CREATED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));        
            WriteTeamCreated(msg.team_created);
          end;
        B_TEAM_DELETED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));        
            WriteTeamDeleted(msg.team_deleted);
          end;
{$ifdef POWERPC}
        B_PEF_IMAGE_CREATED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteElfImageCreated(msg.pef_image_created);
          end;
        B_PEF_IMAGE_DELETED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteElfImageDeleted(msg.pef_image_deleted);
          end;
{$endif}        
{$ifdef CPUI386}        
        B_ELF_IMAGE_CREATED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteElfImageCreated(msg.pef_image_created);
          end;
        B_ELF_IMAGE_DELETED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteElfImageDeleted(msg.pef_image_deleted);          
          end;
{$endif}        
        B_THREAD_CREATED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteThreadCreated(msg.thread_created);
          end;
        B_THREAD_DELETED : 
          begin
            WriteLn(debugger_messageToStr(msg_code));
            WriteThreadDeleted(msg.thread_deleted);
          end;
        B_SYSCALL_POST : 
          begin
            WriteLn(debugger_messageToStr(msg_code));        
            WriteSyscallPost(msg.syscall_post);
          end;
      end;
end;

var
  aport : port_id;
  athread : thread_id;
  msg_code : debugger_message;
  tbl : array[0..255] of Char;
  s, sopt, scmd : string;
  size : ssize_t;
  msg : to_debugger_msg;
  msg2 : to_nub_msg;
  ReturnValue : integer;
  Cmd : array[0..255] of Char;
  Cmds : array[0..1] of PChar;
  ThreadInfo : thread_info;
  value : string;
begin
  WriteLn('Welcome in the Freepascal debugger for BeOS !');
  WriteLn('team_id : (return to use the Freepascal debugger for BeOS as the default debugger)');
  ReadLn(sopt);
  if sopt <> '' then
  begin
    aport := Create_port(30, 'Debug_port');
    WriteLn('Cmd : ');
    ReadLn(scmd);
    Cmd := scmd;
    Cmds[0] := Cmd;
    athread := load_image(1, Cmds, nil);
    get_thread_info(athread, @ThreadInfo);
    install_team_debugger(ThreadInfo.team{StrToInt(sopt)}, aport);
    strace_init(athread, DEBUG_syscall_tracing_only);
    resume_thread(athread);
    while True do
    begin
      size := Read_port(aport, Longint(msg_code), @msg, SizeOf(msg));    
      WriteDebugMsg(msg_code, msg);
      WriteLn('  Size :' + IntToStr(size));
      WriteLn('  Code :' + IntToStr(Longint(msg_code)));      
      if msg_code = B_THREAD_STOPPED then
      begin
        WriteLn('Before write msg run thread');
        msg2.nub_run_thread.thread := msg.thread_stopped.thread;
        msg2.nub_run_thread.cpu := msg.thread_stopped.cpu;
        Write_port(msg.thread_stopped.nub_port, Longint(B_RUN_THREAD), @msg2, SizeOf(msg2));
        WriteLn('After write msg run thread');
      end;      
    end;
  end
  else
  begin
    aport := Create_port(30, 'Debug_port');
    install_default_debugger(aport);
    while True do
    begin
      size := Read_port(aport, Longint(msg_code), @msg, SizeOf(msg));
      WriteDebugMsg(msg_code, msg);      
      WriteLn('  Size :' + IntToStr(size));
      WriteLn('  Code :' + IntToStr(Longint(msg_code)));
      if msg_code = B_THREAD_STOPPED then
      begin
        ReadLn();
        WriteLn('Before write msg run thread');
        msg2.nub_run_thread.thread := msg.thread_stopped.thread;
        msg2.nub_run_thread.cpu := msg.thread_stopped.cpu;
        Write_port(msg.thread_stopped.nub_port, Longint(B_RUN_THREAD), @msg2, SizeOf(msg2));
        WriteLn('After write msg run thread');
      end;
    end;
  end;
end.
