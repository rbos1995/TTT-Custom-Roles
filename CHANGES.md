# Innocents
## Detective
- Fixed Detective call icon not going away when a body is searched.

## Mercenary
- Added setting to allow Mercenary to buy all Traitor and/or Detective weapons in their shop. See [Configuration](CONVARS.md).

## Phantom
- Added bloody footprints following the Phantom's killer. See [Configuration](CONVARS.md) to disable.
- Added ability to haunt the Phantom's killer and perform various actions. See [Configuration](CONVARS.md) to disable and adjust costs.
- Added ability for Phantom to come back with decreasing health each time they are killed. See [Configuration](CONVARS.md) to enable.

# Traitors
- Made Hypnotist and Assassin more integrated traitor team members by
  - Allowing transferring of credits.
  - Allowing them to use Traitor voice chat.
  - Adding setting to allow Assassin and/or Hypnotist to buy all Traitor weapons in their shop. See [Configuration](CONVARS.md).
  - Changing traitor radar colors to be red for all traitor team members to make it easier to see.
- Added ability to show outlines around other members of the traitor team (including the Glitch). See [Configuration](CONVARS.md).
- Added new Detraitor role -- an evil and sneaky Detective. See [Configuration](CONVARS.md) to enable.

## Assassin
- Added ability to show "Kill" icon over target's head. See [Configuration](CONVARS.md) to enable.
- Added ability to set starting credits. See [Configuration](CONVARS.md).
- Fixed target change announcement showing even when you were dead.

## Hypnotist
- Added ability to set starting credits. See [Configuration](CONVARS.md).

# Monsters
- Created new "Monsters" team with Zombie and Vampire to ensure they fight against all players, rather than allied with Traitors.
  - This change is disablable by enabling the _ttt\_monsters\_are\_traitors_ ConVar. See [Configuration](CONVARS.md) for more information.
  - You can also decide individually whether Zombies or Vampires should be traitors by enabling the _ttt\_zombies\_are\_traitors_ or _ttt\_vampires\_are\_traitors_ ConVars. See [Configuration](CONVARS.md) for more information.
- Created new icons to handle previously-unexpected zombification and hypnotization cases.
- Ported the following from Town of Terror. See [Configuration](CONVARS.md) to disable.
  - "Zombie Vision" for both Zombie and Vampire.
  - "Kill" icon above other players' heads.
  - Configurable bullet damage reduction. See [Configuration](CONVARS.md).

## Zombie
- Ported/Inspired by Infected from Town of Terror.
  - Claw attack look (model, animation) and feel (range, damage, spread).
  - Jump attack. See [Configuration](CONVARS.md) to disable.
  - Spit attack. See [Configuration](CONVARS.md) to disable.
  - Configurable damage scaling when not using the claws. See [Configuration](CONVARS.md).
- Added recoil to Spit attack.
- Made Spit not 100% accurate.
- Changed spawned Zombies (e.g. Zombies created by dying to the Zombie claws) to configurably disallow picking up weapons. See [Configuration](CONVARS.md).

## Vampire
- Fixed sometimes not decloaking when using the fangs' right-click.
- Added smoke effect for when Vampire fades.
- Added configurable bullet damage reduction similar to Infected from Town of Terror. See [Configuration](CONVARS.md).
- Added the ability to drain the blood of a living target, converting them to a Vampire or killing them and healing the player.
  - Added configurations for the amount of time it takes to drain a target's blood and the amount of health healed. See [Configuration](CONVARS.md).

# Killer
- Ported the following from Town of Terror. See [Configuration](CONVARS.md) to disable all but the buyable throwable crowbar.
  - Knife (with smoke grenade).
  - Buyable throwable crowbar.
  - "Your Evil is Showing" smoke.
  - "Wall Hack Vision".
  - "Kill" icon above other players' heads.
  - Configurable bullet damage reduction. See [Configuration](CONVARS.md).
  - Configurable damage scaling when not using the knife. See [Configuration](CONVARS.md).
- Change default max health to 100 to match the other roles. See [Configuration](CONVARS.md) to change.
- Added new section to the scoreboard for the Killer since there can be a Killer and a Jester/Swapper now.
- Added ttt_killer_warn_all which allows notifying all players about the Killer. See [Configuration](CONVARS.md) to enable.

# Jester/Swapper
- Added configurations on whether to allow traitor team to know that a "Jester" is actually a Swapper. See [Configuration](CONVARS.md).
- Added Jester/Swapper kill celebrations ("Yay" sound and confetti), enablable via configuration. See [Configuration](CONVARS.md).
- Added ConVar for making traitors killing Jester not end the game. See [Configuration](CONVARS.md).
- Changed Jester/Swapper to not take damage from more sources to prevent certain addon weapons from killing them.
- Fixed Jester/Swapper being able to do damage with fire weapons due to fire tracking not updating properly.

# Additions
## Misc.
- Added CVars to disable logging of damage/kills and role selection.
- Updated credit transfer system to allow bots as a target (for testing).

## Weapons and Equipment
- Added ability to search within the role shop
- Ported ability to load weapons into role weapon shops from Town of Terror. See [Configuration](CONVARS.md).
  - Added ability for more roles to have a shop (Jester and Swapper)
- Added ability to exclude weapons from role weapon shops. See [Configuration](CONVARS.md).
- Added ability to change which weapons show in the shop each round by random chance. See [Configuration](CONVARS.md).
  - Added the ability for specific weapons to bypass the shop randomization. See [Configuration](CONVARS.md).
- Added ability to have up to 32 different equipment items (from the workshop), up from 16.

## Round Summary
- Updated end-of-round summary to merge the old tabs and buttons with the new interface.
- Added initial role assignments and role changes to the end-of-round summary Events tab.
- Added new events for the new roles to the end-of-round summary Events tab. Thanks to [exp111](https://github.com/exp111/TTT-Custom-Roles/) on GitHub.
- Changed zombified/hypnotized players to stay on their normal part of the end-of-round summary.

## Sprint
- Re-added the Sprint configuration menu when pressing F1. Thanks to [exp111](https://github.com/exp111/TTT-Custom-Roles/) on GitHub.
- Added a setting to disable the sprint functionality. See [Configuration](CONVARS.md).

## Double Jump
- Integrated the [Double Jump!](https://steamcommunity.com/sharedfiles/filedetails/?id=284538302) mod but replaced the particle usage with effects generation to remove the TF2 requirement.
- Added a setting to disallow multi-jumping if you didn't jump originally (e.g. were batted or fell). See [Configuration](CONVARS.md).

# Changes
- Changed role spawning to not do hidden math to determine role chance. Uses the CVars values directly instead.
- Changed ttt\_\*\_pct ConVars to round down instead of rounding up to bring the logic inline with how vanilla TTT does it.
- Changed crowbar to be droppable but not drop on death.

# Fixes
- Fixed traitor voice chat so regular vanilla Traitors can do global chat (or traitor-only chat by using the "Sprint (Walk quickly)" keybind) like the other traitor roles.
- Fixed sv_voiceenable being ignored.
- Fixed a player's role not being shown over their head for Detectives if that player was killed, their body identified (by the Detective), and then they were resurrected.
- Fixed players whose role was revealed (via a Detective searching their body) not having their role hidden again when they are brainwashed.
- Fixed shop opening (instead of post-round summary) when a player who was a Traitor presses 'c' if a game goes from "In Progress" to "Waiting".
- Fixed players who were killed as Swapper and then were killed again not showing as dead in the post-round summary.
- Fixed Swapper not having "Unarmed", "Magneto Stick", and "Crowbar" weapons after swapping sometimes.
- Fixed player who was Hypnotized, Zombified, or Vampified and then killed the Swapper not having the correct role icon in the round summary.
- Fixed not being able to transfer credits to other members of your team.
- Fixed magneto ragdoll pinning instructions text not showing for non-Traitors when ttt_ragdoll_pinning_innocents was enabled.
- Fixed some weapons showing the wrong name in the Event Log.
- Fixex GMod sprint working with infinite "stamina" and increased speed.
- Fixed players being able to GMod sprint if they die before the round starts.
- Fixed crash due to infinite loop when nobody's karma is enough to satisfy the minimum Detective requirement.
- Fixed missing icons in some situations by adding icons as downloaded resources.
- Fixed hand-to-ear animation not playing for non-traitors as a traitor using global chat.
- Fixed minor issue with Zombie health regen not obeying max health.
- Fixed sporadic error in kill message when a player is killed by a flying entity.
- Fixed disguiser functionality.
- Fixed Post-round Deathmatch not working even when ttt_postround_dm was enabled.
- Fixed long names overrunning the round summary columns.
- Fixed players brainwashed by Hypnotists not keeping their old credits.
- Fixed players who are respawned after the round starts to show as "Resurrected" in the post-round summary.
- Fixed error calculating karma when an innocent kills a killer.

# Mod Compatibility
- Added abiltiy for addons to tell Custom Roles that a player's role was changed so it shows properly in the scoreboard.
- Added ability for addons to log information into the round summary Events tab.
- Added ability to override sprint key via hook so mods (like my Randomat 2.0) could let you sprint backwards.
- Added chat support for name overrides via the ULX SetName addon.
- Added support to the end-of-round summary and logic for multiples Jesters, Killers, or Swappers in case an external addon (like the Randomat) does that.
- Added "TTTSpeedMultiplier" hook to allow other mods (like the Randomat) to set multiple custom speed multipliers.
- Added sprint speed logic for the Randomat Murder event's knife speed boost.
- Changed credits transfer tab to only show if you have a shop so mods (like my Randomat 2.0) that give everyone credits don't cause confusion.
- Changed Radar and Disguiser to allow anyone to use them if they are given then (e.g. by another addon).
- Fixed restarting a round not notifying other addons that the round ended.
- Fixed ULX "Force Next Round" not working for Innocent role.
- Fixed conflicts with certain buyable weapons (like the Time Manipulator). Thanks Angela and Technofrood from the [Lonely Yogs](https://lonely-yogs.co.uk/) Discord!
- Fixed compatibility with [Dead Ringer](https://steamcommunity.com/sharedfiles/filedetails/?id=810154456) weapon so that Detectives who use it don't have their target icon ("D" over their head) visible when they should be cloaked.
- Fixed compatibility with [TTT Max Players](https://steamcommunity.com/sharedfiles/filedetails/?id=211029744) to get rid of random floating magneto sticks from players who were forced to spectator.
