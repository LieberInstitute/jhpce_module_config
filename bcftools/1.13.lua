-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads BCFTools version 1.13, including the additional 'gtc2vcf' and 'affy2vcf' plugins.
]])

whatis("BCFTools")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD module for BCFTools/1.13")
prepend_path("PATH", "/jhpce/shared/libd/core/bcftools/1.13/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/bcftools/1.13/share/man/man1")
setenv("BCFTOOLS_PLUGINS", "/jhpce/shared/libd/core/bcftools/1.13/bcftools-1.13/plugins")
