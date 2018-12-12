unit _socket;
// BSD socket-like interface

interface

uses
  SupportDefs;

{$PACKRECORDS C}

// This one belongs to posix/time.h
// We need to find a better place for it.
type
  timeval = record
    tv_sec,
    tv_usec : Longint;
  end;
  Ptimeval = ^timeval;

const
  kBeNETLibName = 'net';

const
  AF_INET = 1;

  INADDR_ANY       = $00000000;
  INADDR_BROADCAST = $ffffffff;
  INADDR_LOOPBACK  = $7f000001; // in host order

  SOL_SOCKET = 1;

  SO_DEBUG     = 1;
  SO_REUSEADDR = 2;
  SO_NONBLOCK  = 3;
  SO_REUSEPORT = 4;

  MSG_OOB = $1;

  SOCK_DGRAM  = 1;
  SOCK_STREAM = 2;

  IPPROTO_UDP  = 1;
  IPPROTO_TCP  = 2;
  IPPROTO_ICMP = 3;

// Be extension
  B_UDP_MAX_SIZE = (65536 - 1024);

type
  sockaddr = record
    sa_family : Word;
    sa_data : array[0..9] of Byte;
  end;
  Psockaddr = ^sockaddr;

  in_addr = record
    s_addr : Longword;
  end;

  sockaddr_in = record
    sin_family,
    sin_port    : Word;
    sin_addr : in_addr;
    sin_zero : array[0..3] of Byte;
  end;

// You can define your own FDSETSIZE if you want more bits
const
  FD_SETSIZE = 256;

// Compatibily only: use FD_SETSIZE instead
  FDSETSIZE = FD_SETSIZE;

const
  NFDBITS = 32;

type
  fd_set = record
    mask : array [0..(FDSETSIZE div NFDBITS) - 1] of Longword;
  end;
  Pfd_set = ^fd_set;

//--- these were macros
// need to change FD_SET name because of naming clash with the record.
  function _FDMSKNO(fd : Longint) : Longint;
  function _FDBITNO(fd : Longint) : Longint;
  procedure FD_ZERO(setp : fd_set);
  procedure FD_SET_(fd : Longint; var setp : fd_set);
  procedure FD_CLR(fd : Longint; var setp : fd_set);
  function FD_ISSET(fd : Longint; setp : fd_set) :  Longint;
//---


function socket(family, _type, proto : Longint) : Longint;
         cdecl; external kBeNETLibName name 'socket';
function bind(fd : Longint; const addr : Psockaddr; size : Longint) : Longint;
         cdecl; external kBeNETLibName name 'bind';
function getsockname(fd : Longint; addr : Psockaddr; size : Longint) : Longint;
         cdecl; external kBeNETLibName name 'getsockname';
function getpeername(fd : Longint; addr : Psockaddr; size : Longint) : Longint;
         cdecl; external kBeNETLibName name 'getpeername';
function recvfrom(fd : Longint; buf : Pointer; size : size_t; flags : Longint;
			      from : Psockaddr; var fromlen : Longint) : ssize_t;
         cdecl; external kBeNETLibName name 'recvfrom';
function sendto(fd : Longint; const buf : Pointer; size : size_t; flags : Longint;
                const _to : Psockaddr; tolen : Longint) : ssize_t;
         cdecl; external kBeNETLibName name 'sendto';

function send(fd : Longint; const buf : Pointer; size : size_t; flags : Longint) : ssize_t;
         cdecl; external kBeNETLibName name 'send';
function recv(fd : Longint; buf : Pointer; size : size_t; flags : Longint) : ssize_t;
         cdecl; external kBeNETLibName name 'recv';

function connect(fd : Longint; const addr : Psockaddr; size : Longint) : Longint;
         cdecl; external kBeNETLibName name 'connect';
function accept(fd : Longint; addr : Psockaddr; var size : Longint) : Longint;
         cdecl; external kBeNETLibName name 'accept';
function listen(fd, backlog : Longint) : Longint;
         cdecl; external kBeNETLibName name 'listen';
function closesocket(fd : Longint) : Longint;
         cdecl; external kBeNETLibName name 'closesocket';

// doesn't work yet (from Be's header file)
function shutdown(fd, how : Longint) : Longint;
         cdecl; external kBeNETLibName name 'shutdown';
function setsockopt(sd, prot, opt : Longint; const data : Pointer;
                    datasize : Longword) : Longint;
         cdecl; external kBeNETLibName name 'setsockopt';

function select(nbits : Longint; rbits, wbits, ebits : Pfd_set; timeout : Ptimeval)
         : Longint; cdecl; external kBeNETLibName name 'select';


implementation


function _FDMSKNO(fd : Longint) : Longint;
begin
  Result := fd div NFDBITS;
end;

function _FDBITNO(fd : Longint) : Longint;
begin
  Result := fd mod NFDBITS;
end;

procedure FD_ZERO(setp : fd_set);
begin
 FillChar(setp.mask, 0, SizeOf(setp.mask));
end;

procedure FD_SET_(fd : Longint; var setp : fd_set);
begin
  setp.mask[_FDMSKNO(fd)] := setp.mask[_FDMSKNO(fd)] or (1 shl (_FDBITNO(fd)));
end;

procedure FD_CLR(fd : Longint; var setp : fd_set);
begin
  setp.mask[_FDMSKNO(fd)] := setp.mask[_FDMSKNO(fd)] and not(1 shl (_FDBITNO(fd)));
end;

function FD_ISSET(fd : Longint; setp : fd_set) : Longint;
begin
  Result := setp.mask[_FDMSKNO(fd)] and (1 shl (_FDBITNO(fd)));
end;

end.