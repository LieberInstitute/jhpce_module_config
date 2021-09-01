-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads bamtofastq version 1.3.2.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for bamtofastq/1.3.2")
prepend_path("PATH", "/jhpce/shared/jhpce/libd/bamtofastq/1.3.2")
