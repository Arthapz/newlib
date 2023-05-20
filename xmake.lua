local flags = {
    "-fno-builtin",
    "-Wno-implicit-function-declaration",
    "-Wno-int-conversion"
}

add_cxflags(table.unwrap(flags))
add_asflags(table.unwrap(flags))

add_sysincludedirs("newlib/libc/sys/arm")
add_sysincludedirs("newlib/libc/include")

includes("newlib")