-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads GATK.
]])

whatis("GATK")

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for GATK")
load("python/3.7.3")
prepend_path("PATH", "/jhpce/shared/libd/core/gatk/4.2.0.0")
