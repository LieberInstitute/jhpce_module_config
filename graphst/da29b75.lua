help([[
This module loads GraphST (commit da29b75).
]])

if not string.match(os.getenv("SLURMD_NODENAME"),"compute") and not  string.match(os.getenv("SLURMD_NODENAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for graphst/da29b75")
    LmodMessage("GPU support with pytorch requires CUDA >= 11.3.")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for graphst/da29b75")
end

-- Directly activate or deactivate the conda environment
execute {cmd="conda activate /jhpce/shared/libd/core/graphst/da29b75/graphst_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}
