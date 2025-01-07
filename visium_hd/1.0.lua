help([[
This module loads several python-based tools for Visium HD analysis, including FICTURE, bin2cell, HERGAST, ENACT, and NEST.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for visium_hd/1.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for visium_hd/1.0")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-24.3.0")
execute {cmd="conda activate /jhpce/shared/libd/core/visium_hd/1.0/hd_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- To add 'bgzip' and 'tabix' to the PATH for FICTURE
load("htslib/1.18")

-- For 'spatula' and 'NEST'
prepend_path('PATH', '/jhpce/shared/libd/core/visium_hd/1.0/spatula/bin')
prepend_path('PATH', '/jhpce/shared/libd/core/visium_hd/1.0/NEST')

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
