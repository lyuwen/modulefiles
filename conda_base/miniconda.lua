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

-- local conda_dir = "/opt/conda"
-- local funcs = "conda __conda_activate __conda_hashr __conda_reactivate __conda_exe"
--
-- pushenv("CONDA_ENVS_PATH", conda_dir .. "envs")
-- pushenv("CONDA_PKGS_DIRS", conda_dir .. "pkgs")
--
-- execute{cmd="source " .. conda_dir .. "/etc/profile.d/conda.sh; export -f " .. funcs, modeA={"load"}}
--
-- execute{cmd="for i in $(seq ${CONDA_SHLVL:=0}); do conda deactivate; done; pre=" .. conda_dir .. "; \
--   export LD_LIBRARY_PATH=$(echo ${LD_LIBRARY_PATH} | tr ':' '\\n' | /usr/bin/grep . | /usr/bin/grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
--   export PATH=$(echo ${PATH} | tr ':' '\\n' | /usr/bin/grep . | /usr/bin/grep -v $pre | tr '\\n' ':' | sed 's/:$//'); \
--         unset -f " .. funcs .. "; \
--   unset $(env | /usr/bin/grep -o \"[^=]*CONDA[^=]*\" | /usr/bin/grep -v 'CONDA_ENVS_PATH\\|CONDA_PKGS_DIRS');", modeA={"unload"}}
--
family("conda_base")

setenv("CONDA_EXE","/opt/conda/bin/conda")
setenv("CONDA_PYTHON_EXE","/opt/conda/bin/python")
setenv("CONDA_SHLVL","0")
prepend_path("PATH","/opt/conda/condabin")
setenv("_CE_CONDA","")
setenv("_CE_M","")
set_shell_function("__conda_activate"," \
    if [ -n \"${CONDA_PS1_BACKUP:+x}\" ]; then\
        PS1=\"$CONDA_PS1_BACKUP\";\
        \\unset CONDA_PS1_BACKUP;\
    fi;\
    \\local ask_conda;\
    ask_conda=\"$(PS1=\"${PS1:-}\" __conda_exe shell.posix \"$@\")\" || \\return;\
    \\eval \"$ask_conda\";\
    __conda_hashr\
","")
set_shell_function("__conda_exe"," \
    ( \"$CONDA_EXE\" $_CE_M $_CE_CONDA \"$@\" )\
","")
set_shell_function("__conda_hashr"," \
    if [ -n \"${ZSH_VERSION:+x}\" ]; then\
        \\rehash;\
    else\
        if [ -n \"${POSH_VERSION:+x}\" ]; then\
            :;\
        else\
            \\hash -r;\
        fi;\
    fi\
","")
set_shell_function("__conda_reactivate"," \
    \\local ask_conda;\
    ask_conda=\"$(PS1=\"${PS1:-}\" __conda_exe shell.posix reactivate)\" || \\return;\
    \\eval \"$ask_conda\";\
    __conda_hashr\
","")
set_shell_function("conda"," \
    \\local cmd=\"${1-__missing__}\";\
    case \"$cmd\" in \
        activate | deactivate)\
            __conda_activate \"$@\"\
        ;;\
        install | update | upgrade | remove | uninstall)\
            __conda_exe \"$@\" || \\return;\
            __conda_reactivate\
        ;;\
        *)\
            __conda_exe \"$@\"\
        ;;\
    esac\
","")
