# Module files I use with LMOD


This repository houses a collection of module files I uses on daily basis.
These module files are written to run on macOS, modifications are needed to run them on Linux systems.
Hopefully it can help you with setting up LMOD on your own machine.


## Installing LMOD

On macOS, LMOD can be installed with [homebrew](https://brew.sh):

```bash
brew install lmod
```

Follow the instructions after installation is complete to source the setup script in the rc file of your shell.

## Install the modulefile repo

Clone the repository first:

```bash
git clone https://github.com/lyuwen/modulefiles.git
```

Then add the path of the repository to the `MODULEPATH` environment variable, for example with bash you can use the following command:

```bash
echo "export MODULEPATH=${PWD}/modulefiles:\$MODULEPATH" >> ~/.bash_profile
```
