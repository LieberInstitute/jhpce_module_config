-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads spatula commit 7fe7171 (just after release 1.0).
]])

whatis("spatula")

if not string.match(os.getenv("HOSTNAME"),"compute") then  
    LmodError("\
This module can only be loaded on a compute node. Please use an interactive session or submit a job to use it.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for spatula/7fe7171")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for spatula/7fe7171")
end

prepend_path("PATH", "/jhpce/shared/libd/core/spatula/7fe7171/spatula/bin")
