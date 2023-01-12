.definelabel @BGBasicRollButton,0x005C0EFC

.org @BGBasicRollButton
    .dh BtnCross

.ifdef scheme
    .definelabel @BGReloadInput,0x005c0f58
    .definelabel @BGReloadButton,0x005c0f5c

    .definelabel @BGMeleeInput,0x005c0f88
    .definelabel @BGMeleeInputEnd,0x005c1098
    .definelabel @BGFireInput,0x005c0fc0
    .definelabel @CheckFireType,0x005c0ff8

    .org @BGReloadInput
        .dh InputFace
    .org @BGReloadButton
        .dh BtnTriangle
    
    .org @BGMeleeInput
        lhu     v1, InputFace(s0)
        li      a0, BtnTriangleOrCircle
        beq     v1, a0, @@DoMelee
        nop
        b       @BGMeleeInputEnd
    @@DoMelee:
        dmove   a0, s0
        li      a1, 0x1
        li      a2, 0x3D
        jal     Pl_act_set
        li      a3, 0x4
        b       @BGMeleeInputEnd
        nop

    .org @BGMeleeInput
        lhu     v1, InputFace(s0)       ; 
        andi    v1, BtnTriangle         ; 
        beqz    v1, @BGMeleeInputEnd
        lhu     v1, InputFace2(s0)      ; 
        andi    v1, BtnCircle           ; 
        beqz    v1, @BGFireInput        ;
        lbu     v1, 0x763(s0)
        beqz    v1, @BGFireInput
        nop
        lbu     v1, 0x764(s0)
        beqz    v1, @BGFireInput
        dmove   a0, s0                  ; 
        li      a1, 0x1                 ; 
        li      a2, 0x3D
        jal     Pl_act_set              ;
        li      a3, 0x4                 ; 
    @@BGFireInput:
        lbu     v1, 0x1C(s0)
        beqz    v1, @CheckFireType
        lhu     v1, InputFace(s0)
        andi    v1, BtnCircle
        beqz    v1, @BGMeleeInputEnd
        dmove   a0, s0
        li      a1, 0x1
        li      a2, 0xC
        jal     Pl_act_set
        li      a3, 0x5
        b       @BGMeleeInputEnd
        nop
    
    .definelabel @BGFireButton,0x005c1004
    
    .org @BGFireButton
        .dh BtnCircle
.endif