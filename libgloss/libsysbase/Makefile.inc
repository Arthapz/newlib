multilibtool_DATA += %D%/sysbase.specs
multilibtool_LIBRARIES += %D%/libsysbase.a

%C%_libsysbase_a_CPPFLAGS = $(AM_CPPFLAGS) -D_BUILDING_LIBSYSBASE

%C%_libsysbase_a_SOURCES = \
	%D%/_exit.c \
	%D%/abort.c \
	%D%/build_argv.c \
	%D%/chdir.c \
	%D%/chmod.c \
	%D%/clocks.c \
	%D%/dirent.c \
	%D%/environ.c \
	%D%/execve.c \
	%D%/fchmod.c \
	%D%/fork.c \
	%D%/fstat.c \
	%D%/fsync.c \
	%D%/ftruncate.c \
	%D%/getpid.c \
	%D%/getreent.c \
	%D%/gettod.c \
	%D%/handle_manager.c \
	%D%/iosupport.c \
	%D%/isatty.c \
	%D%/kill.c \
	%D%/link.c \
	%D%/lseek.c \
	%D%/lstat.c \
	%D%/malloc_vars.c \
	%D%/mkdir.c \
	%D%/nanosleep.c \
	%D%/open.c \
	%D%/read.c \
	%D%/rename.c \
	%D%/rmdir.c \
	%D%/sbrk.c \
	%D%/scandir.c \
	%D%/sleep.c \
	%D%/stat.c \
	%D%/statvfs.c \
	%D%/syscall_support.c \
	%D%/times.c \
	%D%/truncate.c \
	%D%/unlink.c \
	%D%/usleep.c \
	%D%/utime.c \
	%D%/wait.c \
	%D%/write.c