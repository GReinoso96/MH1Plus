.definelabel @SnSBasicRollButton,0x005c0b1c
.definelabel @SnSGuardRollButton,0x005c119c

.org @SnSBasicRollButton ; Set Roll to X
    .dh BtnCross
.org @SnSGuardRollButton ; Set Roll to X
    .dh BtnCross

@SnSComboStart equ 0x0030
@SnSJumpingSlash equ 0x0031
@SnSRoundSlash equ 0x0033

.ifdef scheme
    .definelabel @SnSBasicAttack,0x005c0b48

    .definelabel @SnSBounceRecoverInput,0x005CF260
    .definelabel @SnSBounceRecoverButton,0x005CF264
    .definelabel @SnSGuardSlashInput,0x005c11c8
    .definelabel @SnSGuardSlashButton,0x005c11cc
    .definelabel @SnSRollToUpslashInput,0x005c5408
    .definelabel @SnSRollToUpslashButton,0x005c540C
    .definelabel @SnSSideRollToUpslashInput,0x005C69E0
    .definelabel @SnSSideRollToUpslashButton,0x005C69E4

    .definelabel @SnSBasicEnd,0x005c1098
    .definelabel @SnSComboEnd,0x005cec60

    .org 0x005c1198 ; SnS Guarding
        jal     SnS_Guard_Ck
        dmove   a0, s0
        b       0x005c1220 ; Return
        nop

    .org @SnSGuardSlashInput ; Set Sideslash to Face Button
        .dh InputFace
    .org @SnSGuardSlashButton ; Set Sideslash to Circle
        .dh BtnTriangleOrCircle
    .org @SnSRollToUpslashInput
        .dh InputFace
    .org @SnSRollToUpslashButton
        .dh BtnTriangle
    .org @SnSSideRollToUpslashInput
        .dh InputFace
    .org @SnSSideRollToUpslashButton
        .dh BtnTriangle
    .org @SnSBounceRecoverInput
        .dh InputFace
    .org @SnSBounceRecoverButton
        .dh BtnTriangleOrCircle

    
    .definelabel @SnSComboAttack,0x005cebf0
    .definelabel @SnSJumpComboAttack,0x005cf04c
    .definelabel @SnSUpswingComboAttack,0x005cf70c

    .definelabel @SnSToNormal,0x005cec88

    .org @SnSComboAttack
        dmove   a0, s1 ; Move param1 to a0
        jal     frame_check2 ; first param is already defined by this point
        dmove   a1, zero
        beqz    v0, @SnSToNormal
        mov.s   f12, f20
        dmove   a0, s1
        jal     frame_check2
        dmove   a1, zero
        bnez    v0, @SnSToNormal
        nop
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangle
        beqz    v1, @@CheckCircle
        nop
        li      v0, 0x1
        b       @SnSToNormal
        sb      v0, 0x6(s1) ; v0 to s1+6
        nop
    @@CheckCircle:
        lhu     v0, InputFace(s1)
        andi    v0, BtnCircle
        beqz    v0, @SnSToNormal
        nop
        li      v0, 0x2
        sb      v0, 0x6(s1)
        b       @SnSToNormal

    .org @SnSJumpComboAttack
        lhu     v0, InputFace(s0)
        andi    v0, BtnTriangle
        beqz    v0, .+(11*4)
        nop
        b       0x005cf080

    .org @SnSUpswingComboAttack
        lhu     v0, InputFace(s0)
        andi    v0, BtnTriangle
        beqz    v0, .+(9*4)
        nop
        b       .+(13*4)
        lhu     v0, InputFace(s0)
        andi    v0, BtnCircle
        beqz    v0, .+(14*4)
        nop
        nop
.endif