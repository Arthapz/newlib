local flags = {
    "-fno-builtin",
    "-Wno-implicit-function-declaration",
    "-Wno-int-conversion"
}

add_cxflags(flags)
add_asflags(flags)

includes("newlib")