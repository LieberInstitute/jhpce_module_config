-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads nextflow version 23.10.0 and nf-test 0.8.4.
]])

whatis("Nextflow")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for nextflow/23.10.0")
    LmodMessage('## To deal with running nextflow without requesting much more memory check https://jhpce.jhu.edu/question/why-do-i-get-memory-errors-when-running-java/. Note, however, that Nextflow accepts the "NXF_JVM_ARGS" environment variable instead of "_JAVA_OPTIONS". You might want to use something like: export NXF_JVM_ARGS="-Xms5g -Xmx6g".')
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for nextflow/23.10.0")
end

load('java/18')

prepend_path("PATH", "/jhpce/shared/libd/core/nextflow/23.10.0")
