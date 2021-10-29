local help_message = [[
The python 3.9 arm64 Anaconda python environment.

You can modify this environment as follows:

  - Extend this environment locally

      $ pip install --user [package]

  - Create a new one of your own

      $ conda create -n [environment_name] [package]

]]

help(help_message,"\n")

whatis("Name: Anaconda Python 3.9 Arm64")
whatis("Version: 4.10.3-3.8")
whatis("Category: python conda")
whatis("Keywords: python conda")
whatis("Description: Python 3.9 arm64 Anaconda python environment")

family("conda")

load("conda_base/anaconda")
execute{cmd="conda activate py3_native", modeA={"load"}}

-- execute{cmd="conda deactivate", modeA={"unload"}}
