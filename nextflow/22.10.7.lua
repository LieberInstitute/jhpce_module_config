-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads nextflow version 22.10.7.
]])

whatis("Nextflow")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for nextflow/22.10.7")
    LmodMessage('## To deal with running nextflow without requesting much more memory check https://jhpce.jhu.edu/question/why-do-i-get-memory-errors-when-running-java/. You might want to use something like: export _JAVA_OPTIONS="-Xms5g -Xmx6g"')

    -- The 'conda_R' module seems to interfere with first-time execution of
    -- nextflow when '_JAVA_OPTIONS' is set. To avoid this confusing scenario,
    -- make sure 'conda_R' is not loaded while using nextflow
    -- (this should be conditional, not all people have this loaded by default)
    -- unload('conda_R')
    load('java/18')
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for nextflow/22.10.7")
    unload('java/18')
end

prepend_path("PATH", "/jhpce/shared/libd/core/nextflow/22.10.7")
