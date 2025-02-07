-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads spatula commit f0e9936.
]])

whatis("spatula")

if not string.match(os.getenv("HOSTNAME"),"compute") then  
    LmodError("\
This module can only be loaded on a compute node. Please use an interactive session or submit a job to use it.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for spatula/f0e9936")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for spatula/f0e9936")
end

prepend_path("PATH", "/jhpce/shared/libd/core/spatula/f0e9936/spatula/bin")
