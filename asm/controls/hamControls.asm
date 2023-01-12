.definelabel @HammerBasicRollButton,0x005c0e64
.definelabel @HammerChargeRollButton,0x005ccbf0

.org @HammerBasicRollButton
    .dh BtnCross
.org @HammerChargeRollButton
    .dh BtnCross

.ifdef scheme
    .definelabel @HammerBounceInput,0x005cda08
    .definelabel @HammerBounceButton,0x005cda0C

    .org @HammerBounceInput
        .dh InputFace
    .org @HammerBounceButton
        .dh BtnTriangleOrCircle
    
    .definelabel @HammerComboAttack,0x005cc964
    .definelabel @HammerComboEnd,0x005CC998
    
    .org @HammerComboAttack
        lhu     v1, InputFace(s0)
        andi    v1, BtnTriangle
        beqz    v1, @HammerComboEnd
        nop
        nop
        nop
        nop
        nop
        nop
        nop
    
    .definelabel @HammerComboAttack2,0x005c0818
    .definelabel @HammerComboEnd2,0x005c0948
    
    .org @HammerComboAttack2
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangle
        beqz    v1, @HammerComboEnd2
        li      a1, 0x1
        bne     s0, a1, @HammerComboEnd2
        nop
        dmove   a0, s1
        li      a2, 0x4B
        jal     Pl_act_set
        li      a3, 0x4
        b       @HammerComboEnd2
        nop
    
    .definelabel @HammerComboAttack3,0x005cfb94
    .definelabel @HammerComboEnd3,0x005cfbc8
    
    .org @HammerComboAttack3
        lhu     v1, InputFace(s0)
        andi    v1, BtnTriangle
        beqz    v1, @HammerComboEnd3
        nop
        nop
        nop
        nop
        nop
        nop
        nop

    .definelabel @HammerChargeCancel,0x005ccd40
    .definelabel @HammerChargeCancelEnd,0x005ccd78

    .org @HammerChargeCancel
        lhu     v1, InputFace(s0)
        andi    v1, BtnTriangle
        beqz    v1, @HammerChargeCancelEnd
.endif