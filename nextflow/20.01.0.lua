-- -*- lua -*-
-- vim:ft=lua:et:ts=4

help([[
This module loads nextflow version 20.01.0 (build 5264).
]])

whatis("Nextflow")

if not string.match(os.getenv("HOSTNAME"),"compute") and not  string.match(os.getenv("HOSTNAME"),"transfer") then  
    LmodError("\
This package can only be loaded on a compute or transfer node. Please use qrsh to connect to a valid compute or transfer node.")
end

LmodMessage("Loading LIBD module for nextflow/20.01.0")
LmodMessage('## To deal with running nextflow without requesting much more memory check https://jhpce.jhu.edu/question/why-do-i-get-memory-errors-when-running-java/. You might want to use something like: export _JAVA_OPTIONS="-Xms5g -Xmx6g"')
prepend_path("PATH", "/jhpce/shared/jhpce/libd/nextflow/20.01.0")
