fix_cross_section:
; empty out VRAM $5000 -> $5800
; if inside cross section
    LDA $7FEC
    BEQ .ret
    LDA #$7E7E
    STA $0000
    ; STZ $0002
    LDA #$0800
    LDY #$2800
    LDX #$026C
    JSR fixed_vram_dma_full

.ret
    RTS

;=================================
;=================================
!special_boss_flag = $0C14
!special_boss_flag_save = $7F438A
; Use Experimental load if save state is on bowser or hookbill
; And if we're in the same level

fix_special_bosses:
    SEP #$30
    LDA !controller_data1
    AND #$20
    BNE .no_special_boss
    LDA !special_boss_flag_save
; Check if flag is either 02 or 07 (hookbill/bowser)
; Else just return
    CMP #$02
    BEQ +
    CMP #$07
    BEQ +
    BRA .no_special_boss
+
    LDA !current_level
    CMP !save_level
    BNE .no_special_boss
    ; CMP !special_boss_flag
    ; BNE .no_special_boss
.special_boss
    SEC
    BRA .ret

.no_special_boss
    CLC
.ret
    REP #$30
    RTS

;=================================
;=================================