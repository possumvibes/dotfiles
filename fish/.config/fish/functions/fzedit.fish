function fzedit --description 'fuzzy list files to edit with kak'
fd -t f | fzf --multi --bind 'enter:become(kak {+})'
end
