# JHPCE module config

This repository contains the [Lmod module](https://lmod.readthedocs.io/) configuration files (`.lua`) for modules contributed to [JHPCE](http://www.jhpce.jhu.edu/) by members of the [R/Bioconductor-powered Team Data Science](https://lcolladotor.github.io)  at the [Lieber Institute for Brain Development](https://www.libd.org/).

The source files are hosted in the [jhpce_module_source](https://github.com/LieberInstitute/jhpce_module_source) GitHub repository.

# Questions

If you have any questions, please send an email to the [JHPCE bithelp](mailto:bithelp@lists.johnshopkins.edu) mailing list.

# Usage

To use these modules, you have to tell [Lmod module](https://lmod.readthedocs.io/) where this files are listed with the `module use` command. Then you can run the `module avail` command to see all the list of modules.

```bash
module use /jhpce/shared/libd/core
module avail
```

## Example

As an example, if we run `module avail` first we don't see the LIBD modules listed.

```bash
$ module avail
--------------------------------- /jhpce/shared/jhpce/modulefiles --------------
(output deleted)

  Where:
   L:  Module is loaded

If the avail list is too long consider trying:

"module --default avail" or "ml -d av" to just list the default modules.
"module overview" or "ml ov" to display the number of modules for each name.

Use "module spider" to find all possible modules and extensions.
Use "module keyword key1 key2 ..." to search for all possible modules matching any of the "keys".
```

Then we run the commands listed above and we notice that we have a module for HISAT2 version 2.0.4 listed.

```bash
$ module use /jhpce/shared/libd/modulefiles
$ module avail

--------------------- /jhpce/shared/libd/modulefiles ---------------------------
   hisat2/2.0.4
```

Without loading the module, we don't see HISAT2 on the `$PATH` environment variable.

```bash
$ which hisat2
/usr/bin/which: no hisat2 in (deleted output)
```

If we load the module, then we find HISAT2 in the `$PATH` and we can start using it.

```bash
$ module use /jhpce/shared/libd/modulefiles
$ module load hisat2/2.0.4
$ which hisat2
/jhpce/shared/libd/core/hisat2/2.0.4/hisat2-2.0.4/hisat2
$ hisat2 --version
/jhpce/shared/libd/core/hisat2/2.0.4/hisat2-2.0.4/hisat2-align-s version 2.0.4
64-bit
Built on igm3
Wed May 18 11:37:42 EDT 2016
Compiler: gcc version 4.5.4 (GCC)
Options: -O3 -m64 -msse2 -funroll-loops -g3 -DPOPCNT_CAPABILITY
Sizeof {int, long, long long, void*, size_t, off_t}: {4, 8, 8, 8, 8, 8}
```

## Recurrent usage

If you want to always include our modules, you can edit your `.bashrc` file and add the following lines:

```bash
## List the LIBD modules by default when inside qrsh/qsub
if [[ $HOSTNAME == compute-* ]] || [[ $HOSTNAME == transfer-* ]]; then
    echo "Adding LIBD modules"
    module use /jhpce/shared/libd/modulefiles
fi
```

Be cautious about `export` statements in your `.bashrc`! In particular, setting variables like `PATH`, `R_HOME`, `LD_LIBRARY_PATH`, and other path-related environment variables can interfere with the functioning of modules or cause other issues that other users won't be able to replicate!

# Create a new module

__Step 1.__ Create a directory in lowercase with the name of the source you are installing. In this example, we are creating a module for [`HISAT2`](https://ccb.jhu.edu/software/hisat2/index.shtml) version [2.0.4](ftp://ftp.ccb.jhu.edu/pub/infphilo/hisat2/downloads/hisat2-2.0.4-Linux_x86_64.zip) that was installed at []().

```bash
mkdir hisat2
```

__Step 2.__ Create a [`.lua`](https://lmod.readthedocs.io/en/latest/050_lua_modulefiles.html) configuration file with the version number of the software you are installing. In this example, that would be `2.0.4.lua`.

```bash
touch hisat2/2.0.4.lua
```

To jump start this process, you can simply copy one of the existing `.lua` files. For example, here we'll copy the `.lua` file for the `git/2.17.0` module.

```bash
cp /jhpce/shared/libd/modulefiles/git/2.17.0.lua hisat2/2.0.4.lua

## Or use the HISAT2 v2.0.4 module file for future use
cp /jhpce/shared/libd/modulefiles/hisat2/2.0.4.lua your_software/your_version.lua
```

__Step 3.__ Edit the `.lua` file you just created and test it. As an example, check the [hisat2/2.0.4.lua](hisat2/2.0.4.lua) file.

__Step 4.__ Make sure that the permissions are set correctly at the end.

```bash
## Use 7 for group: so Nick and Leo can edit the files
chmod 775 -R hisat2
```


# Contributors

## Current

- [Nick Eagles](https://nick-eagles.github.io/)
- [Leonardo Collado Torres](http://lcolladotor.github.io)

## Former

- [Emily E Burke](https://www.libd.org/team/emily-e-burke/)
- [Andrew E Jaffe](http://aejaffe.com/)

# JHPCE location

`/jhpce/shared/libd/modulefiles`

Useful aliases for your `~/.bashrc` file:

```bash
## Creating modules
# https://lmod.readthedocs.io/en/latest/050_lua_modulefiles.html
alias modsrc="cd /jhpce/shared/libd/core"
alias modlua="cd /jhpce/shared/libd/modulefiles"
```
