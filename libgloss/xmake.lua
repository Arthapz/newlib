target("libgloss")
    set_kind("headeronly")

    -- detect it instead of hardcode it
    set_configvar("HAVE_ASM_POPSECTION_DIRECTIVE", 1)
    set_configvar("HAVE_ASM_PREVIOUS_DIRECTIVE", 1)
    set_configvar("HAVE_ELF", 1)
    set_configvar("HAVE_GNU_LD", 0)
    set_configvar("HAVE_SECTION_ATTRIBUTES", 1)
    set_configvar("PACKAGE_BUGREPORT", "")
    set_configvar("PACKAGE_NAME", "libgloss")
    set_configvar("PACKAGE_STRING", "libgloss LIBGLOSS_VERSION")
    set_configvar("PACKAGE_TARNAME", "libgloss")
    set_configvar("PACKAGE_URL", "")
    set_configvar("PACKAGE_VERSION", "LIBGLOSS_VERSION")
    set_configvar("__SYMBOL_PREFIX", "")

    add_defines("HAVE_CONFIG_H", {public = true})

    add_headerfiles("$(buildir)/(**.hpp)")

    add_sysincludedirs("../newlib/libc/machine/aarch64/", {public = true})
    add_sysincludedirs("../newlib/libc/machine/aarch64/sys", {public = true})
    add_sysincludedirs("../newlib/libc/sys/arm", {public = true})
    add_sysincludedirs("../newlib/libc/include", {public = true})

    add_configfiles("config.h.in")
    add_includedirs("$(buildir)", {public = true})
    add_includedirs(".", {public = true})

local modules = {
    librdimon = {
        dir = "aarch64",
        defines = {"SEMIHOST_V2", "ARM_RDI_MONITOR"},
        files = {"**.c", "*.S"}
    },
    libnosys = {
        dir = "libnosys",
        files = {"**.c"}
    },
    libsysbase = {
        dir = "libsysbase",
        defines = {"_BUILDING_LIBSYSBASE"},
        files = {"**.c"}
    }
}

for name, infos in pairs(modules) do
    target(name)
        set_kind("static")

        for _, filetype in ipairs(infos.files) do
            add_files(path.join(infos.dir, filetype))
        end

        remove_files("libgloss/libsysbase/pthread.c")

        set_prefixname("")

        set_extension(".a")

        set_exceptions("no-cxx")

        add_includedirs(infos.dir)

        if infos.defines then
            add_defines(table.unwrap(infos.defines))
        end

        add_deps("libgloss")
end

target("libpthread")
    set_kind("static")

    add_files("libsysbase/pthread.c")

    set_prefixname("")

    set_extension(".a")

    set_exceptions("no-cxx")

    add_defines("_BUILDING_LIBSYSBASE")

    add_deps("libgloss")