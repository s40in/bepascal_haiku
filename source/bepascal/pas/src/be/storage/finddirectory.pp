unit FindDirectory;

interface

uses
  Path, SupportDefs, Volume;

const
{
 Per volume directories.  When asking for these
 directories, a volume must be specified, or the call will assume
 the boot volume.
}
  B_DESKTOP_DIRECTORY  = 0;
  B_TRASH_DIRECTORY    = B_DESKTOP_DIRECTORY + 1;

// BeOS directories.  These are mostly accessed read-only.
  B_BEOS_DIRECTORY               = 1000;
  B_BEOS_SYSTEM_DIRECTORY        = B_BEOS_DIRECTORY +  1;
  B_BEOS_ADDONS_DIRECTORY        = B_BEOS_DIRECTORY +  2;
  B_BEOS_BOOT_DIRECTORY          = B_BEOS_DIRECTORY +  3;
  B_BEOS_FONTS_DIRECTORY         = B_BEOS_DIRECTORY +  4;
  B_BEOS_LIB_DIRECTORY           = B_BEOS_DIRECTORY +  5;
  B_BEOS_SERVERS_DIRECTORY       = B_BEOS_DIRECTORY +  6;
  B_BEOS_APPS_DIRECTORY          = B_BEOS_DIRECTORY +  7;
  B_BEOS_BIN_DIRECTORY           = B_BEOS_DIRECTORY +  8;
  B_BEOS_ETC_DIRECTORY           = B_BEOS_DIRECTORY +  9;
  B_BEOS_DOCUMENTATION_DIRECTORY = B_BEOS_DIRECTORY + 10;
  B_BEOS_PREFERENCES_DIRECTORY   = B_BEOS_DIRECTORY + 11;
  B_BEOS_TRANSLATORS_DIRECTORY   = B_BEOS_DIRECTORY + 12;
  B_BEOS_MEDIA_NODES_DIRECTORY   = B_BEOS_DIRECTORY + 13;
  B_BEOS_SOUNDS_DIRECTORY        = B_BEOS_DIRECTORY + 14;

// Common directories, shared among all users.
  B_COMMON_DIRECTORY               = 2000;
  B_COMMON_SYSTEM_DIRECTORY        = B_COMMON_DIRECTORY +  1;
  B_COMMON_ADDONS_DIRECTORY        = B_COMMON_DIRECTORY +  2;
  B_COMMON_BOOT_DIRECTORY          = B_COMMON_DIRECTORY +  3;
  B_COMMON_FONTS_DIRECTORY         = B_COMMON_DIRECTORY +  4;
  B_COMMON_LIB_DIRECTORY           = B_COMMON_DIRECTORY +  5;
  B_COMMON_SERVERS_DIRECTORY       = B_COMMON_DIRECTORY +  6;
  B_COMMON_BIN_DIRECTORY           = B_COMMON_DIRECTORY +  7;
  B_COMMON_ETC_DIRECTORY           = B_COMMON_DIRECTORY +  8;
  B_COMMON_DOCUMENTATION_DIRECTORY = B_COMMON_DIRECTORY +  9;
  B_COMMON_SETTINGS_DIRECTORY      = B_COMMON_DIRECTORY + 10;
  B_COMMON_DEVELOP_DIRECTORY       = B_COMMON_DIRECTORY + 11;
  B_COMMON_LOG_DIRECTORY           = B_COMMON_DIRECTORY + 12;
  B_COMMON_SPOOL_DIRECTORY         = B_COMMON_DIRECTORY + 13;
  B_COMMON_TEMP_DIRECTORY          = B_COMMON_DIRECTORY + 14;
  B_COMMON_VAR_DIRECTORY           = B_COMMON_DIRECTORY + 15;
  B_COMMON_TRANSLATORS_DIRECTORY   = B_COMMON_DIRECTORY + 16;
  B_COMMON_MEDIA_NODES_DIRECTORY   = B_COMMON_DIRECTORY + 17;
  B_COMMON_SOUNDS_DIRECTORY        = B_COMMON_DIRECTORY + 18;

{
 User directories.  These are interpreted in the context
 of the user making the find_directory call.
}
  B_USER_DIRECTORY             = 3000;
  B_USER_CONFIG_DIRECTORY      = B_USER_DIRECTORY +  1;
  B_USER_ADDONS_DIRECTORY      = B_USER_DIRECTORY +  2;
  B_USER_BOOT_DIRECTORY        = B_USER_DIRECTORY +  3;
  B_USER_FONTS_DIRECTORY       = B_USER_DIRECTORY +  4;
  B_USER_LIB_DIRECTORY         = B_USER_DIRECTORY +  5;
  B_USER_SETTINGS_DIRECTORY    = B_USER_DIRECTORY +  6;
  B_USER_DESKBAR_DIRECTORY     = B_USER_DIRECTORY +  7;
  B_USER_PRINTERS_DIRECTORY    = B_USER_DIRECTORY +  8;
  B_USER_TRANSLATORS_DIRECTORY = B_USER_DIRECTORY +  9;
  B_USER_MEDIA_NODES_DIRECTORY = B_USER_DIRECTORY + 10;
  B_USER_SOUNDS_DIRECTORY      = B_USER_DIRECTORY + 11;

// Global directories.
  B_APPS_DIRECTORY        = 4000;
  B_PREFERENCES_DIRECTORY = B_APPS_DIRECTORY + 1;
  B_UTILITIES_DIRECTORY   = B_APPS_DIRECTORY + 2;

type
  directory_which = Longword; // to replace the enum

// The C interface
function find_directory(which : directory_which; // what directory to return path for
                        device : dev_t;	         // device w/volume, for vol-specific directories
                        create_it : Boolean;     // create directory if need be
                        returned_path : PChar;   // buffer for returned path
                        path_length : Longint)   // buffer size
         : status_t; cdecl; external 'root' name 'find_directory';

// C++ interface
function find_directory(which : directory_which; var path : BPath;
                        and_create_it : Boolean {$ifndef VER1_0}= false{$endif};
                        var vol : BVolume {$ifndef VER1_0}= nil{$endif})
         : status_t; cdecl; external 'be' name 'find_directory';

implementation

end.