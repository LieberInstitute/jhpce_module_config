help([==[

Description
===========
Java Platform, Standard Edition (Java SE) lets you develop and deploy
 Java applications on desktops and servers.


More information
================
 - Homepage: http://openjdk.java.net
]==])

whatis([==[Description: Java Platform, Standard Edition (Java SE) lets you develop and deploy
 Java applications on desktops and servers.]==])
whatis([==[Homepage: http://openjdk.java.net]==])
whatis([==[URL: http://openjdk.java.net]==])

local root = "/jhpce/shared/libd/core/java/18"

prepend_path("CMAKE_PREFIX_PATH", root)
prepend_path("CPATH", pathJoin(root, "include"))
prepend_path("LD_LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("LIBRARY_PATH", pathJoin(root, "lib"))
prepend_path("CFLAGS", pathJoin(root, "include"))
prepend_path("CPPLAGS", pathJoin(root, "include"))
prepend_path("PATH", pathJoin(root, "bin"))
setenv("EBROOTJAVA", root)

prepend_path("PATH", root)
setenv("JAVA_HOME", "/jhpce/shared/libd/core/java/18")
