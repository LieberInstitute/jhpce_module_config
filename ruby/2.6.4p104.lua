-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads ruby version 2.6.4p104.
]])

whatis("ruby")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for ruby/2.6.4p104")
prepend_path("PATH", "/jhpce/shared/libd/core/ruby/2.6.4p104/rubyinstall/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/ruby/2.6.4p104/rubyinstall/share/man/man1")

