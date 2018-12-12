unit perfmon_user;
{
  File: perfmon_user.h
  Description: user mode interface to performance counters and time stamp
  registers of 586 and 686 CPUs

  DO NOT use these functions in the production code !!!
  This interface WILL BE CHANGED in the next releases.

  User mode read_pmc() is enabled only on Pentium || because of
  Pentium errata #74 and Pentium Pro errata #26.
  For details see http://developer.intel.com

  Copyright (c) 1998 by Be Incorporated.  All Rights Reserved.
}

interface

{$ifdef CPUI386}
function read_pmc(pmc : Longword) : QWord;
         cdecl; external 'root' name 'read_pmc';
function read_tsc : QWord; cdecl; external 'root' name 'read_tsc';
{$endif CPUI386}

implementation

end.
