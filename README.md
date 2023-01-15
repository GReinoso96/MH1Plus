# MH1Plus
MH1Plus is an improvement patch for Monster Hunter (North America, PS2) Game Code SLUS_208.96.

# Usage
## Download
  Go to https://github.com/GReinoso96/MH1Plus/releases/tag/Release
  Download the patch you want and apply with an xdelta patcher.

## Set-Up
  First, you must supply the following:
  * AFSPacker.exe: https://github.com/MaikelChan/AFSPacker
  * PZZComp_JoJo.exe: https://github.com/infval/pzzcompressor_jojo
  * Armips.exe: https://github.com/Kingcom/armips
  * SLUS_208.96: Extract from MH1US iso, rename to "ogSLUS_208.96".
  * Game data: Extract AFS_DATA.AFS from MH1US iso, use AFSPacker to extract to a folder called data without leaving a filelist.
  * Uncompressed Game data: Run game.bin, sub_main.bin and lobby.bin through PZZComp_JoJo, put the uncompressed files in a folder called unpacked.
  
  Your MH1Plus folder should look like the following:
  ```
  MH1Plus
  ┣.vscode (VSCode build tasks)
  ┣asm (MH1Plus code)
  ┣data (game data)
  ┣unpacked (uncompressed game data)
  ┃┣game.bin
  ┃┣lobby.bin
  ┃┗sub_main.bin
  ┣AFS_DATA.AFS
  ┣AFSPacker.exe
  ┣Armips.exe
  ┣Datafiles.txt
  ┣main.asm
  ┣ogSLUS_208.96
  ┣pack.bat
  ┣packscheme.bat
  ┗PZZComp_JoJo.exe
  ```

## Building
  The repository contains build tasks for VSCode, otherwise just run Pack.bat for XSwap (Only swaps X and O actions) or packscheme for the full patch (Including PSP controls), the building process ends when AFSPacker finishes packing AFS_DATA.AFS.

  After the batch file is done, you'll have two important files, SLUS_208.96 (the game's main executable with some modifications) and a modified AFS_DATA.AFS, you can use any iso tool to replace these two files in an MH1US iso, once the iso is modified, it can be run in an emulator or a real PS2 (as long as the tool of choice doesn't rebuild the iso from scratch).


## Distributing your modifications
  Using an XDelta tool, you can generate xdelta patches by providing an original iso and your modified copy, by making an xdelta patch you can share your modifications without sharing actual game files, as that would be illegal.

# Additions
  * All player in-quest actions have been remapped to the O button, this includes (among other things):
  ** Gathering
  ** Carving
  ** Supply Box and Delivery Box
  ** Climbing
  * Rolling has been restored to the X button, this includes basic rolling, weapon rolling and Lance hops.
  * Additionally, you can build the patch to use the PSP control scheme.

# PSP Controls
## General
  * Tutorial Button has been moved to L3 from Δ.
  * Map Zoom Button has been moved to R3 from Select.
  * Only □ Button can sheathe now.
  * Camera can be controlled with the Right Analog Stick as well as the D-Pad.
## Great Sword
  * Δ Button: Forwards Slash
  * O Button: Side-Slash
  * Δ + O Buttons: Backwards Slash
  * Select Button: Kick
## Sword and Shield
  * Δ Button: Combo Attacks
  * O Button: Round Slash
  * Δ + O Buttons: Lunge Attack
  * R1 + O Button: Shield Slash
  * R1 + Δ Button: Uppercut Slash
  * Roll + Δ  Button: Uppercut Slash
## Dual Blades
  * Δ Button: Combo Attacks / Demon Combo Attacks
  * O Button: Spin Attack Right / Demon Spin Attack Right
  * Select Button or Hold Left Stick to the Left + O: Spin Attack Left / Demon Spin Attack Left
  * Δ + O Button: Lunge Attack / Demon Rush Attack
## Hammer
  * Δ Button: Stomp Combo
  * O Button: Side-slam
  * Charge + Δ Button: Charge Attack
## Lance
  * Δ Button: Medium Poke
  * O Button: High Poke
  * X Button: Hop Back
  * R1 + Δ or O Button: Shield Poke
  * Δ + O Buttons: Start Charging / Stop Charging
  * Δ or O Button while Charging: Slide Poke
## Bowguns
  * Δ Button: Reload
  * O Button: Fire
  * Select Button or Δ + O Buttons: Melee Strike

# To-Do
  * Clean up code, many things are messy.
  * Fix a few problems with Lance input, weapon is fully usable but charge moves need a good scrubbing.
  * Implement hold to carve/gather when crouching (Easy peasy).

## Other planned features
  These will all be part of an optional rebalance patch.
  
  * Figure out a way to make item use not sheathe your weapon, then enable item use with SnS.
  * Port F1/Dos weapon MVs.
  ** Enhance the sharpness values for all Dual Blades.
  * Make Velocidrome, Gendrome and Iodrome not flinch on every hit.
  * Give Bullfangos less health and reduce their aggro range.
  * Reduce Melynx's aggro range.
  * Rework the Village's quest list to allow access to more online-only content.
  * Rework the Weapon Crafting Trees to better mesh with the new quest list.
  * Implement new weapons (Make Dual Blades into its own weapon tree separate from SnS).
  ** Import Dos weapons for monsters that exist in MH1, such as the Kut-Ku Great Sword and Drome Nail.
  * Implement some new armors (Basarios, complete Kut-Ku/Diablos sets, etc.).
