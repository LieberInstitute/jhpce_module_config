-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads spatula version 1.0.0.
]])

whatis("spatula")

if not string.match(os.getenv("HOSTNAME"),"compute") then  
    LmodError("\
This module can only be loaded on a compute node. Please use an interactive session or submit a job to use it.")
end

local bin_path = "/jhpce/shared/libd/core/spatula/1.0.0"

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for spatula/1.0.0")
    prepend_path("PATH", bin_path)
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for spatula/1.0.0")
    remove_path("PATH", bin_path)
end

