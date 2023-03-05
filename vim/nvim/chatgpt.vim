
nnoremap <silent><leader>cg :call chatgpt#Chat()<cr>

call chatgpt#AddConfig('<leader>ce', "请解释一下以下代码的含义：\\n%selected%")
call chatgpt#AddConfig('<leader>cd', "以下代码有什么问题吗：\\n%selected%")
call chatgpt#AddConfig('<leader>cpp', '请用c++实现以下功能：%selected%')
call chatgpt#AddConfig('<leader>cgo', '请用go实现以下功能：%selected%')
call chatgpt#AddConfig('<leader>cpy', '请用python实现以下功能：%selected%')
call chatgpt#AddConfig('<leader>ca', '%selected%')
call chatgpt#AddConfig('<leader>cw', '编写以%selected%为题目的文章片段')
call chatgpt#AddConfig('<leader>c?', '什么是%selected%')
call chatgpt#AddConfig('<leader>ch', '如何%selected%')
