help([[
This module loads tensorQTL 1.0.7 for python 3.9.0 packaged with conda_R/4.1.x.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD module for tensorQTL/1.0.7")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD module for tensorQTL/1.0.7")
end

load('conda_R/4.1.x')
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/jhpce/core/conda/miniconda3-4.6.14/envs/svnR-4.1.x/R/4.1.x/lib64/R/lib")

-- Directly activate or deactivate the python virtual environment
execute {cmd="source /jhpce/shared/jhpce/libd/tensorqtl/1.0.7/tensorqtl_venv/bin/activate", modeA={"load"}}
execute {cmd="deactivate", modeA={"unload"}}
