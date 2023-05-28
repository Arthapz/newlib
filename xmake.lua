local flags = {
    "-fno-builtin",
    "-Wno-implicit-function-declaration",
    "-Wno-int-conversion"
}

add_requires("switch-llvm", {host = true})

add_cxflags(flags)
add_asflags(flags)

add_rules("mode.debug", "mode.release")

set_allowedplats("switch")
set_allowedarchs("switch|aarch64")

includes("newlib")
includes("libgloss")