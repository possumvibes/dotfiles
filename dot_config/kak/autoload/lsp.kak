# requires kak-lsp.
#


# LSP convenience commands
define-command enter_lsp_mode %{
  enter-user-mode lsp
}

define-command show_lsp_hover_info %{
  lsp-hover
}

define-command open_document_symbol_picker %{
  lsp-goto-document-symbol
}

define-command open_workspace_symbol_picker %{
  lsp-workspace-symbol-incr
}

define-command -hidden select_next_snippet_placeholder %{
  
}

# Objects
map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object e '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object k '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

# Mappings
map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'
