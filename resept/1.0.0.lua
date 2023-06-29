help([[
This module loads RESEPT version 1.0.0 and python 3.7.3.
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for resept/1.0.0")
LmodMessage("Note: python scripts should be invoked using 'which':")
LmodMessage("    'python $(which RGB_images_pipeline.py)', rather than:")
LmodMessage("    'python RGB_images_pipeline.py'.")

load('python/3.7.3')
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/RESEPT/scGNNsp_space")
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/RESEPT")
prepend_path("PATH", "/jhpce/shared/libd/core/resept/1.0.0/resept_venv/bin")
