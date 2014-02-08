    set romsize 8kSC
    set kernel_options no_blank_lines
    set tv ntsc

    const pfres = 24

    const LAST_ROW = 24

    dim block0x = b
    dim block0y = a
    

    ;better random number generator
    dim rand16 = r

_Game_Init

    pfclear
    COLUPF = 158
 
    scorecolor = 14

    player0x = 49
    player0y = 75
   

    player0:
    %11000011
    %11000011
    %01100110
    %01111110
    %00111100
    %00111100
    %00011000
    %00011000


    block0x = 11
    block0y = 0
end

_Main_Loop

    COLUP0 = $40

    if block0y < LAST_ROW then pfpixel block0x block0y on: t = block0y - 1: pfpixel block0x t off : block0y = block0y + 1
    if block0y = LAST_ROW then block0x = rand / 8 : block0y = 0 : score = score+1

    gosub playerMovement

    drawscreen
    goto _Main_Loop 


playerMovement
 rem WALL BARRIER
 if player0x < 22 then player0x = 22
 if player0x > 133 then player0x = 133
 
 rem PLAYER0 MOVEMENT
 if joy0left then player0x = player0x - 1
 if joy0right then player0x = player0x + 1
 
 return