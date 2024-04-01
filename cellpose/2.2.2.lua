help([[This module loads cellpose 2.2.2 for CUDA 11.3.]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cellpose/2.2.2")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cellpose/2.2.2")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/cellpose/2.2.2/cellpose_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

-- Manually add a directory to the library path
prepend_path(
    "LD_LIBRARY_PATH", "/jhpce/shared/libd/core/cellpose/2.2.2/cellpose_env/lib"
)

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
