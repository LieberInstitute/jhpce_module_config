-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads fusion_twas (GitHub commit e1ba5f7).
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for fusion_twas/github")
    LmodMessage("This module does not come with R dependencies; check http://gusevlab.org/projects/fusion/#installation to install any required packages for your user.")
    LmodMessage("Invoke R scripts as in this example: 'Rscript $(which FUSION.compute_weights.R) --help'")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for fusion_twas/github")
end

load('plink/1.90b')
prepend_path("PATH", "/jhpce/shared/libd/core/fusion_twas/github/fusion_twas-master")
