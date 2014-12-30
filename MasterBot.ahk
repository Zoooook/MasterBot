#SingleInstance force
#NoEnv
#Include Settings.txt
#Include Fleets.txt
#Include Hotkeys.txt
#Include ScienceResearch.txt
#Include Program\PixelChecks.ahk
#Include Program\Functions.ahk
#Include Program\FlashClicks.ahk

/*

Pending Projects:
;direct to paypal donation page

Easy Projects:
;more lag protection, on load fleet and check if insufficient ships, on supply fleets, on buying mall ships maybe check if commanders and ship types have loaded -- route these to external functions
;add humaroid rewards, space raids to mail collection
;add more triggers to detect if broke

Medium Projects:
;Automatic refill SP and gold to do trials
;make sure buy passports spcards truce doesn't fail with not enough vouchers
;check for 0 helium
;Add options for retry main dailies

Bigger Projects:
;autodetect rockstime on altsrecruit by looking for orange or empty blue
;split up alt harvesting to keep fast farm running
;figure out a way to detect numfleets
;make trials smarter, only fill up every 5 or 10, check how far along you are
;handle server maintanence
;figure out how to guard against window switching during login

Do-able Projects:
;display when next alt log is
;user delay or start running alts

Trucing Shit:
;Retruce
;Retruce alts
;at least dismiss fleets if truce dies
;auto stop instance and dimiss fleets if under attack

Projects For Maybe Later:
;detect warehouse position - recenter ground base
;only do alts, no main
;alts just hit first steal rocks
;delay spins and dailies until inactive
;automatically update rocks time
;Rebuild fleets every
;change variables on the fly
;set fast league method of 1 ship on common
;League Fleet setup
;implement full science research checking

Etc:
;disclaimer and always watch first run for every fleet setup
;lag issues in tutorial
;figure out why fleet creation fails
;do not start bot with fleets in league or space raids probably

Unsorted:
;maybe harvest warehouse to fill league fleets up, if doesn't refill for instances after
;make idle time look at keyboard and mouse clicks too
;I think error catching for login is broke, it will route back to a chromeclick which won't account for the other window hanging
;automate shipbuilding on alts
;ez rewards with image detection
;fix window switching on login
;will probably break if disconnects with fleets in league

Test (this stuff should work):
;figure out helium if you start with fleets out - check with restricted, constellation, instance
;test cycling through midnight to same formation, see what happens
;test all combinations of logmain and scrollnum, with openbrowser=1
;check restrictedcount=3
;change coordinates of corps mall ship buying and daily quest collection, ahk is buggy when button clicks
;test spinsdailyrewards
;delay recruit/harvest if rocks or spins coming up - check
;check helium, league, and midnight
;figure out why it refills in between league matches, fix it
;  - test starting during league or clicking into league, with numfleets=0 or other, with midnight/rocks and not
;  - tested with start during league, numfleets=15, no midnight no rocks
;test login issues when start from blank tabs
;test possible interaction issues with idle time, disconnection delay time, and screensaver
;ez resetting over midnight
;test all combinations of midnight clicking during a restricted or other instance, with restricteds on or weike or off
;dailyquestrewards after restricteds if rocks and spins done
;unlockmain and unlockalts
;numalts=0
;harvestdelay=0 and altsrecruit



Bag Notes:

    ;1 - Confirm
ChallengingChest=1
NewYearChest=1
2013SupplyChest=0
    ;4 - Multiple
MetalMiningBoost=1
He3MiningBoost=1
ExtraTax=1
    ;7 - Multiple Confirm
PrimaryMetalPack=1
JuniorMetalPack=1
SeniorMetalPack=1
PrimaryHe3Pack=1
JuniorHe3Pack=1
SeniorHe3Pack=1
GoldPack=1
SeniorGoldPack=1
ResourceBox=1
    ;16 - Multiple
ExtraTaxAdv=1
    ;17 - Multiple Confirm
Badge=1
;GiftPack=1
EmblemofHonor=1
GiftPack=1
    ;21 - Multiple
LuxuriousPlanet=0
MetallicPlanet=0
GaseousPlanet=1
OrdinaryPlanet=0
    ;25 - Confirm
TreasureBox=0
QuadraGemsChest=0
RaidersChest=0
FinalScenarioChest=1
ScrollChest=1
ScrollChest2345=1
    ;31 - Multiple Confirm
CorsairsChest=1
    ;32 - Confirm
BlackHoleChest=1
ChimeraChest=1
SaganChest=1
    ;35

*/