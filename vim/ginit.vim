GuiTabline 0
GuiPopupmenu 0
GuiFont HackGen35 Console for Powerline:h10:l

set cmdheight=2

function ToggleFullScreen()
    if g:GuiWindowFullScreen
        call GuiWindowFullScreen(0)
    else
        call GuiWindowFullScreen(1)
    endif
endfunction

command! ToggleFullScreen call ToggleFullScreen()
