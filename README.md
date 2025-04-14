# simple-bot-start

## Version
0.1.0

## Description
A simple mod for Factorio where you start the game with basic exoskeleton armor and 50 fusion construction robots. The armor comes equipped with a fission reactor, an exoskeleton, night vision and two personal roboports MK2. The armor provides no physical protection and its grid is locked, so the equipment can't be removed later in the game. Fusion construction robots are fireproof, don't need to be recharged, and are initially faster than their vanilla counterparts. However, their maximum speed is limited, so normal construction robots will become faster than them after researching Worker Robot Speed 5. 

Both armor and fusion construction robots can't be crafted. So you get what you get. The aim of the mod is to give players an early start with robots, without the benefits of late game armour and equipment. 

At the start of a new single player game, the mod will attempt to place the items in the debris wreckage of the spaceship. Since the vanilla set_debris_items function stops inserting items when there's no more inventory space left, this may not work properly. In this case, the mod will spawn the items directly into the player's inventory after the intro.

In multiplayer, the items will be inserted directly into each player's inventory at the start of the game. 

If the mod is added later in the game, in both single and multiplayer, it will attempt to locate the spaceship wreckage to insert the items for each player. If it can't find the wreckage, or if there's no more room, the items will be inserted directly into each player's inventory. The reason for this different approach lies in the above mentioned limitation of the function "set_debris_items".

The sprites of the fusion construction robots were inspired by the "fusion robots" mod by mindmix. Since his graphics are from before the high resolution update, I tried to make the vanilla construction robots look more "fusion" myself. I'm not a designer, though, so if you want the GIMP files to improve their look feel free to contact me. 

## Compatibility
This mod should be compatible with the following mods: 
- Any Planet Start 

It is currently not compatible with the following mods:

## Planned features 


## Available Settings
- Admin command only - Only allow admins to use the /sbs-give-items command

## Known Issues
Probably many. 
