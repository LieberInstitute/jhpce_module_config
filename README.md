# JHPCE module config

This repository contains the [Lmod module](https://lmod.readthedocs.io/) configuration files (`.lua`) for modules contributed to [JHPCE](http://www.jhpce.jhu.edu/) by members of the Data Science team lead by [Andrew E. Jaffe](http://aejaffe.com/) at the [Lieber Institute for Brain Development](https://www.libd.org/).

The source files are hosted in the [jhpce_mod_source](https://github.com/LieberInstitute/jhpce_mod_source) GitHub repository.

# Questions

If you have any questions, please send an email to the [JHPCE bithelp](mailto:bithelp@lists.johnshopkins.edu) mailing list.

# Usage

To use these modules, you have to tell [Lmod module](https://lmod.readthedocs.io/) where this files are listed with the `module use` command. Then you can run the `module avail` command to see all the list of modules.

```bash
module use /jhpce/shared/jhpce/modulefiles/libd
module avail
```

## Example

As an example, if we run `module avail` first we don't see the LIBD modules listed.

```bash
$ module avail
------------ /jhpce/shared/community/modulefiles/compiler/gcc/4.4.7 ------------
(output deleted)
------------------- /jhpce/shared/community/modulefiles/core -------------------
(output deleted)
--------------------- /jhpce/shared/jhpce/modulefiles/core ---------------------
(output deleted)
  Where:
   (D):  Default Module

Use "module spider" to find all possible modules.
Use "module keyword key1 key2 ..." to search for all possible modules matching
any of the "keys".
```

Then we run the commands listed above and we notice that we have a module for HISAT2 version 2.0.4 listed.

```bash
$ module use /jhpce/shared/jhpce/modulefiles/libd
$ module avail

--------------------- /jhpce/shared/jhpce/modulefiles/libd ---------------------
   README.md    hisat2/2.0.4
```

Without loading the module, we don't see HISAT2 on the `$PATH` environment variable.

```bash
$ which hisat2
/usr/bin/which: no hisat2 in (deleted output)
```

If we load the module, then we find HISAT2 in the `$PATH` and we can start using it.

```bash
$ module use /jhpce/shared/jhpce/modulefiles/libd
$ module load hisat2/2.0.4
$ which hisat2
/jhpce/shared/jhpce/libd/hisat2/2.0.4/hisat2-2.0.4/hisat2
$ hisat2 --version
/jhpce/shared/jhpce/libd/hisat2/2.0.4/hisat2-2.0.4/hisat2-align-s version 2.0.4
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
if [[ $HOSTNAME == compute-* ]]; then
    echo "Adding LIBD modules"
    module use /jhpce/shared/jhpce/modulefiles/libd
fi
```

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
cp /jhpce/shared/jhpce/modulefiles/core/git/2.17.0.lua hisat2/2.0.4.lua

## Or use the HISAT2 v2.0.4 module file for future use
cp /jhpce/shared/jhpce/modulefiles/libd/hisat2/2.0.4.lua your_software/your_version.lua
```

__Step 3.__ Edit the `.lua` file you just created and test it. As an example, check the [hisat2/2.0.4.lua](hisat2/2.0.4.lua) file.

__Step 4.__ Make sure that the permissions are set correctly at the end.

```bash
## Use 7 for group: so Emily and Leo can edit the files
chmod 775 -R hisat2
```


# Contributors

- [Leonardo Collado Torres](http://lcolladotor.github.io)
- [Emily E Burke](https://www.libd.org/team/emily-e-burke/)
- [Andrew E Jaffe](http://aejaffe.com/)

# JHPCE location

`/jhpce/shared/jhpce/modulefiles/libd`

Useful aliases for your `~/.bashrc` file:

```bash
## Creating modules
# https://lmod.readthedocs.io/en/latest/050_lua_modulefiles.html
alias modsrc="cd /jhpce/shared/jhpce/libd"
alias modlua="cd /jhpce/shared/jhpce/modulefiles/libd"
```
