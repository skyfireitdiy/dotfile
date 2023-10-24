nnoremap <silent><leader>cg :call chatgpt#OutBufChat()<cr>
nnoremap <silent><leader>cL :call chatgpt#LoadSession()<cr>
nnoremap <silent><leader>cD :call chatgpt#DeleteSession()<cr>
nnoremap <silent><leader>cC :call chatgpt#CloseSession()<cr>
nnoremap <silent><leader>cO :call chatgpt#OpenWindow()<cr>
nnoremap <silent><leader>cT :call chatgpt#TruncSession()<cr>
nnoremap <silent><leader>cS :call chatgpt#SetConfigIndex()<cr>

nnoremap <silent><leader>ck :call chatgpt#InBufChat("\n[Do not output any content other than code snippets.]")<cr>

vnoremap <silent><leader>cg <ESC>:call chatgpt#OutBufChatVisual()<cr>
vnoremap <silent><leader>ck <ESC>:call chatgpt#InBufChatVisual("\n[Do not output any content other than code snippets.]")<cr>


call chatgpt#AddOutBufConfig('<leader>ce', '请解释以下代码：&')
call chatgpt#AddOutBufConfig('<leader>cd', '以下代码有什么问题吗：&')
call chatgpt#AddOutBufConfig('<leader>cpp', '请用c++实现以下功能：&')
call chatgpt#AddOutBufConfig('<leader>cgo', '请用go实现以下功能：&')
call chatgpt#AddOutBufConfig('<leader>cpy', '请用python实现以下功能：&')
call chatgpt#AddOutBufConfig('<leader>ca', '&')
call chatgpt#AddOutBufConfig('<leader>cw', '编写以“&”为题目的文章，以markdown格式输出')
call chatgpt#AddOutBufConfig('<leader>c?', '什么是&')
call chatgpt#AddOutBufConfig('<leader>ch', '如何&')


