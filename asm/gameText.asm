.orga 0x0016CB40
    .sjis "Let's try hunting an ~C05Aptonoth~C00 for",0xA,"some weapons practice. These fellas",0xA,"are ~C05skittish~C00. If they run, use the",0xA,"L1 button to keep your attacks focused.",0xA,"~C06 L1 button: Center camera viewpoint",0xA,"Left analog stick + ~B01 button: Quick roll",0xA,""
.orga 0x0016C680
    .sjis "That is the ~C05Supply Box~C00. It contains",0xA,"~C05useful items~C00 that will aid you on your",0xA,"journey. Be sure to take a look in there",0xA,"whenever you start a new quest.",0xA,"~C06~B00 button: View contents of Supply Box",0xA,""
.orga 0x0016C920
    .sjis "This is a bed where you can rest up and",0xA,"~C05restore your Health~C00. It's a godsend",0xA,"when you don't have any recovery items.",0xA,"~C06~B00 button: Rest in bed",0xA,"The green gauge is your Health gauge.",0xA,""
.orga 0x0016C9E0
    .sjis "This here is the ~C05Delivery Box~C00.",0xA,"Put the ~C05requested items~C00 for a quest",0xA,"~C05inside the box~C00 to complete your task.",0xA,"~C06~B00 button: Place items in Delivery Box",0xA,""
.orga 0x0016E000
    .sjis "Well done, hunter!",0xA,"The monster you killed ~C06may",0xA,"contain some ~C05usable items~C00.",0xA,"~C06Press ~B00 button while on top",0xA,"of a fallen monster to \"carve up\"",0xA,"the body and obtain items.",0xA,""
.orga 0x0016E530
    .sjis "~C00Cooking meat is all in the timing.",0xA,"~C05Press the ~B00 button just after the",0xA,"music stops (the moment the color of the",0xA,"meat changes)~C00. If you ~C05press the ~B00 button",0xA,"at the right time~C00, you'll have a perfect",0xA,"~C05Well-Done Steak~C00!",0xA,""
.orga 0x0016EB10
    .sjis "The wilds are a treasure trove of items.",0xA,"If you see anything out of the ordinary,",0xA,"be sure to search the area.",0xA,"~C06Press ~B00 button while your weapon is",0xA,"sheathed to search for items.",0xA,""
.orga 0x0016EBD0
    .sjis "~C05Areas with low cliffs or hanging vines~C00",0xA,"can be ~C05climbed~C00.",0xA,"~C06Press ~B00 button when facing the",0xA,"cliff or vine to climb it.",0xA,""
.orga 0x0016F450
    .sjis "The trick to fishing is watching the",0xA,"movement of the fish and keeping a",0xA,"close eye on the ~C05bobber~C00.",0xA,"~C05Press the ~B00 button the moment the",0xA,"bobber sinks!~C00",0xA,""
.orga 0x001706C0
    .sjis "~C05Press the ~B00 button when you're near",0xA,"an egg~C00 to pick it up.",0xA,"Eggs are fragile. ~C05If you are",0xA,"attacked by a monster or fall from a high",0xA,"place, it will almost certainly break~C00.",0xA,"Use the d-pad or right analog to move the",0xA,"camera and check your surroundings.",0xA,""
    
.orga 0x0016D030 ; SnS Tutorial
    .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Sword.",0xA,"~C06Right analog stick: Draw sword",0xA,"R1 button: Guard",0xA,"~B03 or ~B00 button: Sheathe sword",0xA,""
.orga 0x0016D2A0 ; DB Tutorial
    .sjis "By improving a Sword it is sometimes",0xA,"possible to develop it into Dual Swords.",0xA,"Here's how to use these awesome weapons.",0xA,"~C06Right analog stick: Draw weapons",0xA,"R1 button: Change mode",0xA,"~B03 or ~B00 button: Sheathe weapons",0xA,""
.orga 0x0016D560 ; GS Tutorial
    .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Great Sword.",0xA,"~C06Right analog stick: Draw sword",0xA,"R1 button: Guard",0xA,"~B03 or ~B00 button: Sheathe sword",0xA,""
.orga 0x0016D7E0 ; Lance Tutorial
    .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Lance.",0xA,"~C06Right analog stick: Draw weapon",0xA,"R1 button: Guard",0xA,"~B03 or ~B00 button: Sheathe weapon",0xA,""
.orga 0x0016D8B0 ; Lance Attacks
    .sjis "~C00Now let's try attacking.",0xA,"~C06Right analog stick up: Medium thrust",0xA,"Right analog stick down: Upper thrust",0xA,"Press right analog stick: Charge",0xA,"~C00While brandishing a Lance ~C05press the",0xA,"~B01 button~C00 to perform a ~C05back-step~C00.",0xA,""
.orga 0x0016DA20 ; Hammer Tutorial
    .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Hammer.",0xA,"~C06Right analog stick: Draw weapon",0xA,"R1 button: Charge power",0xA,"~B03 or ~B00 button: Sheathe weapon",0xA,""
.orga 0x0016DCB0 ; Bowgun Tutorial
    .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Bowgun.",0xA,"~C06Right analog stick: Draw weapon",0xA,"~B03 or ~B00 button: Sheathe weapon",0xA,""
    
.ifdef scheme
    .orga 0x0016D030 ; SnS Tutorial
        .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Sword.",0xA,"~C06~B02 button: Draw sword",0xA,"R1 button: Guard",0xA,"~B03 button: Sheathe sword",0xA,""
    .orga 0x0016D100 ; SnS Attacks
        .sjis "~C00Now let's try attacking.",0xA,"~C06~B02 button: Slice down",0xA,"~B00 button: Spin-slice",0xA,"~B02 + ~B00 buttons:Jumping attack",0xA,"~C00Press the attack buttons in a set",0xA,"pattern for ~C05combo attacks~C00.",0xA,""
    .orga 0x0016D2A0 ; DB Tutorial
        .sjis "By improving a Sword it is sometimes",0xA,"possible to develop it into Dual Swords.",0xA,"Here's how to use these awesome weapons.",0xA,"~C06~B02 button: Draw weapons",0xA,"R1 button: Change mode",0xA,"~B03 button: Sheathe weapons",0xA,""
    .orga 0x0016D380 ; DB Attacks
        .sjis "~C00Now let's try attacking.",0xA,"~C06~B02 button: Vertical slice",0xA,"~B00 button: Spin-slice",0xA,"~B02 + ~B00 buttons: Thrust attack",0xA,"~C00Press the attack buttons in a set",0xA,"pattern for ~C05combo attacks~C00.",0xA,""
    .orga 0x0016D560 ; GS Tutorial
        .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Great Sword.",0xA,"~C06~B02 button: Draw sword",0xA,"R1 button: Guard",0xA,"~B03 button: Sheathe sword",0xA,""
    .orga 0x0016D630 ; GS Attacks
        .sjis "~C00Now let's try attacking.",0xA,"~C06~B02 button: Vertical slice",0xA,"~B00 button: Side-slice",0xA,"~B02 + ~B00 buttons: Slice up",0xA,"~C00Press the attack buttons in a set",0xA,"pattern for ~C05combo attacks~C00.",0xA,""
    .orga 0x0016D7E0 ; Lance Tutorial
        .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Lance.",0xA,"~C06~B02: Draw weapon",0xA,"R1 button: Guard",0xA,"~B03 button: Sheathe weapon",0xA,""
    .orga 0x0016D8B0 ; Lance Attacks
        .sjis "~C00Now let's try attacking.",0xA,"~C06~B02 button: Medium thrust",0xA,"~B00 button: Upper thrust",0xA,"~B02 + ~B00 buttons: Charge",0xA,"~C00While brandishing a Lance ~C05press the",0xA,"~B01 button~C00 to perform a ~C05back-step~C00.",0xA,""
    .orga 0x0016DA20 ; Hammer Tutorial
        .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Hammer.",0xA,"~C06~B02 button: Draw weapon",0xA,"R1 button: Charge power",0xA,"~B03 button: Sheathe weapon",0xA,""
    .orga 0x0016DAF0 ; Hammer Attacks
        .sjis "~C00Now let's try attacking.",0xA,"~C06~B02 button: Smash down",0xA,"~B00 button: Side-smash",0xA,""
    .orga 0x0016DCB0 ; Bowgun Tutorial
        .sjis "To become a hunter you must hunt!",0xA,"You won't last long if you don't master",0xA,"hunting. Let's try using a Bowgun.",0xA,"~C06~B01 button: Draw weapon",0xA,"~B03 button: Sheathe weapon",0xA,""
    .orga 0x0016DD70 ; Bowgun Attacks
        .sjis "Let's try attacking.",0xA,"~C06~B02 button: Reload",0xA,"Hold ~B04 button + directional button: Move sights",0xA,"~B00 button: Fire",0xA,"~C00When the word ~C05\"RELOAD\" appears",0xA,"at upper left, reload right away~C00!",0xA,""
.endif