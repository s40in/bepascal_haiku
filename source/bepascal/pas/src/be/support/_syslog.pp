{   BePascal - A pascal wrapper around the BeOS API
    Copyright (C) 2003 Olivier Coursiere
                       Eric Jourde
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
unit _syslog;

interface

const
  kBeLibName = 'be';

//----- Priority -----
const
  LOG_EMERG   = 0;
  LOG_PANIC   = LOG_EMERG;
  LOG_ALERT   = 1;
  LOG_CRIT    = 2;
  LOG_ERR     = 3;
  LOG_WARNING = 4;
  LOG_NOTICE  = 5;
  LOG_INFO    = 6;
  LOG_DEBUG   = 7;

  LOG_NPRIORITIES = 8;

  LOG_PRIMASK = $7;

  function LOG_PRI(p : Integer) : Integer;
  function LOG_MAKEPRI(fac, pri : Integer) : Integer;

{$ifdef SYSLOG_NAMES}
  INTERNAL_NOPRI = $8;
  INTERNAL_MARK  = LOG_MAKEPRI(LOG_NFACILITIES, 0);

var
  prioritynames : array of PChar = ('panic', 'alert', 'crit', 'err', 'warning',
                                    'notice', 'info', 'debug', 'none', nil);
{$endif}

const
//----- Facility -----
  LOG_KERN     =  0 shl 3;
  LOG_USER     =  1 shl 3;
  LOG_MAIL     =  2 shl 3;
  LOG_DAEMON   =  3 shl 3;
  LOG_AUTH     =  4 shl 3;
  LOG_SYSLOG   =  5 shl 3;
  LOG_LPR      =  6 shl 3;
  LOG_NEWS     =  7 shl 3;
  LOG_UUCP     =  8 shl 3;
  LOG_CRON     =  9 shl 3;
  LOG_AUTHPRIV = 10 shl 3;

//----- Private or reserved ------
  LOG_LOCAL0 = 16 shl 3;
  LOG_LOCAL1 = 17 shl 3;
  LOG_LOCAL2 = 18 shl 3;
  LOG_LOCAL3 = 19 shl 3;
  LOG_LOCAL4 = 20 shl 3;
  LOG_LOCAL5 = 21 shl 3;
  LOG_LOCAL6 = 22 shl 3;
  LOG_LOCAL7 = 23 shl 3;

  LOG_NFACILITIES = 24;
  LOG_FACMASK = $3f8;

  function LOG_FAC(p : Integer) : Integer;

{$ifdef SYSLOG_NAMES}
var
  facilitynames : array of PChar = ('kern', 'user', 'mail', 'daemon',
                                    'auth', 'syslogd', 'lpr', 'news',
                                    'uucp', 'cron', 'authpriv', '',
                                    '', '', '', '',
                                    'local0', 'local1', 'local2', 'local3',
                                    'local4', 'local5', 'local6', 'local7',
                                    nil);
{$endif SYSLOG_NAMES }

//----- Logging  ------
{$ifdef KERNEL}
  LOG_PRINTF = -1;
{$endif}

  //----- setlogmask args -----
  function LOG_MASK(pri : Integer) : Integer;
  function LOG_UPTO(pri : Integer) : Integer;

//----- openlog options -----
const
  LOG_OPTIONSMASK = $000ff000;

  function LOG_OPTIONS(p : Integer) : Integer;

const
  LOG_PID    = $01 shl 12;
  LOG_THID   = LOG_PID;
  LOG_TMID   = LOG_PID;
  LOG_CONS   = $02 shl 12; // no-op
  LOG_ODELAY = $04 shl 12; // no-op
  LOG_NDELAY = $08 shl 12; // no-op
  LOG_SERIAL = $10 shl 12;
  LOG_PERROR = $20 shl 12;

//----- Logging Functions ------
procedure closelog; cdecl; external kBeLibName name 'closelog';
procedure closelog_team; cdecl; external kBeLibName name 'closelog_team';
procedure closelog_thread; cdecl; external kBeLibName name 'closelog_thread';

procedure openlog(a : PChar; b, c : Integer); cdecl; external kBeLibName name 'openlog';
procedure openlog_team(a : PChar; b, c : Integer); cdecl; external kBeLibName name 'openlog_team';
procedure openlog_thread(a : PChar; b, c : Integer); cdecl; external kBeLibName name 'openlog_thread';

procedure syslog(i : Integer; l : PChar; args : array of const); cdecl; external kBeLibName name 'syslog';
procedure log_team(i : Integer; l : PChar; args : array of const); cdecl; external kBeLibName name 'log_team';
procedure log_thread(i : Integer; l : PChar; args : array of const); cdecl; external kBeLibName name 'log_thread';

function setlogmask(mask : Integer) : Integer; cdecl; external kBeLibName name 'setlogmask';
function setlogmask_team(mask : Integer) : Integer; cdecl; external kBeLibName name 'setlogmask_team';
function setlogmask_thread(mask : Integer) : Integer; cdecl; external kBeLibName name 'setlogmask_thread';

implementation

{.$INLINE ON}

function LOG_PRI(p : Integer) : Integer;// inline;
begin
  Result := p and LOG_PRIMASK;
end;

function LOG_MAKEPRI(fac, pri : Integer) : Integer;// inline;
begin
  Result := (fac shl 3) or (pri);
end;

function LOG_FAC(p : Integer) : Integer;// inline;
begin
  Result := (p and LOG_FACMASK) shr 3;
end;

function LOG_MASK(pri : Integer) : Integer;// inline;
begin
  Result := (1 shl pri);
end;

function LOG_UPTO(pri : Integer) : Integer;// inline;
begin
  Result := (1 shl (pri + 1)) - 1;
end;

function LOG_OPTIONS(p : Integer) : Integer;// inline;
begin
  Result := p and LOG_OPTIONSMASK;
end;

end.