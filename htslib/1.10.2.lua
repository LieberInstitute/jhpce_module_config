-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads htslib version 1.10.2.
]])

whatis("htslib")

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

LmodMessage("Loading LIBD SLURM module for htslib/1.10.2")
prepend_path("PATH", "/jhpce/shared/libd/core/htslib/1.10.2/bin")
prepend_path("MANPATH","/jhpce/shared/libd/core/htslib/1.10.2/share/man/man1")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib")
prepend_path("C_INCLUDE_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/include")
prepend_path("LIBRARY_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib")
prepend_path("PKG_CONFIG_PATH", "/jhpce/shared/libd/core/htslib/1.10.2/lib/pkgconfig")
