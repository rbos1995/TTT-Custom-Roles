Thanks to [Jenssons](https://steamcommunity.com/profiles/76561198044525091) for the 'Town of Terror' mod which was the foundation of this mod.\
Thanks to [Noxx](https://steamcommunity.com/id/noxxflame), [Lix3](https://steamcommunity.com/id/lix3), and [Kommandos0](https://steamcommunity.com/id/Kommandos0) for the original version of this mod.\
\
**Edits the original version to restore some of the Town of Terror functionality**

# Innocent Team
Goal: Kill all members of the traitor and monsters teams\
\
**Innocent** - A standard player. Has no special abilities\
**Detective** - Inspect dead bodies to help identify the baddies\
**Glitch** - An innocent that appears as a Traitor to members of the Traitor team\
**Mercenary** - An innocent with a weapon shop\
**Phantom** - Will haunt your killer, showing black smoke. When avenged, you have another chance for life

# Traitor Team
Goal: Kill all non-team members (except Jester/Swapper)\
\
**Traitor** - Use your extensive weapon shop to help your team win\
**Assassin** - Kill all of your targets in order to do massive damage and win for the Traitor team\
**Hypnotist** - Use your brain washing device on dead players to make more traitors\
**Detraitor** - An evil replacement for the Detective who has access to all detective features (e.g. body search, detective buy menu) and appears to be a detective to non-traitors. **Not enabled by default. See [Configuration](CONVARS.md) to enable.**

# Monster Team
Goal: Kill all non-monsters (except Jester/Swapper)\
\
**Vampire** - Kill players and use your fangs to convert other players, regain health, and fade from view\
**Zombie** - Kill players with your claws to make more zombies\
\
NOTE: Vampire and Zombie can be included in the Traitor team via the _ttt_monsters_are_traitors_ ConVar. See [Configuration](CONVARS.md) for more information

# Independent Players
Goal: Work on your own to win the round by playing your role carefully\
\
**Jester** - Get killed by another player\
**Swapper** - Get killed by another player and then fulfill their old goal\
**Killer** - Be the last player standing

# Special Thanks
- [Jenssons](https://steamcommunity.com/profiles/76561198044525091) for the ['Town of Terror'](https://steamcommunity.com/sharedfiles/filedetails/?id=1092556189) mod which was the foundation of this mod.
- [Noxx](https://steamcommunity.com/id/noxxflame), [Lix3](https://steamcommunity.com/id/lix3), and [Kommandos0](https://steamcommunity.com/id/Kommandos0) for the [original version](https://steamcommunity.com/sharedfiles/filedetails/?id=1215502383) of this mod.
- [Long Long Longson](https://steamcommunity.com/id/gamerhenne) for the ['Better Equipment Menu'](https://steamcommunity.com/sharedfiles/filedetails/?id=878772496) mod
- [Silky](https://steamcommunity.com/profiles/76561198094798859) for the code used to create the pile of bones after the Vampire eats a body taken from the ['TTT Traitor Weapon Evolve'](https://steamcommunity.com/sharedfiles/filedetails/?id=1240572856) mod.
- [Minty](https://steamcommunity.com/id/_Minty_) for the code used for the Hypnotist's brain washing device taken from the ['Defibrillator for TTT'](https://steamcommunity.com/sharedfiles/filedetails/?id=801433502) mod.
- [Fresh Garry](https://steamcommunity.com/id/Fresh_Garry) for the ['TTT Sprint'](https://steamcommunity.com/sharedfiles/filedetails/?id=933056549) mod which was used as the base for this mods sprinting mechanics.
- [Willox](https://steamcommunity.com/id/willox) for the ['Double Jump!'](https://steamcommunity.com/sharedfiles/filedetails/?id=284538302) mod.
- Kommandos, Lix3, FunCheetah, B1andy413, Cooliew, The_Samarox, Arack12 and Aspirin for helping Noxx test.
- Angela and Technofrood from the [Lonely Yogs](https://lonely-yogs.co.uk/) Discord for the fix for some traitor weapon incompatibilities.
- Alex and other members of the [Lonely Yogs](https://lonely-yogs.co.uk/) Discord for using my versions of these addons and helping me fix and improve them.
- Kobus and Alex of the [Lonely Yogs](https://lonely-yogs.co.uk/) Discord for creating a bunch new role icons.
- u/ToXiN_reddit on Reddit for suggesting disallowing multi-jump if you didn't originally jump.
- u/Trenched_Colonel, u/JeremyDaBanana, and u/JanuryFirstCakeDay on Reddit for the ideas behind my implementation of the Detraitor role.
- u/The00Devon on Reddit for the idea for the Killer smoke countdown warning.
- u/Left4DayZ1 on Reddit for the ideas for Phantom killer footprints and haunting features.
- u/nd4spd1919 on Reddit for the idea for the role shop item randomization feature.
- [Blim](https://steamcommunity.com/profiles/76561198050743605/) for help finding an infinite loop that could crash the game if nobody had enough karma to be a Detective.
- [GengarDC](https://steamcommunity.com/id/GengarDC) for his [TTT_Double_Jump_Nerfed](https://steamcommunity.com/sharedfiles/filedetails/?id=1962801891) mod whose functionality was integrated via a setting.
- [KuMaGR](https://steamcommunity.com/id/kuma96) for his [TTT Glowing Traitors](https://steamcommunity.com/sharedfiles/filedetails/?id=690007939) mod which was the basis for the idea behind the Traitor team highlight feature.
- [LeBroomer](https://steamcommunity.com/id/LeBroomer) for his [TTT Demonic Possession](https://steamcommunity.com/sharedfiles/filedetails/?id=1403395766) mod which was used for the basis of the Phantom haunting UI.
- The Stig for providing feedback and helping to verify bug fixes.

# Changes from the Original Version
See [here](CHANGES.md)

# Conflicts
- Any other addon that adds roles such as Town of Terror, TTT2, or the original version of Custom Roles for TTT. There is no reason to use more than one role addon so remove all the ones you don't want.
- [Better Equipment Menu](https://steamcommunity.com/sharedfiles/filedetails/?id=878772496) - This has its functionality built in
- [TTT Damage Logs](https://github.com/Tommy228/tttdamagelogs)
- [TTT DeadRinger](https://steamcommunity.com/sharedfiles/filedetails/?id=2045444087) - Overrides several scripts that are core to TTT that this also overrides (notably, the scoreboard and client initialization). As a workaround, you can use [this version](https://steamcommunity.com/sharedfiles/filedetails/?id=810154456) instead.

# Configuration
See [here](CONVARS.md)

# FAQs
**Do I need the other version of Custom Roles or Town of Terror as well?**\
No, you should only use one addon that adds roles. That means only this version of Custom Roles, no Town of Terror, no TT2, etc.

**This lags everyone when I play on my peer-to-peer (aka listen, aka local) server/game**\
Everyone needs to subscribe to this workshop item, not just the host. I'm not sure why that is, it's the same for every version of this addon not just mine.\
\
I would suggest making a workshop collection of the addons you have and then having your friends subscribe to them all.

**How do I change X, Y, or Z?**\
Check out the [Configuration](CONVARS.md) page and add the setting value you want in your server.cfg. If you don't see a setting for what you want to change, leave a comment and I'll either help you find it or try to add one.

**How do I make a Detective spawn every round?**\
Set the following settings:\
\
_ttt_detective_min_players_ 1\
_ttt_detective_pct_ 1\
\
Also if you want ONLY one detective, set:\
_ttt_detective_max_ 1

# Workshop
Click [here](https://steamcommunity.com/sharedfiles/filedetails/?id=2045444087) to view the workshop page in your browser or copy/paste this to open it in Steam: steam://openurl/steamcommunity.com/sharedfiles/filedetails/?id=2045444087
