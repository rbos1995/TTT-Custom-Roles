# Server Configurations

Add the following to your server config:

```cpp
// ----------------------------------------
// Custom Role Settings
// ----------------------------------------

ttt_glitch_enabled    1 // Whether the Glitch should spawn or not
ttt_mercenary_enabled 1 // Whether the Mercenary should spawn or not
ttt_phantom_enabled   1 // Whether the Phantom should spawn or not
ttt_assassin_enabled  1 // Whether the Assassin should spawn or not
ttt_hypnotist_enabled 1 // Whether the Hypnotist should spawn or not
ttt_vampire_enabled   1 // Whether the Vampire should spawn or not
ttt_zombie_enabled    1 // Whether Zombies should spawn or not
ttt_jester_enabled    1 // Whether the Jester should spawn or not
ttt_swapper_enabled   1 // Whether the Swapper should spawn or not
ttt_killer_enabled    1 // Whether the Killer should spawn or not
ttt_detraitor_enabled 0 // Whether the Detraitor should spawn or not

// Role Spawn Chances
ttt_glitch_chance    0.25 // Chance of the Glitch spawning in a round. NOTE: Glitch will only spawn if there are 2 vanilla traitors in the round. Any less than that and the Glitch is made obvious by looking at the scoreboard
ttt_mercenary_chance 0.25 // Chance of the Mercenary spawning in a round
ttt_phantom_chance   0.25 // Chance of the Phantom spawning in a round
ttt_assassin_chance  0.20 // Chance of the Assassin spawning in a round
ttt_hypnotist_chance 0.20 // Chance of the Hypnotist spawning in a round
ttt_vampire_chance   0.20 // Chance of the Vampire spawning in a round
ttt_zombie_chance    0.10 // Chance of Zombies replacing traitors in a round
ttt_jester_chance    0.25 // Chance of the Jester spawning in a round
ttt_swapper_chance   0.25 // Chance of the Swapper spawning in a round
ttt_killer_chance    0.25 // Chance of the Killer spawning in a round
ttt_detraitor_chance 0.20 // Chance of the Detraitor spawning in a round

// Role Spawn Requirements
ttt_glitch_required_innos       2 // Number of innocents for the Glitch to spawn
ttt_mercenary_required_innos    2 // Number of innocents for the Mercenary to spawn
ttt_phantom_required_innos      2 // Number of innocents for the Phantom to spawn
ttt_assassin_required_traitors  2 // Number of traitors for the Assassin to spawn
ttt_hypnotist_required_traitors 2 // Number of traitors for the Hypnotist to spawn
ttt_vampire_required_traitors   2 // Number of traitors for the Vampire to spawn
ttt_jester_required_innos       2 // Number of innocents for the Jester to spawn
ttt_swapper_required_innos      2 // Number of innocents for the Swapper to spawn
ttt_killer_required_innos       3 // Number of innocents for the Killerto spawn
ttt_detraitor_required_traitors 2 // Number of traitors for the Detraitor to spawn

// Role Percentages
ttt_traitor_pct   0.25 // Percentage of total players that will be traitors
ttt_detective_pct 0.13 // Percentage of total players that will be detectives
ttt_monster_pct   0.25 // Percentage of total players that will be monsters (Zombies or Vampires)

// Karma
ttt_karma_jesterkill_penalty 50  // Karma penalty for killing the Jester
ttt_karma_jester_ratio       0.5 // Ratio of damage to Jesters, to be taken from karma

// Weapon Shop
ttt_shop_merc_mode      0     // How to handle Mercenary shop weapons. All modes include weapons specifically mapped to the Mercenary role. 0 (Disable) - Do not allow additional weapons. 1 (Union) - Allow weapons available to EITHER the Traitor or the Detective. 2 (Intersect) - Allow weapons available to BOTH the Traitor and the Detective. 3 (Detective) - Allow weapons available to the Detective. 4 (Traitor) - Allow weapons available to the Traitor.
ttt_shop_assassin_sync  0     // Whether Assassins should have all weapons that vanilla Traitors have in their weapon shop
ttt_shop_hypnotist_sync 0     // Whether Hypnotists should have all weapons that vanilla Traitors have in their weapon shop
ttt_shop_random_percent 50    // The percent chance that a weapon in the shop will be not be shown
ttt_shop_random_tra_enabled 0 // Whether role shop randomization is enabled for Traitors
ttt_shop_random_asn_enabled 0 // Whether role shop randomization is enabled for Assassins
ttt_shop_random_hyp_enabled 0 // Whether role shop randomization is enabled for Hypnotists
ttt_shop_random_der_enabled 0 // Whether role shop randomization is enabled for Detraitors
ttt_shop_random_det_enabled 0 // Whether role shop randomization is enabled for Detectives
ttt_shop_random_mer_enabled 0 // Whether role shop randomization is enabled for Mercenary
ttt_shop_random_vam_enabled 0 // Whether role shop randomization is enabled for Vampires
ttt_shop_random_zom_enabled 0 // Whether role shop randomization is enabled for Zombies
ttt_shop_random_kil_enabled 0 // Whether role shop randomization is enabled for Killers

// Credits
ttt_mer_credits_starting 1 // Number of credits the Mercenary starts with
ttt_kil_credits_starting 2 // Number of credits the Killer starts with
ttt_asn_credits_starting 0 // Number of credits the Assassin starts with
ttt_hyp_credits_starting 0 // Number of credits the Hypnotist starts with
ttt_zom_credits_starting 0 // Number of credits the Zombie starts with
ttt_vam_credits_starting 0 // Number of credits the Vampire starts with
ttt_der_credits_starting 2 // Number of credits the Detraitor starts with

// Innocents
ttt_phantom_weaker_each_respawn      0   // Whether a Phantom respawns weaker (1/2 as much HP) each time they respawn, down to a minimum of 1
ttt_phantom_killer_footstep_time     10  // The amount of time a Phantom's killer's footsteps should show before fading. 0 to disable
ttt_phantom_killer_smoke             1   // Whether to show smoke on the player who killed the Phantom
ttt_phantom_killer_haunt             1   // Whether to have the Phantom haunt their killer
ttt_phantom_killer_haunt_power_max   100 // The maximum amount of power a Phantom can have when haunting their killer
ttt_phantom_killer_haunt_power_rate  5   // The amount of power to regain per second when a Phantom is haunting their killer
ttt_phantom_killer_haunt_move_cost   50  // The amount of power to spend when a Phantom is moving their killer via a haunting. 0 to disable
ttt_phantom_killer_haunt_attack_cost 75  // The amount of power to spend when a Phantom is making their killer attack via a haunting. 0 to disable
ttt_phantom_killer_haunt_jump_cost   30  // The amount of power to spend when a Phantom is making their killer jump via a haunting. 0 to disable
ttt_phantom_killer_haunt_drop_cost   25  // The amount of power to spend when a Phantom is making their killer drop their weapon via a haunting. 0 to disable

// Killer
ttt_killer_knife_enabled    1    // Whether the Killer knife is enabled
ttt_killer_max_health       100  // The Killer's starting and maximum health
ttt_killer_smoke_enabled    1    // Whether the Killer smoke is enabled
ttt_killer_smoke_timer      60   // Number of seconds before a Killer will start to smoke after their last kill
ttt_killer_vision_enable    1    // Whether Killers have their special vision highlights enabled
ttt_killer_show_target_icon 1    // Whether Killers have an icon over other players' heads showing who to kill. Server or round must be restarted for changes to take effect.
ttt_killer_damage_scale     0.25 // The fraction a Killer's damage will be scaled to when they are attacking without using their knife.
ttt_killer_damage_reduction 0.55 // The fraction an attacker's bullet damage will be reduced to when they are shooting a Killer.
ttt_killer_warn_all         0    // Whether to warn all players if there is a Killer. If 0, only traitors will be warned

// Monsters
ttt_monsters_are_traitors      0   // Whether Monsters (Zombies and Vampires) should be treated as members of the Traitors team. If enabled, ttt_monster_pct is not used.
ttt_zombies_are_traitors       0   // Whether Zombies should be treated as members of the Traitors team.
ttt_vampires_are_traitors      0   // Whether Vampires should be treated as members of the Traitors team.
ttt_vampire_vision_enable      1   // Whether Vampires have their special vision highlights enabled
ttt_vampire_convert_enable     1   // Whether Vampires have the ability to drain other players' blood using their fangs
ttt_vampire_show_target_icon   1   // Whether Vampires have an icon over other players' heads showing who to kill. Server or round must be restarted for changes to take effect.
ttt_vampire_damage_reduction   0.8 // The fraction an attacker's bullet damage will be reduced to when they are shooting a Vampire.
ttt_vampire_fang_timer         5   // The amount of time fangs must be used to fully drain a target's blood
ttt_vampire_fang_heal          50  // The amount of health a Vampire will heal by when they fully drain a target's blood
ttt_vampire_fang_overheal      25  // The amount over the Vampire's normal maximum health (e.g. 100 + this ConVar) that the Vampire can heal to by drinking blood.
ttt_vampire_prime_death_mode   0   // What to do when the Prime Vampire(s) (e.g. playters who spawn as Vampires originally) are killed. 0 - Do nothing. 1 - Kill all non-prime Vampires. 2 - Revert all non-prime Vampires to their original role.
ttt_vampire_prime_only_convert 1   // Whether only Prime Vampires (e.g. players who spawn as Vampire originally) are allowed to convert other players.
ttt_zombie_vision_enable       1   // Whether Zombies have their special vision highlights enabled
ttt_zombie_spit_enable         1   // Whether Zombies have their spit attack enabled
ttt_zombie_leap_enable         1   // Whether Zombies have their leap attack enabled
ttt_zombie_show_target_icon    1   // Whether Zombies have an icon over other players' heads showing who to kill. Server or round must be restarted for changes to take effect.
ttt_zombie_damage_scale        0.2 // The fraction a Zombie's damage will be scaled to when they are attacking without using their knife.
ttt_zombie_damage_reduction    0.8 // The fraction an attacker's bullet damage will be reduced to when they are shooting a Zombie.
ttt_zombie_prime_only_weapons  1   // Whether only Prime Zombies (e.g. players who spawn as Zombies originally) are allowed to pick up weapons.

// Jesters
ttt_jester_win_by_traitors  1   // Whether the Jester will win the round if they are killed by a traitor
ttt_jester_notify_mode      1   // The logic to use when notifying players that a Jester is killed. 0 - Don't notify anyone. 1 - Only notify Traitors and Detective. 2 - Only notify Traitors. 3 - Only notify Detective. 4 - Notify everyone.
ttt_jester_notify_sound     0   // Whether to play a cheering sound when a Jester is killed
ttt_jester_notify_confetti  0   // Whether to throw confetti when a Jester is a killed
ttt_swapper_respawn_health  100 // What amount of health to give the Swapper when they are killed and respawned
ttt_swapper_notify_mode     1   // The logic to use when notifying players that a Swapper is killed. 0 - Don't notify anyone. 1 - Only notify Traitors and Detective. 2 - Only notify Traitors. 3 - Only notify Detective. 4 - Notify everyone.
ttt_swapper_notify_sound    0   // Whether to play a cheering sound when a Swapper is killed
ttt_swapper_notify_confetti 0   // Whether to throw confetti when a Swapper is a killed

// Other
ttt_traitor_vision_enable             0 // Whether members of the Traitor team can see other members of the Traitor team (including Glitches) through walls via a highlight effect.
ttt_assassin_show_target_icon         0 // Whether Assassins have an icon over their target's heads showing who to kill. Server or round must be restarted for changes to take effect.
ttt_detective_search_only             1 // Whether only Detectives can search bodies or not
ttt_all_search_postround              1 // Whether to allow anyone to search bodies in the post-round time
ttt_player_set_model_on_initial_spawn 1 // Whether to set a player's model when they first join the server. Set to false if your players are not enforcing their custom player models.
ttt_player_set_model_on_new_round     1 // Whether to set a player's model when they spawn on each new round. Set to false if your players are not enforcing their custom player models.
ttt_player_set_model_on_respawn       1 // Whether to set a player's model when they are respawned. Set to false if your players are not enforcing their custom player models.
ttt_traitors_jester_id_mode           1 // The logic to use when a member of the traitor team is identifying a member of the Jester team (by looking at them, on the scoreboard, etc). 0 - Don't show either Jester or Swapper. 1 - Show both as Jester. 2 - Show Jester as Jester and Swapper as Swapper. 3 - Show Jester but don't show Swapper. 4 - Show Swapper but don't show Jester
ttt_monsters_jester_id_mode           1 // The logic to use when a member of the monsters team is identifying a member of the Jester team (by looking at them, on the scoreboard, etc). 0 - Don't show either Jester or Swapper. 1 - Show both as Jester. 2 - Show Jester as Jester and Swapper as Swapper. 3 - Show Jester but don't show Swapper. 4 - Show Swapper but don't show Jester
ttt_killers_jester_id_mode            1 // The logic to use when the Killer is identifying a member of the Jester team (by looking at them, on the scoreboard, etc). 0 - Don't show either Jester or Swapper. 1 - Show both as Jester. 2 - Show Jester as Jester and Swapper as Swapper. 3 - Show Jester but don't show Swapper. 4 - Show Swapper but don't show Jester

// Sprint
ttt_sprint_enabled             1    // Whether to enable sprinting. NOTE: Disabling sprinting doesn't hide the bar on the client UI but it will never change from being 100% full
ttt_sprint_bonus_rel           0.4  // The relative speed bonus given while sprinting. (0.1-2)
ttt_sprint_big_crosshair       1    // Makes the crosshair bigger while sprinting.
ttt_sprint_regenerate_innocent 0.08 // Sets stamina regeneration for innocents. (0.01-2)
ttt_sprint_regenerate_traitor  0.12 // Sets stamina regeneration speed for traitors. (0.01-2)
ttt_sprint_consume             0.2  // Sets stamina consumption speed. (0.1-5)

// Logging
ttt_debug_logkills 1 // Whether to log when a player is killed in the console
ttt_debug_logroles 1 // Whether to log what roles players are assigned in the console

// Double Jump
multijump_default_jumps          1 // The amount of extra jumps players should get. Set to 0 to disable multiple jumps
multijump_default_power          1 // Multiplier for the jump-power when multi jumping
multijump_can_jump_while_falling 1 // Whether the player should be able to multi-jump if they didn't jump to begin with
multijump_max_fall_distance      0 // The maximum distance a player can fall before multi jump is disabled. 0 to disable
```

Thanks to [KarlOfDuty](https://github.com/KarlOfDuty) for his original version of this document, [here](https://github.com/KarlOfDuty/TTT-Custom-Roles/blob/patch-1/README.md).

# Role Weapon Shop

In TTT some roles have shops where they are allowed to purchase weapons. Given the prevalence of custom weapons from the workshop, the ability to add more weapons to each role's shop has been added.

## Adding Weapons

To add weapons to a role (that already has a shop), create a .txt file with the weapon class (e.g. weapon_ttt_somethingcool.txt) in the garrysmod/data/roleweapons/{rolename} folder.\
**NOTE**: If the _roleweapons_ folder does not already exist in garrysmod/data, create it.\
**NOTE**: The name of the role must be all lowercase for cross-operating system compatibility. For example: garrysmod/data/roleweapons/detective/weapon_ttt_somethingcool.txt

Also note the ttt_shop_* ConVars that are available above which can help control some of the role weapon shop lists.

## Removing Weapons

At the same time, there are some workshop weapons that are given to multiple roles that maybe you don't want to be available to certain roles. In order to handle that case, the ability to exclude weapons from a role's weapon shop has been added.

To remove weapons from a role's shop, create a .exclude.txt file with the weapon class (e.g. weapon_ttt_somethingcool.exclude.txt) in the garrysmod/data/roleweapons/{rolename} folder.\
**NOTE**: If the _roleweapons_ folder does not already exist in garrysmod/data, create it.\
**NOTE**: The name of the role must be all lowercase for cross-operating system compatibility. For example: garrysmod/data/roleweapons/detective/weapon_ttt_somethingcool.exclude.txt

## Finding a Weapon's Class

To find the class name of a weapon to use above, follow the steps below
1. Start a local server with TTT as the selected gamemode
2. Spawn 1 bot by using the _bot_ command in console
3. Obtain the weapon whose class you want. If it is already available to buy from a certain role's shop, either force yourself to be that role via the _ttt\_force\_*_ commands or via a ULX plugin.
4. Run the following command in console to get a list of all of your weapon classes: _lua\_run PrintTable(player.GetHumans()[1]:GetWeapons())_

## Adding Equipment

Equipment are items that a role can use that do not take up an equipment slot, such as the body armor or radar. To add equipment items to a role (that already has a shop), create a .txt file with the equipment item's name (e.g. "bruh bunker.txt") in the garrysmod/data/roleweapons/{rolename} folder.\
**NOTE**: If the _roleweapons_ folder does not already exist in garrysmod/data, create it.\
**NOTE**: The name of the role must be all lowercase for cross-operating system compatibility. For example: garrysmod/data/roleweapons/detective/bruh bunker.txt

## Finding an Equipment Item's Name

To find the name of an equipment item to use above, follow the steps below
1. Start a local server with TTT as the selected gamemode
2. Spawn 1 bot by using the _bot_ command in console
3. Obtain the equipment item whose name you want. If it is already available to buy from a certain role's shop, either force yourself to be that role via the _ttt\_force\_*_ commands or via a ULX plugin.
4. Run the following command in console to get a full list of your equipment item names: _lua\_run GetEquipmentItemById(EQUIP\_RADAR); lua\_run for id, e in pairs(EquipmentCache) do if player.GetHumans()[1]:HasEquipmentItem(id) then print(id .. " = " .. e.name) end end_