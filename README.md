
# Intro
Linux Setup for nvim!

Not so minimalist config for a vim setup :).

# Dependencies
FZF - just install and add it to your path

# Installation

1. Install nvim.
2. Add "~/.config/nvim/init.vim"
3. Install vimplug by running

```
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```
or yknow, just have a look at: https://github.com/junegunn/vim-plug#installation

4. Verify that it works by adding to your init.vim:

```
call plug#begin()
call plug#end()
```

And then typing:
```
:PlugStatus
```

if you don't get an error then all is good.

# Installing Plugins and first time install
1. run:
```
:PlugInstall
```
While inside vim

# Plugin specific install
## FZF
Currently FZF needs to be installed at ~/.fzf. (Or maybe adding to path is enough...I haven't tested this)

## Coc and Coc-clangd
1. Coc-cland needs nodejs as a dependency

If this doesn't work, install clangd manually and add it to your path:
https://github.com/llvm/llvm-project

5. coc-clangd requires a json compilation database (https://clang.llvm.org/docs/JSONCompilationDatabase.html)

You can generate that in CMake by adding:
```
cmake -DCMAKE_EXPORT_COMPILE_COMMANDS=ON
```
Note: Only works in cmake >= 2.8.5 AND on unix makefile and ninja generators

In order to get this in MSVC, you need to install Clang Power Tools (https://clangpowertools.com/blog/generate-json-compilation-database.html), and use it to export a compilation database.

## Coc and Rust
# Debugging in rust
1. You need to add .vimspector.json to your project root dir
2. Then you need to add the following:
```
{
  "configurations": {
    "Rust - lldb": {
      "adapter": "CodeLLDB",
      "configuration": {
        "request": "launch",
        "program": "${workspaceRoot}/target/debug/%YOUR_PROJECT_NAME_HERE%",
		"sourceLanguages": ["rust"]
      },
	  "breakpoints": {
		  "exception": {
		  "cpp_throw": "Y",
		  "cpp_catch": "N"
		  }
	  }
    }
  }
}
```

3. Add debug configs to your cargo.TOML
```
[profile.dev]
opt-level = 0
debug = true

[profile.release]
opt-level = 3
debug = false
```
