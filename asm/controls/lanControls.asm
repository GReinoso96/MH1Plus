.definelabel @LanceBasicRollButton,0x005C0DAC

.org @LanceBasicRollButton
    .dh BtnCross

@LanceMediumPoke equ 0x24
@LanceHighPoke equ 0x2D
@LanceCharge equ 0x22

.ifdef scheme
    .definelabel @LanceHitWallStop,0x005ce378
    
    .org @LanceHitWallStop
        lhu     v1, InputFace(s0)
        andi    at, v1, BtnTriangle
        beqz    at, 0x005ce3a0 ; Return
        nop
        andi    at, v1, BtnCircle
        beqz    at, 0x005ce3a0 ; Return
        li      v1, 0x1
        sb      v1, 0x6(s0)
        b       0x005ce3a0 ; Return
        nop

    .definelabel @LanceBounceInput,0x005cf5e0
    .definelabel @LanceBounceButton,0x005cf5e4

    .org @LanceBounceInput
        .dh InputFace
    .org @LanceBounceButton
        .dh BtnTriangleOrCircle

    .definelabel @LanceComboMedium,0x005ce1d0
    .definelabel @LanceComboMediumEnd,0x5CE288

    .org @LanceComboMedium
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangleOrCircle
        beqz    v1, @LanceComboMediumEnd
        li      v1, 0x3
        beq     s0, v1, @LanceComboMediumEnd
        nop
        lhu     v0, InputFace(s1)
        andi    v0, BtnTriangle
        beqz    v0, @@CheckCircle
        nop
        li      v0, 0x2
        bne     s0, v0, @@Poke2
        dmove   a0, s1
        li      a1, 0x1
        li      a2, 0x36 ; Poke 1
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboMediumEnd
        nop
    @@Poke2:
        li      a1, 0x1
        li      a2, 0x35
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboMediumEnd
        nop
    @@CheckCircle:
        lhu     v0, InputFace(s1)
        andi    v0, BtnCircle
        beqz    v0, @LanceComboMediumEnd
        nop
        li      v0, 0x2
        bne     s0, v0, @@Poke4
        dmove   a0, s1
        li      a1, 0x1
        li      a2, 0x3C ; Poke 3
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboMediumEnd
        nop
    @@Poke4:
        li      a1, 0x1
        li      a2, 0x3B
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboMediumEnd
        nop

    .definelabel @LanceComboHigh,0x005ce8c8
    .definelabel @LanceComboHighEnd,0x005ce978

    .org @LanceComboHigh
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangleOrCircle
        beqz    v1, @LanceComboHighEnd
        li      v1, 0x2
        beq     s0, v1, @LanceComboHighEnd
        nop
        lhu     v0, InputFace(s1)
        andi    v0, BtnTriangle
        beqz    v0, @@CheckCircle
        nop
        li      v0, 0x1
        bne     s0, v0, @@Poke2
        dmove   a0, s1
        li      a1, 0x1
        li      a2, 0x36 ; Poke 1
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboHighEnd
        nop
    @@Poke2:
        li      a1, 0x1
        li      a2, 0x35
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboHighEnd
        nop
    @@CheckCircle:
        lhu     v0, InputFace(s1)
        andi    v0, BtnCircle
        beqz    v0, @LanceComboHighEnd
        nop
        li      v0, 0x1
        bne     s0, v0, @@Poke4
        dmove   a0, s1
        li      a1, 0x1
        li      a2, 0x3C ; Poke 3
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboHighEnd
        nop
    @@Poke4:
        li      a1, 0x1
        li      a2, 0x3B
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceComboHighEnd
        nop

    .definelabel @LanceChargeCombo,0x005cdd3c
    .definelabel @LanceChargeComboEnd,0x005CDDA0
    
    .org @LanceChargeCombo
        lhu     v0, InputFace(s0)
        andi    v0, BtnTriangle
        dmove   a0, s0
        beqz    v0, @@CheckCircle
        li      a1, 0x1
        lhu     v1, InputFace2(s0)
        andi    v1, BtnCircle
        beqz    v1, @@OnlyTriangle
        li      a2, 0x23
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceChargeComboEnd
        nop
    @@CheckCircle:
        lhu     v1, InputFace(s0)
        andi    v1, BtnCircle
        beqz    v1, @LanceChargeComboEnd
    @@OnlyTriangle:
        li      a2, 0x4A
        jal     Pl_act_set
        li      a3, 0x4
        b       @LanceChargeComboEnd
        nop

    .definelabel @LanceGuardAttacks,0x005c1150
    .definelabel @LanceGuardAttacksEnd,0x005C1220

    .org @LanceGuardAttacks
        lhu     v1, InputFace(s0)
        andi    v1, BtnTriangle
        beqz    v1, @LanceGuardAttacksEnd
        dmove   a0, s0
        lhu     v1, InputFace2(s0)
        andi    v1, BtnCircle
        li      a1, 0x1
        beqz    v1, @@OnlyTriangle
        li      a2, 0x22
        jal     Pl_act_set
        li      a3, 0xc
        b       @LanceGuardAttacksEnd
        nop
    @@OnlyTriangle:
        li      a2, 0x28
        jal     Pl_act_set
        li      a3, 0xc
        b       @LanceGuardAttacksEnd
        nop
    
    .definelabel @LanceHopAttackInput,0x005ca448

    .org @LanceHopAttackInput
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangleOrCircle
    .org 0x005ca4b0
        lhu     v0, InputFace(s1)
        andi    at, v0, BtnTriangle
        beqz    at, @@DoCircle
        dmove   a0, s1
        li      a1, 0x1
        li      a2, 0x24
        jal     Pl_act_set
        li      a3, 0xc
        b       0x5CA500
        nop
    @@DoCircle:
        li      a1, 0x1
        li      a2, 0x2D
        jal     Pl_act_set
        li      a3, 0xc
        b       0x5CA500
        nop
.endif