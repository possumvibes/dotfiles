# Extends basic markdown syntax highlighting for improved visual clarity
 
# Initialization
# --------------

# Regexes, for use elsewhere as needed
# ------------------------------------ 

# declare-option -hidden str markdown_link_regex   '[^\]](\[([^\[\n]+)\])(\[[^\]\n]+\]|\([^\)\n]+\))'
# declare-option -hidden str markdown_anchor_regex '[^\]](\[([^\[\n]+)\])[^\[\(:]'
# declare-option -hidden str markdown_reflink_regex '\[[^\n]+\]: [^\n]*\n'

# Highlighters
# ------------

add-highlighter shared/markdown-extended group

# Links: highlight text and treat all else as comment
# 
# [linktext](link) and [linktext][ref] links
add-highlighter shared/markdown-extended/link regex '[^\]](\[([^\[\n]+)\])(\[[^\]\n]+\]|\([^\)\n]+\))' \
  1:comment 2:link 3:comment

# [linktext] style anchors
add-highlighter shared/markdown-extended/reflink regex '[^\]](\[([^\[\n]+)\])[^\[\(:]' 1:comment 2:value

# [ref]: links
add-highlighter shared/markdown-extended/reflinkdesc regex '\[[^\n]+\]: [^\n]*\n' 0:comment


# Misc.
# 
# apply comment face to entire block quote
add-highlighter shared/markdown-extended/blockquote regex ^\h*(>[^\n]*)+ 0:comment

# lists: highlight all bullets and numbers
add-highlighter shared/markdown-extended/unordered-list regex ^\h*([-+*])\s 1:bullet
add-highlighter shared/markdown-extended/ordered-list   regex ^\h*(\d+[.)])\s 1:list


## And apply them on markdown files!
hook global WinSetOption filetype=markdown %{
  add-highlighter window/markdown-extended ref markdown-extended
  hook -once -always window WinSetOption filetype=.* %{ remove-hooks window markdown-extended-.+ }
}

