## Haiku Generic Makefile v2.6 ##

## Fill in this file to specify the project being created, and the referenced
## Makefile-Engine will do all of the hard work for you. This handles any
## architecture of Haiku.

# The name of the binary.
NAME = libbepascal

# The type of binary, must be one of:
#	APP:	Application
#	SHARED:	Shared library or add-on
#	STATIC:	Static library archive
#	DRIVER: Kernel driver
TYPE = SHARED

# 	If you plan to use localization, specify the application's MIME signature.
APP_MIME_SIG = 

#	The following lines tell Pe and Eddie where the SRCS, RDEFS, and RSRCS are
#	so that Pe and Eddie can fill them in for you.
#%{
# @src->@ 

#	Specify the source files to use. Full paths or paths relative to the 
#	Makefile can be included. All files, regardless of directory, will have
#	their object files created in the common object directory. Note that this
#	means this Makefile will not work correctly if two source files with the
#	same name (source.c or source.cpp) are included from different directories.
#	Also note that spaces in folder names do not work well with this Makefile.
SRCS =  src/be/support/String.cpp src/be/support/StopWatch.cpp src/be/support/List.cpp src/be/support/Flattenable.cpp src/be/support/DataIO.cpp src/be/support/Archivable.cpp src/be/storage/VolumeRoster.cpp src/be/storage/Volume.cpp src/be/storage/Resources.cpp src/be/storage/Path.cpp src/be/storage/Node.cpp src/be/storage/FilePanel.cpp src/be/storage/File.cpp src/be/storage/Entry.cpp src/be/mail/E-mail.cpp src/be/interface/Window.cpp src/be/interface/View.cpp src/be/interface/TextView.cpp src/be/interface/TextControl.cpp src/be/interface/TabView.cpp src/be/interface/StringView.cpp src/be/interface/StatusBar.cpp src/be/interface/Shape.cpp src/be/interface/ScrollView.cpp src/be/interface/ScrollBar.cpp src/be/interface/Screen.cpp src/be/interface/Region.cpp src/be/interface/Rect.cpp src/be/interface/RadioButton.cpp src/be/interface/Polygon.cpp src/be/interface/Point.cpp src/be/interface/Picture.cpp src/be/interface/OutlineListView.cpp src/be/interface/MenuItem.cpp src/be/interface/MenuBar.cpp src/be/interface/Menu.cpp src/be/interface/ListView.cpp src/be/interface/ListItem.cpp src/be/interface/Font.cpp src/be/interface/Control.cpp src/be/interface/CheckBox.cpp src/be/interface/Button.cpp src/be/interface/Box.cpp src/be/interface/Bitmap.cpp src/be/interface/Alert.cpp src/be/device/SerialPort.cpp src/be/device/Joystick.cpp src/be/bepas_kernel/beobj.cpp src/be/app/Roster.cpp src/be/app/Messenger.cpp src/be/app/Message.cpp src/be/app/Looper.cpp src/be/app/Invoker.cpp src/be/app/Handler.cpp src/be/app/Cursor.cpp src/be/app/Clipboard.cpp src/be/app/Application.cpp

#	Specify the resource definition files to use. Full or relative paths can be
#	used.
RDEFS = 

#	Specify the resource files to use. Full or relative paths can be used.
#	Both RDEFS and RSRCS can be utilized in the same Makefile.
RSRCS = 

# End Pe/Eddie support.
# @<-src@ 
#%}

#	Specify libraries to link against.
#	There are two acceptable forms of library specifications:
#	-	if your library follows the naming pattern of libXXX.so or libXXX.a,
#		you can simply specify XXX for the library. (e.g. the entry for
#		"libtracker.so" would be "tracker")
#
#	-	for GCC-independent linking of standard C++ libraries, you can use
#		$(STDCPPLIBS) instead of the raw "stdc++[.r4] [supc++]" library names.
#
#	- 	if your library does not follow the standard library naming scheme,
#		you need to specify the path to the library and it's name.
#		(e.g. for mylib.a, specify "mylib.a" or "path/mylib.a")
LIBS = libbe.so libroot.so libmail.so libdevice.so libtracker.so

#	Specify additional paths to directories following the standard libXXX.so
#	or libXXX.a naming scheme. You can specify full paths or paths relative
#	to the Makefile. The paths included are not parsed recursively, so
#	include all of the paths where libraries must be found. Directories where
#	source files were specified are	automatically included.
LIBPATHS = 

#	Additional paths to look for system headers. These use the form
#	"#include <header>". Directories that contain the files in SRCS are
#	NOT auto-included here.
SYSTEM_INCLUDE_PATHS =  /boot/system/develop/headers/be /boot/system/develop/headers/cpp /boot/system/develop/headers/posix

#	Additional paths paths to look for local headers. These use the form
#	#include "header". Directories that contain the files in SRCS are
#	automatically included.
LOCAL_INCLUDE_PATHS =  . src/be/app src/be/bepas_kernel src/be/device src/be/interface src/be/mail src/be/storage src/be/support include/be/app include/be/bepas_kernel include/be/interface include/be/support include/hey

#	Specify the level of optimization that you want. Specify either NONE (O0),
#	SOME (O1), FULL (O2), or leave blank (for the default optimization level).
OPTIMIZE := NONE

# 	Specify the codes for languages you are going to support in this
# 	application. The default "en" one must be provided too. "make catkeys"
# 	will recreate only the "locales/en.catkeys" file. Use it as a template
# 	for creating catkeys for other languages. All localization files must be
# 	placed in the "locales" subdirectory.
LOCALES = 

#	Specify all the preprocessor symbols to be defined. The symbols will not
#	have their values set automatically; you must supply the value (if any) to
#	use. For example, setting DEFINES to "DEBUG=1" will cause the compiler
#	option "-DDEBUG=1" to be used. Setting DEFINES to "DEBUG" would pass
#	"-DDEBUG" on the compiler's command line.
DEFINES = 

#	Specify the warning level. Either NONE (suppress all warnings),
#	ALL (enable all warnings), or leave blank (enable default warnings).
WARNINGS = 

#	With image symbols, stack crawls in the debugger are meaningful.
#	If set to "TRUE", symbols will be created.
SYMBOLS := 

#	Includes debug information, which allows the binary to be debugged easily.
#	If set to "TRUE", debug info will be created.
DEBUGGER := 

#	Specify any additional compiler flags to be used.
COMPILER_FLAGS = 

#	Specify any additional linker flags to be used.
LINKER_FLAGS = 

#	(Only used when "TYPE" is "DRIVER"). Specify the desired driver install
#	location in the /dev hierarchy. Example:
#		DRIVER_PATH = video/usb
#	will instruct the "driverinstall" rule to place a symlink to your driver's
#	binary in ~/add-ons/kernel/drivers/dev/video/usb, so that your driver will
#	appear at /dev/video/usb when loaded. The default is "misc".
DRIVER_PATH = 

## Include the Makefile-Engine
DEVEL_DIRECTORY := \
	$(shell findpaths -r "makefile_engine" B_FIND_PATH_DEVELOP_DIRECTORY)
include $(DEVEL_DIRECTORY)/etc/makefile-engine
