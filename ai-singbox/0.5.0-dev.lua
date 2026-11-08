-- -*- lua -*-
-- vim:ft=lua:et:ts=4
--
-- shared test installation; use an explicit versioned program root

help([[
ai-singbox 0.5.0-dev: customizable Singularity container sandbox for AI agents.
Runs a shell or an AI agent (Codex, Claude Code, ...) on JHPCE with storage
mounted read-only. Writable: $MYSCRATCH, /tmp, a separate persistent session home
(your real home is not used), and the folders you choose (profile 'write =' lines
or --write). Start with: ai-singbox --help, and the README in the module folder.

  ai-singbox --help
  ai-singbox --dry-run --write /dcs04/lieber/<lab>/<project>/agent_out
]])

whatis("Name: ai-singbox")
whatis("Version: 0.5.0-dev")
whatis("Description: customizable Singularity container sandbox for AI agents")

-- Guard against an unset HOSTNAME (the site singularity/apptainer modulefiles
-- fail with a nil error in that case).
local host = os.getenv("HOSTNAME") or capture("hostname") or ""
if not string.match(host, "compute") and not string.match(host, "transfer") then
    LmodError("\
ai-singbox can only be loaded on a compute or transfer node. Use srun to get one.")
end

local root = "/jhpce/shared/libd/core/ai-singbox/0.5.0-dev"

if (mode() == "load") then
    LmodMessage("Loading ai-singbox/0.5.0-dev (mounted storage is read-only inside the sandbox)")
elseif (mode() == "unload") then
    LmodMessage("Unloading ai-singbox/0.5.0-dev")
end

prepend_path("PATH", pathJoin(root, "bin"))
setenv("AI_SINGBOX_ROOT", root)
setenv("AI_SINGBOX_RUNTIME", "/jhpce/shared/jhpce/core/singularity/3.11.4/bin/singularity")
