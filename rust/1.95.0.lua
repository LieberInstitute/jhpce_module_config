help([[
This module loads binaries associated with Rust 1.95.0.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use srun to connect to a valid compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for rust/1.95.0")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for rust/1.95.0")
end

prepend_path("PATH", "/jhpce/shared/libd/core/rust/1.95.0/bin")
prepend_path("LD_LIBRARY_PATH", "/jhpce/shared/libd/core/rust/1.95.0/lib")
