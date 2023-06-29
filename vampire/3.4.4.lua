help([[
This module loads VAMPIRE version 3.4.4 and python 3.6.9.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for vampire/3.4.4")

load('python/3.6.9')
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/vampire/3.4.4/vampire/bin/lib/python3.6/site-packages")
prepend_path("PATH", "/jhpce/shared/libd/core/vampire/3.4.4/vampire/bin/bin")
