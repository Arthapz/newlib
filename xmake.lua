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

add_cxflags(table.unwrap(flags))
add_asflags(table.unwrap(flags))
add_cxflags("-fno-builtin", "-Wno-implicit-function-declaration", "-Wno-int-conversion")
add_defines("__SWITCH__=1", "__SWITCH=1")

add_sysincludedirs("newlib/libc/sys/arm")
add_sysincludedirs("newlib/libc/include")

includes("newlib")