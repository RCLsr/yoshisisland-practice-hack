; data structure for each control as follows:

; [byte] type of control:
; $00: low nibble memory changer (wildcard $xxyy xx = min, yy = max)
; $02: high nibble memory changer (wildcard $xxyy xx = min, yy = max)
; $04: toggle (wildcard as value for enable)
; $06: egg inventory editor (wildcard as egg number)
; $08: call function (wildcard as what function)
!dbc_type = $00

; [long] memory address to read / write from
!dbc_memory = $01

; [word] relative tilemap address (offset from start of tilemap mirror)
!dbc_tilemap = $04

; [word] wildcard
!dbc_wildcard = $06

!debug_controls_count = #$0010
debug_menu_controls:
; DISABLE AUTOSCROLL
  db $08
  dl $7E14A0
  dw $00C2, $0001

; WARP TO BOSS
  db $08
  dl $7E14A0
  dw $0142, $0000

; MUSIC DISABLE
  db $08
  dl $7E14A0
  dw $01C2, $0002

; FREE MOVEMENT
  db $04
  dl $7E10DA
  dw $0242, $0001

; Egg count
  db $00
  dl $7E14A0
  dw $02C2, $0006

; egg 1
  db $06
  dl $7E0379
  dw $02C6, $0000

; egg 2
  db $06
  dl $7E037B
  dw $02C8, $0001

; egg 3
  db $06
  dl $7E03B4
  dw $02CA, $0002

; egg 4 
  db $06
  dl $7E03B6
  dw $02CC, $0003

; egg 5
  db $06
  dl $7E03B8
  dw $02CE, $0004

; egg 6
  db $06
  dl $7E03B8
  dw $02D0, $0005

; SLOW DOWN AMOUNT high
  db $02
  dl $7E012F
  dw $0342, $00F0

; SLOW DOWN AMOUNT low
  db $00
  dl $7E012F
  dw $0344, $000F

; FULL LOAD AS DEFAULT
  db $04
  dl $7E1412
  dw $03C2, $0021

; SET TUTORIAL FLAGS
  db $04
  dl $7E0372
  dw $0442, $00E0

; DISABLE KAMEK AT BOSS
  db $04
  dl $7E03AE
  dw $04C2, $0001

;======================================

; indexed by wilcard for control type $08
control_function_calls:
  dw boss_room_warp
  dw disable_autoscroll
  dw toggle_music

;======================================

; word 1: sprite ID
; word 2: tilemap ID
egg_inv_tilemap:
; no egg
dw $0000, $0039
; boss key
dw $0014, $C03D
; flashing egg
dw $0022, $003A
; red egg
dw $0023, $0C3A
; yellow egg
dw $0024, $083A
; green egg
dw $0025, $043A
; key
dw $0027, $083D
; huffin puffin
dw $0028, $083C
; Red Giant Egg
dw $002A, $0C3B
; Green Giant Egg
dw $002B, $043B
; Unknown
dw $000D, $0026