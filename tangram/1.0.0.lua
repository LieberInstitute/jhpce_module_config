help([[
This module loads tangram 1.0.0 for python 3.8.5.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for tangram/1.0.0")

prepend_path("PATH", "/jhpce/shared/jhpce/libd/tangram/1.0.0/tangram_env/bin")
