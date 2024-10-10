help([[This module loads cellpose 2.0 for CUDA 11.3.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cellpose/2.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cellpose/2.0")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-24.3.0")
execute {cmd="conda activate /jhpce/shared/libd/core/cellpose/2.0/cellpose_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Manually add a directory to the library path
prepend_path(
    "LD_LIBRARY_PATH", "/jhpce/shared/libd/core/cellpose/2.0/cellpose_env/lib"
)

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
