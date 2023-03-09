
nnoremap <silent><leader>cg :call chatgpt#Chat()<cr>
nnoremap <silent><leader>cN :call chatgpt#LoadSession()<cr>
nnoremap <silent><leader>cD :call chatgpt#DeleteSession()<cr>
nnoremap <silent><leader>cS :call chatgpt#OpenWindow()<cr>

call chatgpt#AddConfig('<leader>ce', '请解释以下代码：&')
call chatgpt#AddConfig('<leader>cd', '以下代码有什么问题吗：&')
call chatgpt#AddConfig('<leader>cpp', '请用c++实现以下功能：&')
call chatgpt#AddConfig('<leader>cgo', '请用go实现以下功能：&')
call chatgpt#AddConfig('<leader>cpy', '请用python实现以下功能：&')
call chatgpt#AddConfig('<leader>ca', '&')
call chatgpt#AddConfig('<leader>cw', '编写以“&”为题目的文章，以markdown格式输出')
call chatgpt#AddConfig('<leader>c?', '什么是&')
call chatgpt#AddConfig('<leader>ch', '如何&')
