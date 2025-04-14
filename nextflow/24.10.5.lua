-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads nextflow version 24.10.5 and nf-test 0.9.2.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for nextflow/24.10.5")
    LmodMessage('To instruct Nextflow to allocate enough memory for Java, consider running something like: export NXF_JVM_ARGS="-Xms5g -Xmx6g".')
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for nextflow/24.10.5")
end

load('java/18')

prepend_path("PATH", "/jhpce/shared/libd/core/nextflow/24.10.5")
