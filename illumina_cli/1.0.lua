help([[
This module loads 3 Illumina CLI tools: BaseSpace CLI v1.7.0, ICA CLI v2.48.0, and DRAGEN software mode 4.6.2.
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
-- The binary has dynamically resolved dependencies (at run time), so I can't
-- simply copy it to the above path to keep things organized and simple
prepend_path("PATH", "/jhpce/shared/libd/core/illumina_cli/1.0/dragen-softwaremode-4.6.2.el8.x86_64/bin")
