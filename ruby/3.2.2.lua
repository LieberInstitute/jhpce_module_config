-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads ruby version 3.2.2.
]])

whatis("ruby")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for ruby/3.2.2")
prepend_path("PATH", "/jhpce/shared/libd/core/ruby/3.2.2/rubyinstall/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/ruby/3.2.2/rubyinstall/share/man/man1")
