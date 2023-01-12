.definelabel @SheatheButton,0x005C257C

.org @SheatheButton ; Square and Cross in 1US, Square and Circle in 1J
    .dh BtnSquareOrCircle

.ifdef scheme
    .definelabel @UnsheatheInput,0x005C29B0
    .definelabel @UnsheatheButton,0x0005C29B4
    .definelabel @KickButton,0x005c2af4
    .definelabel @TutorialButton,0x006dfcb4
    .definelabel @TutorialButtonXYS,0x007203B0

    .definelabel @CrouchUnsheatheInput, 0x005C01F8
    
    .org @CrouchUnsheatheInput
        lhu         v0, InputFace(s0)
        andi        v0, BtnTriangle

    .org @SheatheButton ; Square and Cross in 1US, Square and Circle in 1J
        .dh BtnSquare

    .org @UnsheatheInput ; Set Unsheathe to Face Button
        .dh InputFace
    .org @UnsheatheButton ; Set Unsheathe to Triangle
        .dh BtnTriangle
    .org @KickButton
        .dh BtnSelect
    .org @TutorialButton
        .dh BtnL3

    .definelabel @EggAttackInput,0x005d4920
    .definelabel @EggAttackButton,0x005d4924
    .org @EggAttackInput ; Set to Triangle
        .dh InputFace
    .org @EggAttackButton
        .dh BtnTriangle

    .org @TutorialButtonXYS
        .dh 0x17 ; X
        .dh 0xb1 ; Y
        .dh 0x12 ; S
        .dh 0xff06 ; BtnL3
        
    ; .org 0x006dfa84 ;Nuke tutorials
    ;    li v0, 0x0
    ;.org 0x006DFA48
    ;    li v0, 0x0
.endif

.definelabel @StandingToCrouchRollButton,0x005c28d0
.definelabel @CrouchToStandingButton,0x005c0194
.definelabel @CrouchGatheringButton,0x005C0264
.definelabel @ClimbingButton,0x005c2998
.definelabel @CimbingLedgeConfirmButton,0x005c4e70
.definelabel @ClimbingUnknownButton,0x005bf774
.definelabel @GatheringButton,0x005c2b14
.definelabel @UnknownSwappedButtonB,0x005c23e8
.definelabel @RunningToRollButton,0x005c5834
.definelabel @UnknownSwappedButtonD,0x005c5c4c
.definelabel @UnknownSwappedButtonE,0x005c6fb0
.definelabel @UnknownSwappedButtonF,0x005c6ff8
.definelabel @UnknownSwappedButtonG,0x005c7438
.definelabel @UnknownSwappedButtonH,0x005c90f8
.definelabel @CrouchToRollButton,0x005C7610
.definelabel @UnknownSwappedButtonI,0x005c7a14
.definelabel @UnknownSwappedButtonJ,0x005c9eec
.definelabel @UnknownSwappedButtonK,0x005c9fe8
.definelabel @UnknownFishingButtonA,0x005c8834
.definelabel @UnknownFishingButtonB,0x005c88b4

.definelabel @UnkComboRollButtonA,0x005c056c
.definelabel @UnkComboRollButtonB,0x005c075c
.definelabel @UnkComboRollButtonC,0x005c0864
.definelabel @SnSDBComboRollButton,0x005c0634

.definelabel @EggRollButton,0x005d48b8
.definelabel @EggInteractButton,0x005d4980

.org @EggRollButton ; From X to O
    .dh BtnCross
.org @EggInteractButton ; From O to X
    .dh BtnCircle

.org @StandingToCrouchRollButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @CrouchToStandingButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @CrouchGatheringButton ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @UnknownSwappedButtonB ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @RunningToRollButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnknownSwappedButtonD ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnknownSwappedButtonE ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @UnknownSwappedButtonF ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnknownSwappedButtonG ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnknownSwappedButtonH ; Was changed from Cross to Circle in 1US
    .dh BtnCircle
.org @UnknownSwappedButtonI ; Was changed from Circle to Cross in 1US
    .dh BtnCross
.org @UnknownSwappedButtonJ ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnknownSwappedButtonK ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @ClimbingButton ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @CimbingLedgeConfirmButton ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @ClimbingUnknownButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @GatheringButton ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @CrouchToRollButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross

.org @UnknownFishingButtonA ; Was changed from Circle to Cross in 1US
    .dh BtnCircle
.org @UnknownFishingButtonB ; Was changed from Circle to Cross in 1US
    .dh BtnCircle

.org @UnkComboRollButtonA ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnkComboRollButtonB ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @UnkComboRollButtonC ; Was changed from Cross to Circle in 1US
    .dh BtnCross
.org @SnSDBComboRollButton ; Was changed from Cross to Circle in 1US
    .dh BtnCross