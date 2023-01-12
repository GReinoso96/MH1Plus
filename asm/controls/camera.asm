.org 0x001E9B40
    jal         CheckCamSide
    nop
.org 0x001E9B78
    jal         CheckCamLeft
    nop
    beqz        v0, 0x001e9B90
.org 0x001E9B90
    jal         CheckCamRight
    nop
.org 0x001E9D20 ; Normal Down
    jal         CheckCamDown
    nop
.org 0x001E9D48 ; Normal Up
    jal         CheckCamUp
    nop
.org 0x001E9D78 ; Reverse Up
    jal         CheckCamUp
    nop
.org 0x001E9DA0 ; Reverse Down
    jal         CheckCamDown
    nop