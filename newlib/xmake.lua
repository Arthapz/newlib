target("newlib")
    set_kind("headeronly")

    -- detect it instead of hardcode it
    set_configvar("_MB_CAPABLE", 1)
    set_configvar("_MB_LEN_MAX", 8)
    set_configvar("_ATEXIT_DYNAMIC_ALLOC", 1)
    set_configvar("_FSEEK_OPTIMIZATION", 1)
    set_configvar("_FVWRITE_IN_STREAMIO", 1)
    set_configvar("_HAVE_CC_INHIBIT_LOOP_TO_LIBCALL", 1)
    set_configvar("_HAVE_INITFINI_ARRAY", 1)
    set_configvar("_HAVE_INIT_FINI", 1)
    set_configvar("_HAVE_LONG_DOUBLE", 1)
    set_configvar("_REENT_CHECK_VERIFY", 1)
    set_configvar("_UNBUF_STREAM_OPT", 1)
    set_configvar("_WANT_IO_LONG_LONG", 1)
    set_configvar("_WANT_USE_GDTOA", 1)

    add_configfiles("newlib.hin", {filename = 'newlib.h'})

    set_configvar("_NEWLIB_VERSION", "4.3.0")
    set_configvar("__NEWLIB__", 4)
    set_configvar("__NEWLIB_MINOR__", 3)
    set_configvar("__NEWLIB_PATCHLEVEL__", 0)

    add_defines("_LIBC", "__NO_SYSCALLS__", "__DYNAMIC_REENT__", "REENTRANT_SYSCALLS_PROVIDED", "_HAVE_INIT_FINI", "HAVE_CONFIG_H", "__DEFAULT_UTF8__", {public = true})

    add_configfiles("_newlib_version.hin", {filename = "_newlib_version.h"})
    add_includedirs("$(buildir)", {public = true})
    set_toolchains("switch-llvm")

target("libm")
    set_kind("static")

    set_plat("switch")
    set_arch("aarch64")

    add_files("libm/common/**.c")
    add_files("libm/complex/**.c")
    add_files("libm/fenv/**.c")
    add_files("libm/machine/aarch64/*.c")
    add_files("libm/math/**.c")

    add_includedirs("libm/common")
    add_sysincludedirs("libc/machine/aarch64/")

    set_prefixname("")

    set_extension(".a")

    set_exceptions("no-cxx")

    add_deps("newlib")
    set_toolchains("switch-llvm")

target("libc")
    set_kind("static")

    set_plat("switch")
    set_arch("aarch64")

    add_files("libc/argz/**.c")
    add_files("libc/ssp/*.c")
    add_files("libc/machine/aarch64/**.c")
    add_files("libc/machine/aarch64/**.S")
    add_files("libc/syscalls/*.c")
    add_files("libc/misc/*.c")
    add_files("libc/reent/*.c")
    add_files("libc/string/*.c")
    add_files("libc/locale/**.c")
    add_files("libc/stdio/*.c")
    add_files("libc/search/*.c")
    add_files("libc/ctype/**.c")
    add_files("libc/stdlib/*.c")
    add_files("libc/errno/*.c")
    add_files("libc/time/*.c")
    add_files("libc/signal/*.c")

    set_prefixname("")

    set_extension(".a")

    set_exceptions("no-cxx")

    add_headerfiles("libc/include/(**.h)")
    add_headerfiles("libc/sys/arm/(sys/*.h)")

    add_deps("newlib", "libm")
    set_toolchains("switch-llvm")
