let $OPENAI_API_KEY=""

lua<<EOF
require("neoai").setup({
    selected_model_index = 0,
})
EOF
