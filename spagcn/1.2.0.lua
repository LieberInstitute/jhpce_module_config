help([[
This module loads SpaGCN 1.2.0 for python 3.7.3.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for spagcn/1.2.0")

load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/spagcn/1.2.0/spagcn_venv/bin")
