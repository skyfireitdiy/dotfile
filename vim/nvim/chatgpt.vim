
nnoremap <silent><leader>cg :call chatgpt#Chat()<cr>

call chatgpt#AddConfig('<leader>cc', '请实现以下功能：%selected%')
call chatgpt#AddConfig('<leader>ca', '%selected%')
call chatgpt#AddConfig('<leader>cw', '编写以%selected%为题目的文章片段')
call chatgpt#AddConfig('<leader>c?', '什么是%selected%')
call chatgpt#AddConfig('<leader>ch', '如何%selected%')
