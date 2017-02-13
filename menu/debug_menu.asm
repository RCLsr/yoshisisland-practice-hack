; handle initialization of debug menu
init_debug_menu:
    SEP #$30

    ; turn screen off
    LDA #$80
    STA !reg_inidisp

    ; turn HDMA off
    STZ !reg_hdmaen
    STZ $094A

    ; mode 0, 8x8
    STZ !reg_bgmode

    ; scroll 0 (write twice)
    STZ $39
    STZ $3A
    STZ $3B
    STZ $3C
    STZ !reg_bg1hofs
    STZ !reg_bg1hofs
    STZ !reg_bg1vofs
    STZ !reg_bg1vofs

    ; BG1 tilemap 6400
    LDA #$64
    STA !reg_bg1sc

    ; BG1 character 6000
    LDA #$06
    STA !reg_bg12nba

    ; turn on BG1, everything else off
    LDA #$01
    STA !reg_tm
    STZ !reg_ts

    ; NMI & IRQ modes: Nintendo Presents
    STZ $011C
    STZ $0126

    ; fake gamemode
    LDA #$03
    STA $0118

    REP #$30

    ; background color
    STZ $0948

    ; flag on
    INC !debug_menu

    ; DMA font into VRAM 6000
    LDA #.font_gfx>>8
    STA $00
    LDX #.font_gfx
    LDY #$6000
    LDA #$0400
    JSL $00BEA6

    ; init tilemap VRAM
    LDA #.tilemap>>8
    STA $00
    LDX #.tilemap
    LDY #$6400
    LDA #$0800
    JSL $00BEA6

    SEP #$30
    ; turn screen back on
    LDA #$0F
    STA !reg_inidisp
    STA $0200

    PLB
    PLB
    RTL

.font_gfx
incbin "../gfx/font.bin":0-400

.tilemap
dw $000A, $001B, $0017, $000E, $003F, $0012, $001C, $003F
dw $0010, $000A, $0022, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F
dw $003F, $003F, $003F, $003F, $003F, $003F, $003F, $003F

main_debug_menu:
    ; back out of gamemode completely
    SEP #$30
    PLB
    PLB
    RTL