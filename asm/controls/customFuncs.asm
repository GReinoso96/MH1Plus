; ELF 70 Lines Left
.org 0x31E180
.definelabel GetAttackBtn,.-(0x180)
;.org GetAttackBtn ; 0: None, 1: Triangle, 2: Circle, 3: Triangle + Circle, 4: Select
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnSelect
    beqz        at, @@CheckTrO
    nop
    b           @@End
    li          v0, 0x4
@@CheckTrO:
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    b           @@End
    li          v0, 0x3
@@CheckCircle:
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnCircle
    beqz        at, @@None
    nop
    b           @@End
    li          v0, 0x2
@@OnlyTriangle:
    b           @@End
    li          v0, 0x1
@@None:
    li          v0, 0x0
@@End:
    jr          ra
    nop
.align 8
.definelabel CheckRollBtn,.-(0x180)
; .org CheckRollBtn
    lhu         v0, InputFace(a3)
    andi        v0, BtnCross
    beqz        v0, @@NoRoll
    nop
    lh          v0, 0x748(a3)
    slti        v0, v0, 0x4B
    bnez        v0, @@NoRoll
    nop
    b           @@End
    li          v0, 0x1
@@NoRoll:
    li          v0, 0x0
@@End:
    jr          ra
    nop
.align 8
.definelabel SnS_Guard_Ck,.-(0x180)
    addiu       sp, -0x20
    sd          ra, 0x10(sp)
    sq          s0, (sp)
    dmove       a0, s0
    lh          v1, 0x748(s0)
    slti        v1, 0x4B
    bnez        v1, @@CheckTriangle
    nop
    lhu         v1, InputFace(s0)
    andi        at, v1, BtnCross
    beqz        at, @@CheckTriangle
    ;nop
    ;lhu         v1, InputLAnalog(s0)
    ;andi        at, v1, MoveLeft
    ;bnez        at, @@RollLeft
    li          a1, 0x0
    ;andi        at, v1, MoveRight
    ;bnez        at, @@RollRight
    nop
    li          a2, 0x1C
    jal         Pl_act_set
    li          a3, 0x4
    b           @@Return
    nop
;@@RollLeft:
;    li          a2, 0x32
;    jal         Pl_act_set
;    li          a3, 0x4
;    b           @@Return
;    nop
;@@RollRight:
;    li          a2, 0x31
;    jal         Pl_act_set
;    li          a3, 0x4
;    b           @@Return
;    nop
@@CheckTriangle:
    andi        at, v1, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    li          a1, 0x1
    li          a2, 0x49 ; Uppercut
    jal         Pl_act_set
    li          a3, 0x4
    b           @@Return
    nop
@@CheckCircle:
    andi        at, v1, BtnCircle
    beqz        at, @@Return ;@@CheckSquare
    nop
    li          a1, 0x1
    li          a2, 0x34 ; Shield Slash
    jal         Pl_act_set
    li          a3, 0x4
    b           @@Return
    nop
;@@CheckSquare:
;    andi        at, v1, BtnSquare
;    beqz        at, @@Return
;    nop
;    lbu         at, 0x886(s0)
;    bnez        at, @@Return
;    nop
;    dmove       a0, s0
;    jal         0x005bfc70 ; search_act_set
;    li          a1, 0x2
;    dmove       a0, s0
;    jal         0x005c1680 ; item_action_set
;    dmove       a1, zero
;    lbu         at, 0x8F2(s0)
;    ori         at, 0x1
;    b           @@Return
;    sb          at, 0x8F2(s0)
@@Return:
    ld          ra, 0x10(sp)
    lq          s0, (sp)
    jr          ra
    addiu       sp, 0x20
.align 8
.definelabel CheckCamSide,.-(0x180)
    lbu         a0, 0x378(s2)
    andi        v0, a0, 0x4
    bnez        v0, @@Do
    nop
    lbu         a0, 0x378(s2)
    andi        v0, a0, 0x8
    bnez        v0, @@Do
    nop
    lhu         a0, 0x6A(s3)
    andi        v0, a0, 0xC00
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamLeft,.-(0x180)
    lhu         a0, 0x6A(s3)
    andi        v0, a0, 0x800
    bnez        v0, @@Do
    nop
    lhu         a0, 0x378(s2)
    andi        v0, a0, 0x8
    beqz        v0, @@Nope
@@Do:
    nop
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamRight,.-(0x180)
    lhu         a0, 0x6A(s3)
    andi        v0, a0, 0x400
    bnez        v0, @@Do
    nop
    lhu         a0, 0x378(s2)
    andi        v0, a0, 0x4
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.definelabel CheckCamUp,.-(0x180)
    lhu         a0, 0x6C(s3)
    andi        v0, a0, 0x2000
    bnez        v0, @@Do
    nop
    lhu         a0, 0x378(s2)
    andi        v0, a0, 0x000C
    bnez        v0, @@Nope
    nop
    lhu         a0, 0x37C(s2)
    andi        v0, a0, 0x20
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop

.align 8
.definelabel CheckCamDown,.-(0x180)
    lhu         a0, 0x6C(s3)
    andi        v0, a0, 0x1000
    bnez        v0, @@Do
    nop
    lhu         a0, 0x378(s2)
    andi        v0, a0, 0x000C
    bnez        v0, @@Nope
    nop
    lhu         a0, 0x37C(s2)
    andi        v0, a0, 0x10
    beqz        v0, @@Nope
    nop
@@Do:
    b           @@Return
    li          v0, 0x1
@@Nope:
    li          v0, 0x0
@@Return:
    jr          ra
    nop
.align 8
;.definelabel DispTest,.-(0x180)
;	addiu	sp,-0x30
;	li	a0,0x1
;	sd	ra,(sp)
;	jal	0x0010f900
;	li	a1,0x156
;	jal	0x0012eae0
;	li	a0,0x156
;	li	v0,0x200
;	addiu	a0,sp,0x10
;	sh	v0,0x14(sp)
;	li	v0,0x1C0
;	sh	zero,0x10(sp)
;	sh	v0,0x16(sp)
;	li	v0,0xFF
;	sh	zero,0x12(sp)
;	sh	v0,0x20(sp)
;	li	v0,0xE0
;	sh	zero,0x1C(sp)
;	sh	v0,0x22(sp)
;	lui	v0,0xFF60
;	sh	zero,0x1E(sp)
;	ori	v0,0x6060
;	jal	0x001443b0
;	sw	v0,0x18(sp)
;	ld	ra,(sp)
;	jr	ra
;	addiu	sp,0x30
;	nop	

.ifdef scheme
    .org 0x11C09C ; Map Button map_move
        .dh BtnR3
    .org 0x118C5C ; Chat Button
        .dh BtnL3
.endif