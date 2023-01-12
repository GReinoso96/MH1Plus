.definelabel @AttackCaseAddresses,0x007266a0

@GSHorizontalSlash equ 0x0
@GSBackwardSlash equ 0x1
@GSDownwardSlash equ 0x4
@LanceMediumPoke equ 0x24
@LanceHighPoke equ 0x2D
@LanceCharge equ 0x22
@SnSComboStart equ 0x0030
@SnSJumpingSlash equ 0x0031
@SnSRoundSlash equ 0x0033

.ifdef scheme
    .org basic_attack_ck
        addiu   sp, -0x20
        sd      ra, 0x10(sp)
        sq      s0, (sp)
        jal     pl_master_ck
        dmove   s0, a0
        bnez    v0, @@CheckSub
        nop
        jal     Online_ck
        nop
        li      v1, 0x1
        beq     v0, v1, @Return
        nop
    @@CheckSub:
        lbu     v1, 0x88C(s0)
        bnez    v1, @Return
        li      a0, 0x1
        jal     Game_clear_ck
        nop
        li      v1, 0x1
        beq     v0, v1, @Return
        nop
        lbu     v1, 0x2(s0)
        sltiu   at, v1, 0x7
        beqz    at, GSCase
        lui     a0, 0x72
        sll     v1, v1, 0x2
        addiu   a0, 0x66A0
        addu    v1, a0
        lw      v1, (v1)
        jr      v1
        nop
    .definelabel GSCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0x4
        beq         v0, a3, @@DoKick
        li          v1, 0x3
        beq         v0, v1, @@DoBackward
        nop
        li          v1, 0x2
        beq         v0, v1, @@DoSide
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoDownward
        nop
        b           @@CheckRoll
        nop
    @@DoKick:
        li          a2, 0xE
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoBackward:
        li          a2, 0x1
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoSide:
        li          a2, 0x0
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoDownward:
        li          a2, 0x4
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x1C
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
	.definelabel BGCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0x4
        beq         v0, a3, @@DoMelee
        li          v1, 0x3
        beq         v0, v1, @@DoMelee
        nop
        li          v1, 0x2
        beq         v0, v1, @@DoFire
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoReload
        nop
        b           @@CheckRoll
        nop
    @@DoMelee:
        lbu         v1, 0x763(s0)
        bnez        v1, @@DoFire
        dmove       a0, s0
        li          a1, 0x1
        li          a2, 0x3D
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
    @@DoFire:
        dmove       s0, a0
        lbu         v0, 0x1C(s0)
        bnez        v0, @@FireType
        dmove       a0, s0
        li          a1, 0x1
        li          a2, 0xC
        jal         Pl_act_set
        li          a3, 0x5
        b           @Return
        nop
    @@FireType:
        li      a1, 0x1
        sb      a1, 0x8ED(s0)
        lhu     v1, InputFace(s0)
        andi    v1, BtnCircle
        beqz    v1, @Return
        nop
        lbu     v1, 0x56C(s0)
        lui     v0, 0x5A
        addiu   v0, v0, -0x464f
        li      a2, 0x2
        sll     v1, v1, 0x2
        addu    v0, v0, v1
        lbu     v0, 0x0(v0)
        beq     v0, a2, @@BGTypeA
        nop
        beq     v0, a1, @@BGTypeB
        nop
        beqz    v0, @@BGTypeC
        nop
        b       @@BGTypeB
        nop
    @@BGTypeC:
        dmove   a0, s0
        jal     Pl_act_set
        li      a3, 0x5
        b       @Return
        nop
    @@BGTypeB:
        dmove   a0, s0
        li      a1, 0x1
        li      a2, 0x8
        jal     Pl_act_set
        li      a3, 0x5
        b       @Return
        nop
    @@BGTypeA:
        dmove   a0, s0
        li      a2, 0xa
        jal     Pl_act_set
        li      a3, 0x5
        b       @Return
        nop
    @@DoReload:
        lh          v0, 0x8BC(a0)
        blez        v0, @Return
        dmove       a0, s0
        li          a1, 0x1
        li          a2, 0x9
        jal         Pl_act_set
        li          a3, 0x5
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x1C
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        li          v0, 0x1
    .definelabel HammerCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0x4
        ;beq         v0, a3, @@DoUnsheathe
        ;li          v1, 0x3
        ;beq         v0, v1, @@
        ;nop
        li          v1, 0x2
        beq         v0, v1, @@DoSide
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoPound
        nop
        b           @@CheckRoll
        nop
    @@DoSide:
        li          a2, 0x16
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoPound:
        li          a2, 0x17
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x1C
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
    .definelabel LanceCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0xC
        li          v1, 0x3
        beq         v0, v1, @@DoCharge
        nop
        li          v1, 0x2
        beq         v0, v1, @@DoHigh
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoMed
        nop
        b           @@CheckRoll
        nop
    @@DoCharge:
        li          a2, 0x22
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoHigh:
        li          a2, 0x2D
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoMed:
        li          a2, 0x24
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x6D
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
    .definelabel SnSCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0x4
        beq         v0, a3, @@DoUpswing
        li          v1, 0x3
        beq         v0, v1, @@DoLunge
        nop
        li          v1, 0x2
        beq         v0, v1, @@DoSide
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoCombo
        nop
        b           @@CheckRoll
        nop
    @@DoUpswing:
        li          a2, 0x46
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoLunge:
        li          a2, 0x31
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoSide:
        li          a2, 0x33
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@DoCombo:
        li          a2, 0x30
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x1C
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
    .definelabel DBCase,.
        jal         GetAttackBtn
        dmove       a0, s0
        li          a3, 0x4
        beq         v0, a3, @@DoSpinLeft
        li          v1, 0x3
        beq         v0, v1, @@DoLunge
        nop
        li          v1, 0x2
        beq         v0, v1, @@DoSpinRight
        nop
        li          v1, 0x1
        beq         v0, v1, @@DoCombo
        nop
        b           @@CheckRoll
        nop
    @@DoSpinRight:
        lhu         v1, InputLAnalog(s0)
        andi        v1, MoveLeft
        bnez        v1, @@DoSpinLeft
        dmove       a0, s0
        li          a1, 0x0
        jal         Db_act_set
        dmove       a2, zero
        b           @Return
        nop
    @@DoSpinLeft:
        dmove       a0, s0
        li          a1, 0x1
        jal         Db_act_set
        dmove       a2, zero
        b           @Return
        nop
    @@DoLunge:
        dmove       a0, s0
        li          a1, 0x2
        jal         Db_act_set
        dmove       a2, zero
        b           @Return
        nop
    @@DoCombo:
        li          a2, 0x55
        jal         Pl_act_set
        li          a1, 0x1
        b           @Return
        nop
    @@CheckRoll:
        jal         CheckRollBtn
        dmove       a3, a0
        beqz        v0, @Return
        dmove       a1, zero
        li          a2, 0x1C
        jal         Pl_act_set
        li          a3, 0x4
        b           @Return
        nop
    .notice "Last offset: " + .
    .definelabel @Return,0x005c1098
    .org @Return
        ld      ra, 0x10(sp)
        lq      s0, (sp)
        jr      ra
        addiu   sp, 0x20
        nop

    .org @AttackCaseAddresses
        .dw GSCase ;GS
        .dw BGCase ; HBG
        .dw HammerCase ; Hammer
        .dw LanceCase ; Lance
        .dw SnSCase ; SnS
        .dw BGCase ; LBG
        .dw DBCase ; DB
.endif