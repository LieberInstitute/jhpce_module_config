help([[
This module loads RESEPT version 1.0.0 and python 3.7.3.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for resept/1.0.0")
LmodMessage("Note: python scripts must be run from the following working directory:")
LmodMessage("    /jhpce/shared/jhpce/libd/resept/1.0.0/RESEPT")

load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/resept/1.0.0/resept_venv/bin")
