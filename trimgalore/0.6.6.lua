help([[
This module loads Trim Galore version 0.6.6 (cutadapt version 3.4).
]])

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for trimgalore/0.6.6")

load('fastqc/0.11.8')
prepend_path("PYTHONPATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/cutadapt/bin/lib/python3.7/site-packages")
prepend_path("PATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/cutadapt/bin/bin")
prepend_path("PATH", "/jhpce/shared/libd/core/trimgalore/0.6.6/TrimGalore-0.6.6")
