# simple-bot-start

## Version
0.1.0

## Description
A simple mod for Factorio where you start the game with exoskeleton armor with 1x fission reactor, 2x personal robotports MK2, night vision, 1x exoskeleton and 50x fusion construction robots. The exoskeleton armor offers no protection and its grid is locked so equipment can't be taken out. Fusion construction robots are fireproof, don't need to recharge and are faster than their vanilla counterpart. Their max speed is limited, however, which means that normal construction robots become faster after researching worker robot speed 5. 

Both items can't be crafted so you get what you get.

In single player, the mod attempts to spawn the exoskeleton armor and fusion construction robots in the debris of the spaceship. Since the vanilla function "set_debris_items" stops inserting items with no message if there is no more space, it can happen that the items don't spawn properly. In this case there is a custom command, /sbs-give-armor, that allows player whose armor is missing to spawn it. In multiplayer, if there are less than 4 players, the mod attempts to spawn the item in the debris as well. If there are more, the items should spawn directly in the inventory of the players. The multiplayer functionality, however, hasn't been tested yet. 

The sprites of the fusion construction robots were inspired by the mod "fusion robots" of mindmix. As his mod is rather old and its graphis not up-to-date, I tried to make the construction robots look "fusion" myself. If anyone wants my gimp project files, feel free to contact me.

## Planned Features
- Refine the item spawing and detection script
- Add settings so only administrators can spawn the armor for players
- Add a setting that makes the armor spawn for players who join later.

## Available Settings
Currently None

## Known Issues
Probably many. 
