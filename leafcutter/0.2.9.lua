-- Lua module file for leafcutter/0.2.9
help([[This module loads R v4.0.5 with leafcutter 0.2.9 and  python 3.10]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use an interactive or sbatch session to connect to a valid compute node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for leafcutter/0.2.9")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for leafcutter/0.2.9")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-24")
execute {cmd="conda activate /jhpce/shared/libd/core/leafcutter/leafcutter-0.2.9", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "")

