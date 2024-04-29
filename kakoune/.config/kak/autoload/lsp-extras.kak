# requires kak-lsp.
#

define-command lsp-init %{
	# enable LSP for the window
    lsp-enable-window
    lsp-auto-hover-buffer-enable

	# Map the lsp-specific bindings only if we're LSP'd
    map window user d ':lsp-diagnostics<ret>'           -docstring "LSP diagnostics"
    map global user k ':show_lsp_hover_info<ret>'       -docstring 'show LSP docs for selection' 
    map global user l ':enter-user-mode lsp<ret>'       -docstring 'enter LSP mode'
    map global user m ':lsp-goto-document-symbol<ret>'  -docstring 'LSP: open document symbol picker' 
    map global user M ':lsp-workspace-symbol-incr<ret>' -docstring 'LSP: open workspace symbol picker'

    map global insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

    set-option window lsp_diagnostic_line_error_sign "!"
    set-option window lsp_diagnostic_line_warning_sign "?"
    set-face window  DiagnosticError default+u
    set-face window  DiagnosticWarning default+u
} -docstring "initialize lsp for window with basic bindings and settings"

# Objects
map global object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
map global object e '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
map global object k '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
map global object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
map global object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

