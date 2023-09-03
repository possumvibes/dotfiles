####################################################################### 
# Kakoune - Terminal Based Colour Scheme 
#######################################################################

# Based off of:
# - https://gitlab.com/fernzi/dotfiles/-/blob/master/kakoune/.config/kak/colors/termcolors.kak
# - https://github.com/caksoylar/kakoune-mysticaltutor
# - https://gitlab.com/protesilaos/tempus-themes-generator

# For code
face global value              bright-red 
face global type               magenta 
face global variable           blue 
face global module             bright-green 
face global function           bright-magenta 
face global string             cyan 
face global keyword            blue 
face global operator           blue 
face global attribute          cyan+i 
face global comment            white+i 
face global meta               magenta 
face global builtin            bright-magenta

# For markup
face global title              bright-blue+b 
face global header             blue+b 
face global bold               yellow+b 
face global italic             magenta+i 
face global mono               green 
face global block              cyan 
face global link               cyan+iu 
face global bullet             red
face global list               red 

# Builtin faces
face global Default            default,default 
face global PrimarySelection   white,default+rfg 
face global SecondarySelection default,default+rfg 
face global PrimaryCursor      blue,default+rfg 
face global SecondaryCursor    bright-blue,default+rfg 
face global PrimaryCursorEol   default,bright-white+rfg 
face global SecondaryCursorEol default,white+rfg 
face global LineNumbers        yellow@Default 
face global LineNumberCursor   +b@LineNumbers 
face global LineNumbersWrapped +b@LineNumbers 
face global MenuForeground     blue,default+b@MenuBackground
face global MenuBackground     default,bright-black@Default 
face global MenuInfo           +i 
face global Information        default,bright-black@Default
face global Error              red,default+r 
face global StatusLine         @Default 
face global StatusLineMode     green+b 
face global StatusLineInfo     magenta 
face global StatusLineValue    red 
face global StatusCursor       default,default+r 
face global Prompt             blue,black 
face global MatchingChar       white,black+b 
face global BufferPadding      black 
face global Whitespace         bright-black+f 
face global WrapColumn         default,black

### Language Server ###

face global DiagnosticError     red+u
face global DiagnosticWarning   yellow+u 
face global LineFlagErrors      red+d 

