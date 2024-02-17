#!/bin/bash
#
###########################################################
# Modify Config Files in Ark Cluster Servers
#
###########################################################
#
#
ARK_SERVER_FILES="/srv/data/ark"
ARK_SERVERS="aberration gen2 valguero"
ARK_CONFIG_LOCATION="server/ShooterGame/Saved/Config/LinuxServer"
#
#
###########################################################
for file in $ARK_SERVERS
do
    echo "Processing $file"
    ARK_ARKMANAGER_CFG="${ARK_SERVER_FILES}/${file}/arkmanager.cfg"
    ARK_GAMEINI_CFG="${ARK_SERVER_FILES}/${file}/${ARK_CONFIG_LOCATION}/Game.ini"
    ARK_GAMEUSERSETTINGS_CFG="${ARK_SERVER_FILES}/${file}/${ARK_CONFIG_LOCATION}/GameUserSettings.ini"
    #Arkmanager
    echo "Processing $file - $ARK_ARKMANAGER_CFG"
    crudini --set $ARK_ARKMANAGER_CFG "" arkflag_ForceAllowCaveFlyers true
    sed -i -r "s/(\S*)\s*=\s*(.*)/\1=\2/g" $ARK_ARKMANAGER_CFG
    #game
    echo "Processing $file - $ARK_GAMEINI_CFG"
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode MaxTribeLogs 100
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableFriendlyFire False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bPvEDisableFriendlyFire False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableLootCrates False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bIncreasePvPRespawnInterval False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode PreventOfflinePvPConnectionInvincibleInterval 5
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bAutoPvETimer False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode MaxNumberOfPlayersInTribe 70
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode MaxAlliancesPerTribe 10
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode MaxTribesPerAlliance 10
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bPvEAllowTribeWar True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bPvEAllowTribeWarCancel False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bAllowCustomRecipes True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bUseCorpseLocator True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bAllowUnlimitedRespecs True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bAllowPlatformSaddleMultiFloors True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode RandomSupplyCratePoints False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableGenesisMissions False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableDefaultMapItemSets False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableWorldBuffs False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bEnableWorldBuffScaling False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BaseHexagonRewardMultiplier 1.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode HexagonCostMultiplier 1.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode StructureDamageRepairCooldown 180
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode PvPZoneStructureDamageMultiplier 6.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bPassiveDefensesDamageRiderlessDinos False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bDisableStructurePlacementCollision True
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bLimitTurretsInRange False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bHardLimitTurretsInRange False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode bGenesisUseStructuresPreventionVolumes False
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode MatingIntervalMultiplier 0.500000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode EggHatchSpeedMultiplier 16.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BabyMatureSpeedMultiplier 16.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BabyImprintAmountMultiplier 10.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BabyImprintingStatScaleMultiplier 5.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BabyCuddleIntervalMultiplier 0.060000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode BabyCuddleGracePeriodMultiplier 5.000000
    crudini --set $ARK_GAMEINI_CFG /script/shootergame.shootergamemode CraftingSkillBonusMultiplier 8.000000

    sed -i -r "s/(\S*)\s*=\s*(.*)/\1=\2/g" $ARK_GAMEINI_CFG
    #gameusersettings
    echo "Processing $file - $ARK_GAMEUSERSETTINGS_CFG"
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PlatformSaddleBuildAreaBoundsMultiplier 2.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowCrateSpawnsOnTopOfStructures True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AdminLogging False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings TribeLogDestroyedEnemyStructures False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowSharedConnections True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ServerHardcore False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ServerPVE True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowCaveBuildingPvE False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings EnableExtraStructurePreventionVolumes False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings NoTributeDownloads False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventUploadSurvivors False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventUploadItems False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventUploadDinos False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings CrossARKAllowForeignDinoDownloads True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventOfflinePvP True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventOfflinePvPInterval 60
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventTribeAlliances False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventDiseases False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings NonPermanentDiseases False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventSpawnAnimations False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings MaxGateFrameOnSaddles 2
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowTekSuitPowersInGenesis True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings EnableCryoSicknessPVE False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings MaxHexagonsPerCharacter 2500000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings globalVoiceChat False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings proximityChat False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings alwaysNotifyPlayerLeft True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings alwaysNotifyPlayerJoined True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ServerForceNoHud False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings EnablePVPGamma False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DisablePvEGamma True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ShowFloatingDamageText True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowFlyerCarryPVE True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowRaidDinoFeeding False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DisableDinoDecayPvE False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PvPDinoDecay False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AutoDestroyDecayedDinos False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings MaxPersonalTamedDinos 1000.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PersonalTamedDinosSaddleStructureCost 19
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DisableImprintDinoBuff False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AllowAnyoneBabyImprintCuddle True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings UseOptimizedHarvestingHealth False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ClampResourceHarvestDamage False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ClampItemSpoilingTimes False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PvPStructureDecay False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DisableStructureDecayPVE True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings ForceAllStructureLocking False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings OnlyAutoDestroyCoreStructures False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings OnlyDecayUnsnappedCoreStructures False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings FastDecayUnsnappedCoreStructures False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DestroyUnconnectedWaterPipes True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings AlwaysAllowStructurePickup False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings OverrideOfficialDifficulty 6.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DifficultyOffset 4.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventDownloadSurvivors False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventDownloadItems False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PreventDownloadDinos False
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings XPMultiplier 1.500000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings TamingSpeedMultiplier 8.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings HarvestAmountMultiplier 1.500000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings DayTimeSpeedScale 0.666670
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings NightTimeSpeedScale 1.733300
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings PerPlatformMaxStructuresMultiplier 2.000000
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ServerSettings MaxPlatformSaddleStructureLimit 200
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings AutomationModActive True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings KitchenModActive True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings RaidModActive True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings GardenModActive True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings BabyModActive True
    crudini --set $ARK_GAMEUSERSETTINGS_CFG ArkAutomatedSettings PowerModActive True

    sed -i -r "s/(\S*)\s*=\s*(.*)/\1=\2/g" $ARK_GAMEUSERSETTINGS_CFG
done

echo "Processing Complete"

exit 0

