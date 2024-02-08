help([[
This module loads the singularity image of CIBERSORTx/fractions (no defined version number)
]])

-- Check if the env var SLURMD_NODENAME exists to indirectly verify if a user
-- is on a compute or transfer node
node_name = os.getenv("SLURMD_NODENAME") or "undefined"
if (node_name == "undefined") then
    LmodError("This package can only be loaded on a compute or transfer node. Please use a SLURM command (srun, sbatch, salloc) to a compute or transfer node.")
end

if (mode() == "load") then
    LmodMessage("Loading LIBD SLURM module for cibersortx/04_04_2020\n")
    LmodMessage("Software is invoked by calling 'CIBERSORTxFractions'. It runs inside a")
    LmodMessage("Singularity container, which by default has the fastscratch space mounted")
    LmodMessage("(run 'echo $MYSCRATCH' to see the exact path), and therefore CIBERSORTx may only")
    LmodMessage("recognize input and output files under this directory.\n")
    LmodMessage("To mount custom paths or manually access the Singularity image directly, use")
    LmodMessage("    singularity exec /jhpce/shared/libd/core/cibersortx/04_04_2020/fractions_latest.sif /src/CIBERSORTxFractions")
elseif (mode() == "unload") then
    LmodMessage("Unloading LIBD SLURM module for cibersortx/04_04_2020")
end

load('singularity/3.11.4')

-- Define the full command required to invoke the software
image_path = '/jhpce/shared/libd/core/cibersortx/04_04_2020/fractions_latest.sif'
full_command = 'singularity exec -B ' ..
    os.getenv("MYSCRATCH") ..   -- mount $MYSCRATCH space to container
    ' ' .. image_path ..
    ' /src/CIBERSORTxFractions' -- command is in nonstandard location inside image

-- Run CIBERSORTx simply with the 'CIBERSORTxFractions' command, with $MYSCRATCH
-- monted by default
execute {cmd="alias CIBERSORTxFractions='" .. full_command .. "'", modeA={"load"}}
execute {cmd="unalias CIBERSORTxFractions", modeA={"unload"}}
