.definelabel @ButtonTutorialRolling,0x0016CC1E+0x5BE90C ; Set to X
.definelabel @ButtonTutorialBackstep,0x0016D96A+0x5BE90C
.definelabel @ButtonTutorialSupplyBox,0x0016C729+0x5BE90C ; Set to O
.definelabel @ButtonTutorialBed,0x0016C9A1+0x5BE90C
.definelabel @ButtonTutorialDeliveryBox,0x0016CA66+0x5BE90C
.definelabel @ButtonTutorialSheathe1,0x0016D0D9+0x5BE90C
.definelabel @ButtonTutorialSheathe2,0x0016D35C+0x5BE90C
.definelabel @ButtonTutorialSheathe3,0x0016D60F+0x5BE90C
.definelabel @ButtonTutorialSheathe4,0x0016D88A+0x5BE90C
.definelabel @ButtonTutorialSheathe5,0x0016DAD2+0x5BE90C
.definelabel @ButtonTutorialSheathe6,0x0016DD4A+0x5BE90C
.definelabel @ButtonTutorialCarve,0x0016E060+0x5BE90C
.definelabel @ButtonTutorialCooking1,0x0016E566+0x5BE90C
.definelabel @ButtonTutorialCooking2,0x0016E5D2+0x5BE90C
.definelabel @ButtonTutorialGathering,0x0016EB89+0x5BE90C
.definelabel @ButtonTutorialClimbing,0x0016EC22+0x5BE90C
.definelabel @ButtonTutorialFishing,0x0016F4C8+0x5BE90C
.definelabel @ButtonTutorialEgg,0x001706CF+0x5BE90C

.org @ButtonTutorialRolling
    .strn IconBtnCross
.org @ButtonTutorialBackstep
    .strn IconBtnCross
.org @ButtonTutorialSupplyBox
    .strn IconBtnCircle
.org @ButtonTutorialBed
    .strn IconBtnCircle
.org @ButtonTutorialDeliveryBox
    .strn IconBtnCircle
.org @ButtonTutorialSheathe1
    .strn IconBtnCircle
.org @ButtonTutorialSheathe2
    .strn IconBtnCircle
.org @ButtonTutorialSheathe3
    .strn IconBtnCircle
.org @ButtonTutorialSheathe4
    .strn IconBtnCircle
.org @ButtonTutorialSheathe5
    .strn IconBtnCircle
.org @ButtonTutorialSheathe6
    .strn IconBtnCircle
.org @ButtonTutorialCarve
    .strn IconBtnCircle
.org @ButtonTutorialCooking1
    .strn IconBtnCircle
.org @ButtonTutorialCooking2
    .strn IconBtnCircle
.org @ButtonTutorialGathering
    .strn IconBtnCircle
.org @ButtonTutorialClimbing
    .strn IconBtnCircle
.org @ButtonTutorialFishing
    .strn IconBtnCircle
.org @ButtonTutorialEgg
    .strn IconBtnCircle

.ifdef scheme
    .definelabel @TutorialDrawSns,0x0016D0A0+0x5BE90C ; SnS
    .definelabel @TutorialSnSAttacks1,0x0016D121+0x5BE90C
    .definelabel @TutorialSnSAttacks2,0x0016D143+0x5BE90C
    .definelabel @TutorialSnSAttacks3,0x0016D16D+0x5BE90C
    .definelabel @TutorialSnSAttacks4,0x0016D199+0x5BE90C
    .definelabel @TutorialDrawDB,0x0016D31B+0x5BE90C ; DB
    .definelabel @TutorialDBAttacks1,0x0016D3A1+0x5BE90C
    .definelabel @TutorialDBAttacks2,0x0016D3C7+0x5BE90C
    .definelabel @TutorialDBAttacks3,0x0016D3F1+0x5BE90C
    .definelabel @TutorialDBAttacks4,0x0016D41C+0x5BE90C
    .definelabel @TutorialDrawGS,0x0016D5D6+0x5BE90C ; GS
    .definelabel @TutorialGSAttacks1,0x0016D651+0x5BE90C
    .definelabel @TutorialGSAttacks2,0x0016D677+0x5BE90C
    .definelabel @TutorialGSAttacks3,0x0016D69B+0x5BE90C
    .definelabel @TutorialGSAttacks4,0x0016D6C2+0x5BE90C

    .org @TutorialDrawSns
        .strn "~B02: Draw sword              "
    .org @TutorialDrawGS
        .strn "~B02: Draw sword              "
    .org @TutorialDrawDB
        .strn "~B02: Draw swords               "

    .org @TutorialSnSAttacks1
        .strn "~B02: Slice down                 "
    .org @TutorialSnSAttacks2
        .strn "~B00: Spin-slice                         "
    .org @TutorialSnSAttacks3
        .strn "~B02 + ~B00: Jumping attack            "
    .org @TutorialSnSAttacks4
        .strn "Press the attack buttons in a set    "

    .org @TutorialDBAttacks1
        .strn "~B02: Vertical slice                 "
    .org @TutorialDBAttacks2
        .strn "~B00: Spin-slice                         "
    .org @TutorialDBAttacks3
        .strn "~B02 + ~B00: Thrust attack            "
    .org @TutorialDBAttacks4
        .strn "Press the attack buttons in a set    "

    .org @TutorialGSAttacks1
        .strn "~B02: Vertical slice                 "
    .org @TutorialGSAttacks2
        .strn "~B00: Side-slice                   "
    .org @TutorialGSAttacks3
        .strn "~B02 + ~B00: Slice up             "
    .org @TutorialGSAttacks3
        .strn "Press the attack buttons in a set    "
.endif