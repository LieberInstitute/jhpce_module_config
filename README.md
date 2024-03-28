# JHPCE module config

This repository contains the [Lmod module](https://lmod.readthedocs.io/) configuration files (`.lua`) for modules contributed to [JHPCE](https://jhpce.jhu.edu/) mostly by members of the [R/Bioconductor-powered Team Data Science](https://lcolladotor.github.io) at the [Lieber Institute for Brain Development](https://www.libd.org/). Though other people from LIBD can contribute to these modules and request to be added to the `lieber_modules` user group. 

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
   hisat2/2.2.1
```

Without loading the module, we don't see HISAT2 on the `$PATH` environment variable.

```bash
$ which hisat2
/usr/bin/which: no hisat2 in (deleted output)
```

If we load the module, then we find HISAT2 in the `$PATH` and we can start using it.

```bash
$ module use /jhpce/shared/libd/modulefiles
$ module load hisat2/2.2.1
$ which hisat2
/jhpce/shared/libd/core/hisat2/2.2.1/hisat2-2.2.1/hisat2
$ hisat2 --version
/jhpce/shared/libd/core/hisat2/2.2.1/hisat2-2.2.1/hisat2-align-s version 2.2.1
64-bit
Built on compute-094.cm.cluster
Thu Jun 29 02:28:02 PM EDT 2023
Compiler: gcc version 11.3.1 20221121 (Red Hat 11.3.1-4) (GCC) 
Options: -O3 -m64 -msse2 -funroll-loops -g3 -DPOPCNT_CAPABILITY -std=c++11
Sizeof {int, long, long long, void*, size_t, off_t}: {4, 8, 8, 8, 8, 8}
```

## Recurrent usage

If you want to always include our modules, you can edit your `.bashrc` file and add the following lines:

```bash
## List the LIBD modules by default when inside srun/sbatch
if [[ $HOSTNAME == compute-* ]] || [[ $HOSTNAME == transfer-* ]]; then
    echo "Adding LIBD modules"
    module use /jhpce/shared/libd/modulefiles
fi
```

Be cautious about `export` statements in your `.bashrc`! In particular, setting variables like `PATH`, `R_HOME`, `LD_LIBRARY_PATH`, and other path-related environment variables can interfere with the functioning of modules or cause other issues that other users won't be able to replicate!

# Create a new module

__Step 1.__ Create a directory in lowercase with the name of the source you are installing. In this example, we are creating a module for [`HISAT2`](https://daehwankimlab.github.io/hisat2/) version [2.2.1](https://github.com/DaehwanKimLab/hisat2/archive/refs/tags/v2.2.1.tar.gz) that was installed at [jhpce_module_source/tree/SLURM/hisat2/2.2.1](https://github.com/LieberInstitute/jhpce_module_source/tree/SLURM/hisat2/2.2.1).

```bash
mkdir hisat2
```

__Step 2.__ Create a [`.lua`](https://lmod.readthedocs.io/en/latest/050_lua_modulefiles.html) configuration file with the version number of the software you are installing. In this example, that would be `2.2.1.lua`.

```bash
touch hisat2/2.2.1.lua
```

To jump start this process, you can simply copy one of the existing `.lua` files. For example, you could copy the `.lua` file for the ` hisat2/2.2.1` module.

```bash
## You could use the HISAT2 v2.0.4 module file for future use
cp /jhpce/shared/libd/modulefiles/hisat2/2.2.1.lua your_software/your_version.lua
```

__Step 3.__ Edit the `.lua` file you just created and test it. As an example, check the [hisat2/2.2.1.lua](hisat2/2.2.1.lua) file.

__Step 4.__ Make sure that the permissions are set correctly at the end.

```bash
## Use 7 for group: so Nick and Leo can edit the files
chmod 775 -R hisat2
```

# `lieber_modules` membership rules

To be added to `lieber_modules` JHPCE user group you have to agree to:

1. Be subscribed to the `bithelp` mailing list.
1. Respond to questions from users who have questions about modules you contributed.
1. Be willing to create modules for new versions of the software or help advice new maintainers if you are passing down the torch to someone new.

If you do not agree to these rules, worry not! We will still gladly train and guide you to make your own private modules with files hosted elsewhere. Please sign up for a [Data Science guidance session](https://lcolladotor.github.io/bioc_team_ds/data-science-guidance-sessions.html) with Nick Eagles after having watched the relevant `module`-related videos from the [LIBD rstats club - JHPCE playlist](https://www.youtube.com/watch?v=mWYDMp0jp8Q&list=PLNNI62fcZPdAslHFllqv0-2iZqby1h0CV).

As noted by Mark Miller from JHPCE BitSupport, using shared modules has some advantages, such as:

> * It prevents duplication of effort, where 2 people on 2 different teams need the same software and build the same duplicate module.
> * It allows for the effort put into building the module to be used and appreciated by others.
> * Having a module used by more people will help to encourage the maintainer to keep the module up to date.
> * We do have the annual JHPCE High Achiever award that has been awarded to those that have contributed modules. 😊

To be added to `lieber_modules`, please send an email to BitHelp mentioning that you agree to the rules stated above and cc Leonardo Collado Torres.

Welcome to the club! We are glad to have you! 🙌🏽

PS This whole process is inspired by the rules you have to agree to when submitting an [R package to Bioconductor](https://github.com/Bioconductor/Contributions/issues/new/choose).

# Contributors

## Current

- [Nick Eagles](https://nick-eagles.github.io/)
- [Leonardo Collado Torres](http://lcolladotor.github.io)
- [Geo Pertea](https://github.com/gpertea)
- [Ryan Miller](https://github.com/RyAMiller)

## Former

- [Emily E Burke](https://github.com/emilyburke)
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
