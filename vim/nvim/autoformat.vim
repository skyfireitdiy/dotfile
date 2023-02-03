augroup autoformat
autocmd!
autocmd BufWritePre *.cpp,*.c,*.go,*.h,*.rs,*.json,*.yaml,dockerfile,makefile,CMakeLists.txt,*.py :Autoformat
augroup END


