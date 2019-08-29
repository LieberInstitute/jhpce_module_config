-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads git-lfs version 2.8.0.
]])

whatis("git-lfs")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for git-lfs/2.8.0")
load('git')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/git-lfs/2.8.0/git-lfs-files")
