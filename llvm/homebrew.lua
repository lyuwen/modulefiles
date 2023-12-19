help([[
LLVM from Homebrew
]])
conflict("llvm")
whatis("Name: LLVM")
whatis("Keywords: llvm")
whatis("Description: LLVM from Homebrew.")

prepend_path("PATH", "/opt/homebrew/opt/llvm/bin:$PATH")

pushenv("LDFLAGS", "-L/opt/homebrew/opt/llvm/lib -L/opt/homebrew/opt/llvm/lib/c++ -Wl,-rpath,/opt/homebrew/opt/llvm/lib/c++")
pushenv("CPPFLAGS", "-I/opt/homebrew/opt/llvm/include")
