// Description: BeOS.

// #include <time.h>
{
int32	status_t;
int64	bigtime_t;
uint32	type_code;
uint32	perform_code;
}

type
// from <types.h> ---------------------------------------------------
  blkcnt_t = Int64;     // long long
  blksize_t = Integer;  // int
  fsblkcnt_t = Int64;   // long long
  fsfilcnt_t = Int64;   // long long
  ino_t = Int64;        // long long
  cnt_t = Integer;      // int
  mode_t = Cardinal;    // unsigned int
  nlink_t = Integer;    // int
  dev_t = Longint;      // long
  off_t = Int64;        // long long
  pid_t = Longint;      // long

  uid_t = Cardinal;     // unsigned int
  gid_t = Cardinal;     // unsigned int
  umode_t = Cardinal;   // unsigned int
  daddr_t = Integer;    // int

// bsd
  u_char = Byte;     // unsigned char
  u_short = Word;    // unsigned short
  u_int = Integer;   // unsigned int
  u_long = Longword; // unsigned long

// sysv
  unchar = Byte; // unsigned char

  caddr_t = PChar;

// from <size_t.h> --------------------------------------------------
  size_t = Longword; // unsigned long
  ssize_t = Longint; // long



// from <dirent.h> --------------------------------------------------

type
  dirent = record
    d_dev,
    d_pdev : dev_t;
    d_ino,
    d_pino : ino_t;
    d_reclen : Word;
    d_name : string[2]; // this was: char d_name[1]
  end;

  DIR = record
    fd : Integer; // int
    ent : dirent;
  end;

const
  MAXNAMLEN = 256;

  MAXPATHLEN = 1024; // From posix limits.h
