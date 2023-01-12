; ELF 70 Lines Left ; 0: None, 1: Triangle, 2: Circle, 3: Triangle + Circle, 4: Select
.org GetAttackBtnOff
    lhu         v0, InputFace(a0)
    andi        at, v0, BtnSelect
    beqz        at, @@CheckTrO
    nop
    b           @@End
    li          v0, 0x4
@@CheckTrO:
    andi        at, v0, BtnTriangle
    beqz        at, @@CheckCircle
    nop
    andi        at, v0, BtnCircle
    beqz        at, @@OnlyTriangle
    nop
    b           @@End
    li          v0, 0x3
@@CheckCircle:
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


.ifdef scheme
    .org 0x11C09C ; Map Button map_move
        .dh BtnR3
    .org 0x118C5C ; Chat Button
        .dh BtnL3
.endif