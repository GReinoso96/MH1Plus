.definelabel @GSBasicRollButton,0x005C0CD4
.definelabel @GSGuardRollButton,0x005c11f4

.org @GSBasicRollButton
    .dh BtnCross
.org @GSGuardRollButton
    .dh BtnCross

@GSHorizontalSlash equ 0x0
@GSBackwardSlash equ 0x1
@GSDownwardSlash equ 0x4

.ifdef scheme

    .definelabel @GSBounceInput,0x005cbed0
    .definelabel @GSBounceButton,0x005cbed4

    .org @GSBounceInput
        .dh InputFace
    .org @GSBounceButton
        .dh BtnTriangleOrCircle
    
    ; GS combo system checks for both possible follow-ups 3 times, once for each attack
    ; 0x005c0360
    ; pl_at000 (Horizontal Slash) ex_atk_ck(2)
    ; pl_at001 (Backwards Slash) ex_atk_ck(1)
    ; pl_at004 (Downwards Slash) ex_atk_ck(0)
    .definelabel @GSComboEnd,0x005c0568 ;When combos end, check for rolling

    .definelabel @GSComboAttacks,0x005c0360
    .org @GSComboAttacks
        beqz    s0, @@DownwardCombos ; If zero, go to downward combos
        nop
        beq     s0, 0x1, @@BackwardCombos ; If 1, go to backward combos
        nop
        lhu     v1, InputFace(s1) ; Otherwise assume it's Horizontal Combo
        andi    v1, BtnTriangle
        beqz    v1, @GSComboEnd ; Not pressing triangle, end combo
        nop
        lhu     v1, InputFace2(s1) ; Test for Tr+O
        andi    v1, BtnCircle
        beqz    v1, @@HRTriangleOnly
        nop
        lhu     v1, InputLAnalog(s1) ; Test for Pushing Right
        andi    v1, MoveRight
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@HRNotRight
        nop
        li      a2, 0x43
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@HRNotRight:
        li      a2, 0xF
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@HRTriangleOnly:
        lhu     v1, InputLAnalog(s1)
        andi    v1, MoveLeft ; Test for Pushing Left
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@HRNotLeft
        nop
        li      a2, 0x42
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@HRNotLeft:
        li      a2, 0x11 ;NOTLEFT
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@DownwardCombos:
        lhu     v1, InputFace(s1) ; Downward Combos
        andi    v1, BtnCircle
        beqz    v1, @GSComboEnd ; Not pressing circle, end combo
        nop
        lhu     v1, InputFace2(s1) ; Test for Tr+O
        andi    v1, BtnTriangle
        beqz    v1, @@DWCircleOnly
        nop
        lhu     v1, InputLAnalog(s1) ; Test for Pushing Right
        andi    v1, MoveRight
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@DWNotRight
        nop
        li      a2, 0x3F
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@DWNotRight:
        li      a2, 0xD ; NOTRIGHT
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@DWCircleOnly:
        lhu     v1, InputLAnalog(s1) ; CIRCLEONLY
        andi    v1, MoveLeft ; Test for Pushing Left
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@DWNotLeft
        nop
        li      a2, 0x40
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@DWNotLeft:
        li      a2, 0x12 ; NOTLEFT
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@BackwardCombos:
        lhu     v1, InputFace(s1) ; Backward Combos
        andi    v1, BtnTriangle
        beqz    v1, @@BWTestCircle ; Not pressing triangle, test for circle
        nop
        lhu     v1, InputLAnalog(s1)
        andi    v1, MoveRight
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@BWNotRight
        nop
        li      a2, 0x44
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@BWNotRight:
        li      a2, 0x10 ; NOTRIGHT
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@BWTestCircle:
        lhu     v1, InputFace(s1) ; TESTCIRCLE
        andi    v1, BtnCircle
        beqz    v1, @GSComboEnd ; Not pressing circle, end
        nop
        lhu     v1, InputLAnalog(s1)
        andi    v1, MoveLeft
        dmove   a0, s1
        li      a1, 0x1
        beqz    v1, @@BWNotLeft
        nop
        li      a2, 0x45
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
        nop
    @@BWNotLeft:
        li      a2, 0x13 ; NOTLEFT
        jal     Pl_act_set
        li      a3, 0x4
        b       @GSComboEnd
.endif