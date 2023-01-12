.definelabel @DetailAttackPosX,0x00237FB8
.definelabel @DetailAttackPosSharpY,0x00237FBC

.org sword_zokusei

; 0x00238fe0 (1US) sword_zokusei(unk,x,y)
; 0x002260c0 (MHG) sword_zokusei(unk,x,y,compare)

; MHG 0x002261E8
    lh      v1, 0xCE(sp)
    bltz    v1, 0x00226280 ; If less than zero go to check for defense
    slti    at, v1, 0x0004 ; Set on less than immediate
    beq     at, 0x226200 ; If not less than 4, print element
    li      v0, 0xB
    li      v0, 0xA

; Mockup
if(s0+0xb)