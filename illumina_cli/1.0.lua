help([[
This module loads 2 Illumina CLI tools: BaseSpace CLI v1.7.0 and ICA CLI v2.48.0
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for illumina_cli/1.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for illumina_cli/1.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/illumina_cli/1.0/bin")
