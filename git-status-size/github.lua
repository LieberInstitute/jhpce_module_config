-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads git-status-size version github.
]])

whatis("git-status-size")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for git-status-size/github")
prepend_path("PATH", "/jhpce/shared/libd/core/git-status-size/github/git-status-size")
