local help_message = [[
The base Anaconda python environment.

You can modify this environment as follows:

  - Extend this environment locally

      $ pip install --user [package]

  - Create a new one of your own

      $ conda create -n [environment_name] [package]

]]

help(help_message,"\n")

whatis("Name: conda")
whatis("Version: 4.10.3")
whatis("Category: python conda")
whatis("Keywords: python conda")
whatis("Description: Base Anaconda python environment")

local conda_dir = os.getenv("HOME") .. "/anaconda3"
local funcs = "conda __conda_activate __conda_hashr __conda_reactivate __add_sys_prefix_to_path __conda_exe"

pushenv("CONDA_ENVS_PATH", conda_dir .. "envs")
pushenv("CONDA_PKGS_DIRS", conda_dir .. "pkgs")

execute{cmd="source " .. conda_dir .. "/etc/profile.d/conda.sh; export -f " .. funcs, modeA={"load"}}

execute{cmd="for i in $(seq ${CONDA_SHLVL:=0}); do conda deactivate; done; pre=" .. conda_dir .. "; \
	export LD_LIBRARY_PATH=$(echo ${LD_LIBRARY_PATH} | tr ':' '\\n' | /usr/bin/grep . | /usr/bin/grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
	export PATH=$(echo ${PATH} | tr ':' '\\n' | /usr/bin/grep . | /usr/bin/grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
        unset -f " .. funcs .. "; \
	unset $(env | /usr/bin/grep -o \"[^=]*CONDA[^=]*\" | /usr/bin/grep -v 'CONDA_ENVS_PATH\\|CONDA_PKGS_DIRS');", modeA={"unload"}}

family("conda_base")
