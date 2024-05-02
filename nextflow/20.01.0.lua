-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[This module loads nextflow version 20.01.0 build 5264.]])

whatis("Nextflow")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

load('java/18')

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for nextflow/20.01.0")
    LmodMessage('To instruct Nextflow to allocate enough memory for Java, consider running something like: export NXF_JVM_ARGS="-Xms5g -Xmx6g".')
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for nextflow/20.01.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/nextflow/20.01.0/nextflow-20.01.0")
