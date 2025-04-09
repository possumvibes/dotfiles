# LSP integration: kakoune-lsp
# https://github.com/kakoune-lsp/kakoune-lsp
# 
# Setup and configuration at the kakoune session scope.
# Enables kak-lsp and defines non-default server configurations.
# 

# Enable kak-lsp once per session

eval %sh{kak-lsp}


# Define new servers and additional configurations in hooks

hook -group lsp-filetype-csharp global BufSetOption filetype=csharp %{
    set-option buffer lsp_servers %{
        [OmniSharp]
        root_globs = ["sln", ".git"]
        command = "OmniSharp"
        args = ["--languageserver"]
    }
}
