local flags = {
    "-target aarch64-none-elf",
    "-march=armv8-a+crc+crypto",
    "-mtune=cortex-a57",
    "-fPIC",
    "-ffunction-sections",
    "-fdata-sections",
    "-nostdlib",
    "-nostdlibinc",
    "-fuse-ld=ld.lld"
}

toolchain("switch-llvm")
    set_kind("standalone")

    set_sdkdir("C:/Dev/switch/llvm")

    set_toolset("cc", "clang")
    set_toolset("cxx", "clang++")
    set_toolset("ar", "llvm-ar")
    set_toolset("as", "clang")
    set_toolset("nm", "llvm-nm")
    set_toolset("ranlib", "llvm-ranlib")
    set_toolset("ld", "lld")
    set_toolset("strip", "llvm-strip")

    add_cxflags(table.unwrap(flags))
    add_asflags(table.unwrap(flags))
    add_cxflags("-fno-builtin", "-Wno-implicit-function-declaration", "-Wno-int-conversion")
    add_defines("__SWITCH__=1", "__SWITCH=1")

    add_sysincludedirs("newlib/libc/sys/arm")
    add_sysincludedirs("newlib/libc/include")

includes("newlib")
includes("libgloss")