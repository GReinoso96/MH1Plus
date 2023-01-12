armips.exe main.asm -temp xswap.txt
pzzcomp_jojo.exe -c game.bin  game.bin
pzzcomp_jojo.exe -c sub_main.bin  sub_main.bin
pzzcomp_jojo.exe -c lobby.bin  lobby.bin
AFSPacker.exe -c data afs_data.afs datafiles.txt