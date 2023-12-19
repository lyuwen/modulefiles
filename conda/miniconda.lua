local help_message = [[
The python 3.10.10 arm64 Miniconda python environment.

You can modify this environment as follows:

  - Extend this environment locally

      $ pip install --user [package]

  - Create a new one of your own

      $ conda create -n [environment_name] [package]

]]

help(help_message,"\n")

whatis("Name: Miniconda Python 3.10.10 arm64")
whatis("Version: 23.3.1-3.10")
whatis("Category: python conda")
whatis("Keywords: python conda")
whatis("Description: Python 3.10 arm64 Miniconda python environment")

family("conda")

load("conda_base/miniconda")
execute{cmd="conda activate", modeA={"load"}}

-- execute{cmd="conda deactivate", modeA={"unload"}}
