# Window-level LSP behavior and configuration
# https://github.com/kakoune-lsp/kakoune-lsp
#
# Defines my default bindings, objects, faces, and preferred behaviors.

define-command lsp-init -docstring "initialize lsp for window with basic bindings and settings" %{

  	# Enable LSP within the context of the window only.
    lsp-enable-window

    # Enable auto-hover in a dedicated *hover* buffer, displayed in docsclient.
    lsp-auto-hover-buffer-enable

    # Define LSP Objects
    map window object a '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map window object <a-a> '<a-semicolon>lsp-object<ret>' -docstring 'LSP any symbol'
    map window object e '<a-semicolon>lsp-object Function Method<ret>' -docstring 'LSP function or method'
    map window object k '<a-semicolon>lsp-object Class Interface Struct<ret>' -docstring 'LSP class interface or struct'
    map window object d '<a-semicolon>lsp-diagnostic-object --include-warnings<ret>' -docstring 'LSP errors and warnings'
    map window object D '<a-semicolon>lsp-diagnostic-object<ret>' -docstring 'LSP errors'

  	# LSP usermode key mappings
    map window user d ':lsp-diagnostics<ret>'           -docstring "LSP diagnostics"
    map window user k ':show_lsp_hover_info<ret>'       -docstring 'show LSP docs for selection' 
    map window user l ':enter-user-mode lsp<ret>'       -docstring 'enter LSP mode'
    map window user m ':lsp-goto-document-symbol<ret>'  -docstring 'LSP: open document symbol picker' 
    map window user M ':lsp-workspace-symbol-incr<ret>' -docstring 'LSP: open workspace symbol picker'

    # LSP insert mode key mappings 
    map window insert <tab> '<a-;>:try lsp-snippets-select-next-placeholders catch %{ execute-keys -with-hooks <lt>tab> }<ret>' -docstring 'Select next snippet placeholder'

    # LSP faces
    set-option window lsp_diagnostic_line_error_sign "!"
    set-option window lsp_diagnostic_line_warning_sign "?"
    set-face window  DiagnosticError default+u
    set-face window  DiagnosticWarning default+u
} 


