.ps2
    .include "asm/addresses.asm"
    .include "asm/defines.asm"
    .include "asm/equip/bladeList.asm"
.open "ogSLUS_208.96","SLUS_208.96",0x00100000
    ;.include "asm/exec.asm"
    .include "asm/makespace.asm"
    .include "asm/controls/camera.asm"
    ;.include "asm/controls/GetAttackBtn.asm"
    .include "asm/controls/CustomFuncs.asm"
.close
.open "unpacked/sub_main.bin","sub_main.bin",0x00552E00
    ;.include "asm/sub_main.asm"
.close
.open "unpacked/game.bin","game.bin",0x005BE900
    ;.include "asm/controls/chiefWisdom.asm"
    .include "asm/controls/generalControls.asm"
    .include "asm/controls/snsControls.asm"
    .include "asm/controls/dbControls.asm"
    .include "asm/controls/gsControls.asm"
    .include "asm/controls/lanControls.asm"
    .include "asm/controls/hamControls.asm"
    ;.include "asm/controls/bgControls.asm"
    .include "asm/controls/basic_attack_ck.asm"
.close
.open "unpacked/lobby.bin","lobby.bin",0x005BE900
    ;.include "asm/lobby.asm"
.close