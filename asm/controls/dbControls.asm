.definelabel @DBBasicRollButton,0x005c0bfc

.org @DBBasicRollButton
    .dh BtnCross

.ifdef scheme
    .org 0x005d0148 ; DB Combos
        lhu     v1, InputFace(s1)
        andi    v1, BtnTriangle
        beqz    v1, @@DBCheckCircle
        nop
        lhu     v1, InputFace2(s1)
        andi    v1, BtnCircle
        beqz    v1, @@DBTriangle
        nop
        li      v0, 0x4
        sb      v0, 0x6(s1)
        b       0x005d01c8 ; Normalize
        nop
    @@DBTriangle:
        li      v0, 0x1
        b       0x005d01c8 ; Normalize
        sb      v0, 0x6(s1)
    @@DBCheckCircle:
        lhu     v1, InputFace(s1)
        andi    v1, BtnCircle
        beqz    v1, 0x005d01c8 ; Normalize
        nop
        lhu     v1, InputLAnalog(s1)
        andi    v1, MoveLeft
        beqz    v1, @@DBNotLeft
        nop
        li      v0, 0x3
        b       0x005d01c8 ; Normalize
        sb      v0, 0x6(s1)
    @@DBNotLeft:
        li      v0, 0x2
        b       0x005d01c8 ; Normalize
        sb      v0, 0x6(s1)
        nop

    .org 0x005d0a6c ; DB Lunge
        lhu     v0, InputFace(s0)
        andi    v0, BtnTriangle
        beqz    v0, 0x005d0aa8 ; Normalize
        nop
        li      v0, 0x1
        sb      v0, 0x6(s0)
        b       0x005d0aa8 ; Normalize
        nop
    
    .org 0x005d0c5c ; DB Upswing
        lhu     v1, InputFace(s0)
        andi    v1, BtnTriangle
        beqz    v1, @@DBCheckCircle
        nop
        li      v0, 0x1
        sb      v0, 0x6(s0)
        b       0x005d0cc8 ; Normalize
        nop
    @@DBCheckCircle:
        lhu     v1, InputFace(s0)
        andi    v1, BtnCircle
        beqz    v1, 0x005d0cc8 ; Normalize
        nop
        lhu     v1, InputLAnalog(s0)
        andi    v1, MoveLeft
        beqz    v1, @@DBNotLeft
        nop
        li      v0, 0x3
        b       0x005d0cc8 ; Normalize
        sb      v0, 0x6(s0)
    @@DBNotLeft:
        li      v0, 0x2
        b       0x005d0cc8 ; Normalize
        sb      v0, 0x6(s0)
        nop

.endif