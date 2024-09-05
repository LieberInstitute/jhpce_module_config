help([[
This module loads GATK 4.5.0.0.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for gatk/4.5.0.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for gatk/4.5.0.0")
end

-- Directly activate or deactivate the conda environment
always_load("conda/3-23.3.1")
execute {cmd="conda activate /jhpce/shared/libd/core/gatk/4.5.0.0/gatk_env", modeA={"load"}}
execute {cmd="conda deactivate", modeA={"unload"}}

load("java/19")

-- For gatk binary itself
prepend_path('PATH', '/jhpce/shared/libd/core/gatk/4.5.0.0/gatk')

-- Don't try to depend on user-installed python packages
setenv("PYTHONNOUSERSITE", "anything")
