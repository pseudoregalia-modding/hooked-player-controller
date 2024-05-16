set game_folder=C:\Program Files (x86)\Steam\steamapps\common\Pseudoregalia\pseudoregalia
set pak_name=hooked_player_controller_v000_p.pak

make_pak.py --asset-list asset_list.txt --output "%game_folder%\Content\Paks\%pak_name%"
REM call "%game_folder%\Binaries\Win64\pseudoregalia-Win64-Shipping.exe"
pause
