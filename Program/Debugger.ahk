ListLines Off

BugReport:=WinExist("A")

SendInput Email = {Raw}%Email%
SendInput {Enter}
SendInput Password = {Raw}%Password%
SendInput {Enter 2}

SendInput Email0 = {Raw}%Email0%
SendInput {Enter}
SendInput Password0 = {Raw}%Password0%
SendInput {Enter 2}

DebugX:=ListToString3("Email")
SendInput AltsEmails = [{Space}{Raw}%DebugX%
SendInput {Space}]{Enter 2}

DebugX:=ListToString3("Password")
SendInput AltsPasswords = [{Space}{Raw}%DebugX%
SendInput {Space}]{Enter 4}

if(DebugMode=1)
  Pause
else
  Sleep 2*DefaultClickDelay

SendInput Go2Address = %Go2Address%{Enter}
SendInput DefaultClickDelay = %DefaultClickDelay%{Enter}
SendInput OpenBrowser = %OpenBrowser%{Enter}
SendInput LogMain = %LogMain%{Enter}
SendInput TruceDies = %TruceDies%{Enter}
SendInput AltsRetryDelay = %AltsRetryDelay%{Enter}
SendInput DisconnectDelay = %DisconnectDelay%{Enter}
SendInput ReconnectWait = %ReconnectWait%{Enter}
SendInput DoubleDisconnectDelay = %DoubleDisconnectDelay%{Enter}
SendInput ScrollNum = %ScrollNum%{Enter 2}

DebugX:=ArrayToString("AddressBarXY")
SendInput AddressBarXY = [%DebugX%]{Enter}
DebugX:=ArrayToString("Tab1XY")
SendInput Tab1XY = [%DebugX%]{Enter}
DebugX:=ArrayToString("Tab2XY")
SendInput Tab2XY = [%DebugX%]{Enter}
DebugX:=ArrayToString("EmailXY")
SendInput EmailXY = [%DebugX%]{Enter}
DebugX:=ArrayToString("PasswordXY")
SendInput PasswordXY = [%DebugX%]{Enter}
DebugX:=ArrayToString("LoginXY")
SendInput LoginXY = [%DebugX%]{Enter}
DebugX:=ArrayToString("LeftSideXY")
SendInput LeftSideXY = [%DebugX%]{Enter}
DebugX:=ArrayToString("EnterGameXY")
SendInput EnterGameXY = [%DebugX%]{Enter 2}

SendInput Tab1X = %Tab1X%{Enter}
SendInput Tab1Y = %Tab1Y%{Enter}
SendInput Tab2X = %Tab2X%{Enter}
SendInput Tab2Y = %Tab2Y%{Enter}
SendInput LeftSideX = %LeftSideX%{Enter}
SendInput LeftSideY = %LeftSideY%{Enter}
SendInput EnterGameX = %EnterGameX%{Enter}
SendInput EnterGameY = %EnterGameY%{Enter 2}

SendInput WorldChat = %WorldChat%{Enter}
SendInput CorpsChat = %CorpsChat%{Enter}
SendInput PlanetChat = %PlanetChat%{Enter}
SendInput TeamChat = %TeamChat%{Enter}
SendInput PMChat = %PMChat%{Enter}
SendInput BattleChat = %BattleChat%{Enter 2}

SendInput ChatSize = %ChatSize%{Enter}
SendInput DefaultChannel = %DefaultChannel%{Enter}
SendInput ShowProductivity = %ShowProductivity%{Enter}
SendInput ShowBuilds = %ShowBuild%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

DebugX:=ArrayToString("Warehouse0XY")
SendInput WarehouseXY0 = [ %DebugX% ]{Enter}
DebugX:=ListArrayToString("Warehouse","XY",1)
SendInput AltsWarehouseX = [ %DebugX% ]{Enter}
DebugX:=ListArrayToString("Warehouse","XY",2)
SendInput AltsWarehouseY = [ %DebugX% ]{Enter 2}

SendInput SpaceRocks0 = %SpaceRocks0%{Enter}
DebugX:=ListToString("SpaceRocks")
SendInput AltsSpaceRocks = [ %DebugX% ]{Enter}
SendInput StealRocks0 = %StealRocks0%{Enter}
DebugX:=ListToString("StealRocks")
SendInput AltsStealRocks = [ %DebugX% ]{Enter 2}

DebugJ=1
while(DebugJ<NumAlts){
  DebugStr:="StealRocksList" DebugJ
  DebugX:=ArrayToString(DebugStr)
  SendInput %DebugStr% = [ %DebugX% ]{Enter}
  DebugJ++
}
SendInput {Enter}

SendInput DismissCommons0 = %DismissCommons0%{Enter}
DebugX:=ListToString("DismissCommons")
SendInput AltsDismissCommons = [ %DebugX% ]{Enter 2}

SendInput DonateMetal0 = %DonateMetal0%{Enter}
SendInput DonateHelium0 = %DonateHelium0%{Enter}
SendInput DonateGold0 = %DonateGold0%{Enter}
DebugX:=ListToString("DonateMetal")
SendInput AltsDonateMetal  = [ %DebugX% ]{Enter}
DebugX:=ListToString("DonateHelium")
SendInput AltsDonateHelium = [ %DebugX% ]{Enter}
DebugX:=ListToString("DonateGold")
SendInput AltsDonateGold   = [ %DebugX% ]{Enter 2}

DebugX:=ListToString("MallLevel")
SendInput AltsMallLevel = [ %DebugX% ]{Enter}
DebugX:=ListToString("MallShip")
SendInput AltsMallShip  = [ %DebugX% ]{Enter 2}

SendInput SpinWheelVouchers0 = %SpinWheelVouchers0%{Enter}
DebugX:=ListToString("SpinWheelVouchers")
SendInput AltsSpinWheelVouchers = [ %DebugX% ]{Enter}
SendInput Recurring = %Recurring%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep 1.5*DefaultClickDelay

SendInput RestrictedInstanceRewards = %RestrictedInstanceRewards%{Enter}
SendInput ScenarioInstance = %ScenarioInstance%{Enter}
SendInput ConstellationInstance = %ConstellationInstance%{Enter}
SendInput InstanceReward = %InstanceReward%{Enter}
SendInput DailyLeagueMatchReward = %DailyLeagueMatchReward%{Enter}
SendInput RewardsforDefeatingPirates = %RewardsforDefeatingPirates%{Enter}
SendInput ReturnItem = %ReturnItem%{Enter}
SendInput CancelSale = %CancelSale%{Enter}
SendInput Salehasexpired = %Salehasexpired%{Enter}
SendInput Salesuccessful = %Salesuccessful%{Enter}
SendInput Purchasesuccessful = %Purchasesuccessful%{Enter}
SendInput ResourcesGainedfromWar = %ResourcesGainedfromWar%{Enter}
SendInput EventReward = %EventReward%{Enter}
SendInput SystemVoucher = %SystemVoucher%{Enter}
SendInput LeagueMatchResults = %LeagueMatchResults%{Enter}
SendInput WarReportsDefeat = %WarReportsDefeat%{Enter}
SendInput WarReportsVictory = %WarReportsVictory%{Enter}
SendInput RankChange = %RankChange%{Enter}
SendInput OtherMessages = %OtherMessages%{Enter 2}

SendInput ShareWheel = %ShareWheel%{Enter}
SendInput ShareRestricted = %ShareRestricted%{Enter}
SendInput ShareLeague = %ShareLeague%{Enter}
SendInput ShareDefeat = %ShareDefeat%{Enter}
SendInput ShareVictory = %ShareVictory%{Enter}
SendInput ShareLevelup = %ShareLevelUp%{Enter 2}

SendInput AltsRestrictedInstanceRewards = %AltsRestrictedInstanceRewards%{Enter}
SendInput AltsScenarioInstance = %AltsScenarioInstance%{Enter}
SendInput AltsConstellationInstance = %AltsConstellationInstance%{Enter}
SendInput AltsInstanceReward = %AltsInstanceReward%{Enter}
SendInput AltsDailyLeagueMatchReward = %AltsDailyLeagueMatchReward%{Enter}
SendInput AltsRewardsforDefeatingPirates = %AltsRewardsforDefeatingPirates%{Enter}
SendInput AltsReturnItem = %AltsReturnItem%{Enter}
SendInput AltsCancelSale = %AltsCancelSale%{Enter}
SendInput AltsSalehasexpired = %AltsSalehasexpired%{Enter}
SendInput AltsSalesuccessful = %AltsSalesuccessful%{Enter}
SendInput AltsPurchasesuccessful = %AltsPurchasesuccessful%{Enter}
SendInput AltsResourcesGainedfromWar = %AltsResourcesGainedfromWar%{Enter}
SendInput AltsEventReward = %AltsEventReward%{Enter}
SendInput AltsSystemVoucher = %AltsSystemVoucher%{Enter}
SendInput AltsLeagueMatchResults = %AltsLeagueMatchResults%{Enter}
SendInput AltsWarReportsDefeat = %AltsWarReportsDefeat%{Enter}
SendInput AltsWarReportsVictory = %AltsWarReportsVictory%{Enter}
SendInput AltsRankChange = %AltsRankChange%{Enter}
SendInput AltsOtherMessages = %AltsOtherMessages%{Enter 2}

SendInput AltsShareWheel = %AltsShareWheel%{Enter}
SendInput AltsShareRestricted = %AltsShareRestricted%{Enter}
SendInput AltsShareLeague = %AltsShareLeague%{Enter}
SendInput AltsShareDefeat = %AltsShareDefeat%{Enter}
SendInput AltsShareVictory = %AltsShareVictory%{Enter}
SendInput AltsShareLevelup = %AltsShareLevelUp%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep 1.5*DefaultClickDelay

SendInput ChallengingChest = %ChallengingChest%{Enter}
SendInput NewYearChest = %NewYearChest%{Enter}
SendInput 2013SupplyChest = %2013SupplyChest%{Enter}
SendInput MetalMiningBoost = %MetalMiningBoost%{Enter}
SendInput He3MiningBoost = %He3MiningBoost%{Enter}
SendInput ExtraTax = %ExtraTax%{Enter}
SendInput PrimaryMetalPack = %PrimaryMetalPack%{Enter}
SendInput JuniorMetalPack = %JuniorMetalPack%{Enter}
SendInput SeniorMetalPack = %SeniorMetalPack%{Enter}
SendInput PrimaryHe3Pack = %PrimaryHe3Pack%{Enter}
SendInput JuniorHe3Pack = %JuniorHe3Pack%{Enter}
SendInput SeniorHe3Pack = %SeniorHe3Pack%{Enter}
SendInput GoldPack = %GoldPack%{Enter}
SendInput SeniorGoldPack = %SeniorGoldPack%{Enter}
SendInput ResourceBox = %ResourceBox%{Enter}
SendInput ExtraTaxAdv = %ExtraTaxAdv%{Enter}
SendInput Badge = %Badge%{Enter}
SendInput GiftPack = %GiftPack%{Enter}
SendInput EmblemofHonor = %EmblemofHonor%{Enter}
SendInput LuxuriousPlanet = %LuxuriousPlanet%{Enter}
SendInput MetallicPlanet = %MetallicPlanet%{Enter}
SendInput GaseousPlanet = %GaseousPlanet%{Enter}
SendInput OrdinaryPlanet = %OrdinaryPlanet%{Enter}
SendInput TreasureBox = %TreasureBox%{Enter}
SendInput QuadraGemsChest = %QuadraGemsChest%{Enter}
SendInput RaidersChest = %RaidersChest%{Enter}
SendInput FinalScenarioChest = %FinalScenarioChest%{Enter}
SendInput ScrollChest = %ScrollChest%{Enter}
SendInput ScrollChest2345 = %ScrollChest2345%{Enter}
SendInput CorsairsChest = %CorsairsChest%{Enter}
SendInput BlackHoleChest = %BlackHoleChest%{Enter}
SendInput ChimeraChest = %ChimeraChest%{Enter}
SendInput SaganChest = %SaganChest%{Enter 2}

SendInput AltsChallengingChest = %AltsChallengingChest%{Enter}
SendInput AltsNewYearChest = %AltsNewYearChest%{Enter}
SendInput Alts2013SupplyChest = %Alts2013SupplyChest%{Enter}
SendInput AltsMetalMiningBoost = %AltsMetalMiningBoost%{Enter}
SendInput AltsHe3MiningBoost = %AltsHe3MiningBoost%{Enter}
SendInput AltsExtraTax = %AltsExtraTax%{Enter}
SendInput AltsPrimaryMetalPack = %AltsPrimaryMetalPack%{Enter}
SendInput AltsJuniorMetalPack = %AltsJuniorMetalPack%{Enter}
SendInput AltsSeniorMetalPack = %AltsSeniorMetalPack%{Enter}
SendInput AltsPrimaryHe3Pack = %AltsPrimaryHe3Pack%{Enter}
SendInput AltsJuniorHe3Pack = %AltsJuniorHe3Pack%{Enter}
SendInput AltsSeniorHe3Pack = %AltsSeniorHe3Pack%{Enter}
SendInput AltsGoldPack = %AltsGoldPack%{Enter}
SendInput AltsSeniorGoldPack = %AltsSeniorGoldPack%{Enter}
SendInput AltsResourceBox = %AltsResourceBox%{Enter}
SendInput AltsExtraTaxAdv = %AltsExtraTaxAdv%{Enter}
SendInput AltsBadge = %AltsBadge%{Enter}
SendInput AltsGiftPack = %AltsGiftPack%{Enter}
SendInput AltsEmblemofHonor = %AltsEmblemofHonor%{Enter}
SendInput AltsLuxuriousPlanet = %AltsLuxuriousPlanet%{Enter}
SendInput AltsMetallicPlanet = %AltsMetallicPlanet%{Enter}
SendInput AltsGaseousPlanet = %AltsGaseousPlanet%{Enter}
SendInput AltsOrdinaryPlanet = %AltsOrdinaryPlanet%{Enter}
SendInput AltsTreasureBox = %AltsTreasureBox%{Enter}
SendInput AltsQuadraGemsChest = %AltsQuadraGemsChest%{Enter}
SendInput AltsRaidersChest = %AltsRaidersChest%{Enter}
SendInput AltsFinalScenarioChest = %AltsFinalScenarioChest%{Enter}
SendInput AltsScrollChest = %AltsScrollChest%{Enter}
SendInput AltsScrollChest2345 = %AltsScrollChest2345%{Enter}
SendInput AltsCorsairsChest = %AltsCorsairsChest%{Enter}
SendInput AltsBlackHoleChest = %AltsBlackHoleChest%{Enter}
SendInput AltsChimeraChest = %AltsChimeraChest%{Enter}
SendInput AltsSaganChest = %AltsSaganChest%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep 1.5*DefaultClickDelay

SendInput paramRed = %paramRed%{Enter}
SendInput paramx = %paramx%{Enter}
SendInput paramy = %paramy%{Enter}
SendInput paramx1 = %paramx1%{Enter}
SendInput paramy1 = %paramy1%{Enter}
SendInput paramx2 = %paramx2%{Enter}
SendInput paramy2 = %paramy2%{Enter}
SendInput xcurrent = %xcurrent%{Enter}
SendInput ycurrent = %ycurrent%{Enter}
SendInput xdefault = %xdefault%{Enter}
SendInput ydefault = %ydefault%{Enter}
SendInput xdiff = %xdiff%{Enter}
SendInput ydiff = %ydiff%{Enter}
SendInput xend = %xend%{Enter}
SendInput yend = %yend%{Enter}
SendInput xflash = %xflash%{Enter}
SendInput yflash = %yflash%{Enter}
SendInput xflashclick = %xflashclick%{Enter}
SendInput yflashclick = %yflashclick%{Enter}
SendInput xfriend = %xfriend%{Enter}
SendInput yfriend = %yfriend%{Enter}
SendInput ximage = %ximage%{Enter}
SendInput yimage = %yimage%{Enter}
SendInput xlevel = %xlevel%{Enter}
SendInput ylevel = %ylevel%{Enter}
SendInput xoffset = %xoffset%{Enter}
SendInput yoffset = %yoffset%{Enter}
SendInput xpos = %xpos%{Enter}
SendInput ypos = %ypos%{Enter}
SendInput paramxpos = %paramxpos%{Enter}
SendInput paramypos = %paramypos%{Enter}
SendInput truexpos = %truexpos%{Enter}
SendInput trueypos = %trueypos%{Enter}
SendInput xq = %xq%{Enter}
SendInput yq = %yq%{Enter}
SendInput xright = %xright%{Enter}
SendInput ytop = %ytop%{Enter}
SendInput xscroll = %xscroll%{Enter}
SendInput yscroll = %yscroll%{Enter}
SendInput xstart = %xstart%{Enter}
SendInput ystart = %ystart%{Enter}
SendInput A_ScreenWidth = %A_ScreenWidth%{Enter}
SendInput A_ScreenHeight = %A_ScreenHeight%{Enter 2}

SendInput pixcheck = %pixcheck%{Enter}
SendInput pixelcolor = %pixelcolor%{Enter 2}

SendInput xidle = %xidle%{Enter}
SendInput yidle = %yidle%{Enter}
SendInput lastxidle = %lastxidle%{Enter}
SendInput lastyidle = %lastyidle%{Enter}
SendInput windowidle = %windowidle%{Enter}
SendInput lastwindowidle = %lastwindowidle%{Enter}
SendInput idlehour = %idlehour%{Enter}
SendInput idleminute = %idleminute%{Enter}
SendInput idlesecond = %idlesecond%{Enter}
SendInput IdleRestore = %IdleRestore%{Enter}
SendInput IdleTime = %IdleTime%{Enter}
SendInput StartIdleTime = %StartIdleTime%{Enter}
SendInput IdleWait = %IdleWait%{Enter 2}

SendInput b = %b%{Enter}
SendInput c = %c%{Enter}
SendInput i = %i%{Enter}
SendInput j = %j%{Enter}
SendInput k = %k%{Enter}
SendInput m = %m%{Enter}
SendInput n = %n%{Enter}
SendInput p = %p%{Enter}
SendInput s = %s%{Enter}
SendInput im = %im%{Enter}
SendInput ibag = %ibag%{Enter}
SendInput jbag = %jbag%{Enter}
SendInput igo = %igo%{Enter}
SendInput iFunc= %iFunc%{Enter}
SendInput jFunc= %jFunc%{Enter}
SendInput iLag = %iLag%{Enter}
SendInput jLag = %jLag%{Enter}
SendInput jIsMail = %jIsMail%{Enter}
SendInput var = %var%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

DebugX:=ArrayToString("RocksPixelX")
SendInput RocksPixelX = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("RocksPixelY")
SendInput RocksPixelY = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("RocksClickX")
SendInput RocksClickX = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("RocksClickY")
SendInput RocksClickY = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("CommandersMaxxed")
SendInput CommandersMaxxed = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("ChatChannels")
SendInput ChatChannels = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("MailName")
SendInput MailName = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("GetMail")
SendInput GetMail     = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("AltsGetMail")
SendInput AltsGetMail = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("MailLastPage")
SendInput MailLastPage = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("MailOverflow")
SendInput MailOverflow = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("MailNotOverflow")
SendInput MailNotOverflow = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("ItemName")
SendInput ItemName = [ %DebugX% ]{Enter 2}

DebugX:=ArrayToString("GetItems")
SendInput GetItems     = [ %DebugX% ]{Enter}
DebugX:=ArrayToString("AltsGetItems")
SendInput AltsGetItems = [ %DebugX% ]{Enter 2}

SendInput DoAltsSpins = %DoAltsSpins%{Enter}
SendInput DoAltsDonate = %DoAltsDonate%{Enter}
SendInput DoAltsRestricteds = %DoAltsRestricteds%{Enter}
SendInput DoAltsDailies = %DoAltsDailies%{Enter}
SendInput DoAltsStealRocks = %DoAltsStealRocks%{Enter}
SendInput DoAltsGetVouchers = %DoAltsGetVouchers%{Enter}
SendInput DoAltsSpaceRocks = %DoAltsSpaceRocks%{Enter}
SendInput DoAltsRocks = %DoAltsRocks%{Enter}
SendInput DoAltsWrenches = %DoAltsWrenches%{Enter}
SendInput AltsWrenchAll = %AltsWrenchAll%{Enter 2}

SendInput RetryAltsSpins = %RetryAltsSpins%{Enter}
SendInput RetryAltsRestricteds = %RetryAltsRestricteds%{Enter}
SendInput RetryAltsDismissFleets = %RetryAltsDismissFleets%{Enter}
SendInput RetryAltsDonate = %RetryAltsDonate%{Enter}
SendInput RetryAltsStealRocks = %RetryAltsStealRocks%{Enter}
SendInput RetryAltsSpaceRocks = %RetryAltsSpaceRocks%{Enter}
SendInput RetryAltsWrenches = %RetryAltsWrenches%{Enter}
SendInput RetryAltsQuestRewards = %RetryAltsQuestRewards%{Enter}
SendInput RetryAltsHarvest = %RetryAltsHarvest%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

SendInput hour = %hour%{Enter}
SendInput minute = %minute%{Enter}
SendInput TimeZoneOffset = %TimeZoneOffset%{Enter}
SendInput OldTime = %OldTime%{Enter}
SendInput NewTime = %NewTime%{Enter}
SendInput NewTime60 = %NewTime60%{Enter 2}

SendInput Midnight = %Midnight%{Enter}
SendInput DoRefresh = %DoRefresh%{Enter}
SendInput SpinsDailyRewards = %SpinsDailyRewards%{Enter}
SendInput RecruitMailItems = %RecruitMailItems%{Enter}
SendInput RecruitDailyRewards = %RecruitDailyRewards%{Enter}
SendInput RecruitTime = %RecruitTime%{Enter}
SendInput RecruitDelay = %RecruitDelay%{Enter}
SendInput DoRecruit = %DoRecruit%{Enter}
SendInput SetAltsHarvestTime = %SetAltsHarvestTime%{Enter}
SendInput AltsHarvestTime = %AltsHarvestTime%{Enter}
SendInput AltsHarvestDelay = %AltsHarvestDelay%{Enter}
SendInput DoAltsHarvest = %DoAltsHarvest%{Enter}
SendInput HarvestAltsNow = %HarvestAltsNow%{Enter}
SendInput DoScience = %DoScience%{Enter}
SendInput AltsDoScience = %AltsDoScience%{Enter}
SendInput SetRocksTime = %SetRocksTime%{Enter}
SendInput RocksTime = %RocksTime%{Enter}
SendInput IgnoreRocksTime = %IgnoreRocksTime%{Enter}
SendInput DoRocks = %DoRocks%{Enter}
SendInput CollectMail = %CollectMail%{Enter 2}

SendInput Control = %Control%{Enter}
SendInput ReturnControl = %ReturnControl%{Enter}
SendInput CurrentFormation = %CurrentFormation%{Enter}
SendInput TrialFleetsOut = %TrialFleetsOut%{Enter}
SendInput NumFleets = %NumFleets%{Enter}
SendInput RefillHelium = %RefillHelium%{Enter 2}

SendInput RestrictedCount = %RestrictedCount%{Enter}
SendInput TrialsDone = %TrialsDone%{Enter}
SendInput ConstellationCount = %ConstellationCount%{Enter}
SendInput InstanceCount = %InstanceCount%{Enter}
SendInput InstanceBoxCount = %InstanceBoxCount%{Enter}
SendInput InstanceRefillCount = %InstanceRefillCount%{Enter 2}

SendInput ScreenSaver = %ScreenSaver%{Enter}
SendInput ScreenSaverCount = %ScreenSaverCount%{Enter}
SendInput EZCollect = %EZCollect%{Enter}
SendInput EZOn = %EZOn%{Enter}
SendInput EZTimeLeft = %EZTimeLeft%{Enter}
SendInput EZEndTime = %EZEndTime%{Enter}
SendInput ezhour = %ezhour%{Enter}
SendInput ezminute = %ezminute%{Enter}
SendInput ezsecond = %ezsecond%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

SendInput RestrictedHelium = %RestrictedHelium%{Enter}
SendInput TrialHelium = %TrialHelium%{Enter}
SendInput ConstellationHelium = %ConstellationHelium%{Enter}
SendInput InstanceHelium = %InstanceHelium%{Enter}
SendInput LeagueHelium = %LeagueHelium%{Enter 2}

SendInput LeagueRank = %LeagueRank%{Enter}
SendInput LeagueStartTime1 = %LeagueStartTime1%{Enter}
SendInput LeagueEndTime1 = %LeagueEndTime1%{Enter}
SendInput LeagueStartTime2 = %LeagueStartTime2%{Enter}
SendInput LeagueEndTime2 = %LeagueEndTime2%{Enter}
SendInput ContinueLeague = %ContinueLeague%{Enter}
SendInput CheckLeague = %CheckLeague%{Enter}
SendInput LeagueFleets = %LeagueFleets%{Enter}
SendInput LeagueWeike = %LeagueWeike%{Enter}
SendInput LeagueCount = %LeagueCount%{Enter 2}

SendInput RestrictedWeike = %RestrictedWeike%{Enter}
SendInput RestrictedNum = %RestrictedNum%{Enter}
SendInput BuyPassports = %BuyPassports%{Enter}
SendInput NumRestricteds = %NumRestricteds%{Enter}
SendInput TrialFleets = %TrialFleets%{Enter}
SendInput UseSPCards = %UseSPCards%{Enter}
SendInput BuySPCards = %BuySPCards%{Enter}
DebugJ=1
while(DebugJ<5){
  DebugStr:="TrialFleet" DebugJ "XYT"
  DebugX:=ArrayToString(DebugStr)
  SendInput %DebugStr% = [ %DebugX% ]{Enter}
  DebugJ++
}
SendInput ConstellationSign = %ConstellationSign%{Enter}
SendInput ConstellationNum = %ConstellationNum%{Enter}
SendInput NumConstellations = %NumConstellations%{Enter}
SendInput InstanceNum = %InstanceNum%{Enter}
SendInput NumInstances = %NumInstances%{Enter}
SendInput RefillEvery = %RefillEvery%{Enter}
SendInput OpenBoxEvery = %OpenBoxEvery%{Enter}
SendInput OpenBoxes = %OpenBoxes%{Enter}
SendInput OpenExtraBoxes = %OpenExtraBoxes%{Enter 2}

SendInput DoRestricteds = %DoRestricteds%{Enter}
SendInput DoTrials = %DoTrials%{Enter}
SendInput DoConstellations = %DoConstellations%{Enter}
SendInput DoInstances = %DoInstances%{Enter}
SendInput DoLeague = %DoLeague%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

SendInput checkBrowserLoaded = %checkBrowserLoaded%{Enter}
SendInput checkFacebookLoggedOut = %checkFacebookLoggedOut%{Enter}
SendInput checkGo2DashBoard = %checkGo2DashBoard%{Enter}
SendInput checkLoginFail = %checkLoginFail%{Enter}
SendInput checkScrollFail = %checkScrollFail%{Enter}
SendInput checkHDWheelLoaded = %checkHDWheelLoaded%{Enter}
SendInput checkHDWheelLoadFail = %checkHDWheelLoadFail%{Enter}
SendInput checkFreeSpinFail = %checkFreeSpinFail%{Enter}
SendInput checkFreeSpinDone = %checkFreeSpinDone%{Enter}
SendInput checkFriendRequest = %checkFriendRequest%{Enter}
SendInput checkFriendAccepted = %checkFriendAccepted%{Enter}
SendInput checkLevelUp = %checkLevelUp%{Enter}
SendInput checkDisconnected = %checkDisconnected%{Enter}
SendInput checkInstanceDone = %checkInstanceDone%{Enter}
SendInput checkInstanceMenu = %checkInstanceMenu%{Enter}
SendInput checkRestrictedsDone = %checkRestrictedsDone%{Enter}
SendInput checkTrialsDone = %checkTrialsDone%{Enter}
SendInput checkLeagueDone = %checkLeagueDone%{Enter}
SendInput checkIsMail = %checkIsMail%{Enter}
SendInput checkRecruitMax = %checkRecruitMax%{Enter}
SendInput checkMailOverflow = %checkMailOverflow%{Enter}
SendInput checkCenterSpaceStation= %checkCenterSpaceStation%{Enter}
SendInput checkFlashImageSearch = %checkFlashImageSearch%{Enter}
SendInput checkChromeImageSearch = %checkChromeImageSearch%{Enter}
SendInput checkMultipleItems = %checkMultipleItems%{Enter}
SendInput checkConfirmItems = %checkConfirmItems%{Enter}
SendInput checkBagScreen = %checkBagScreen%{Enter}
SendInput checkAllCharged = %AllCharged%{Enter}
SendInput checkIncreaseFleet = %checkIncreaseFleet%{Enter}
SendInput checkCollectQuestReward = %checkCollectQuestReward%{Enter}
SendInput ErrorLevel = %ErrorLevel%{Enter}
SendInput pixcheck = %pixcheck%{Enter}
SendInput pixelcolor = %pixelcolor%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay/2

SendInput paramInTrials = %paramInTrials%{Enter 2}

SendInput paramGo = %paramGo%{Enter}
SendInput paramRec = %paramRec%{Enter}
SendInput paramColMail = %paramColMail%{Enter}
SendInput temphour = %temphour%{Enter}
SendInput tempminute = %tempminute%{Enter}
SendInput TempTime = %TempTime%{Enter 2}

SendInput paramCount = %paramCount%{Enter}
SendInput paramLoginControl = %paramLoginControl%{Enter}
SendInput trueLoginControl = %trueLoginControl%{Enter}
SendInput LoginWait = %LoginWait%{Enter}
SendInput LoginRetry = %LoginRetry%{Enter}
SendInput paramClickWheel = %paramClickWheel%{Enter 2}

SendInput paramFront = %paramFront%{Enter}
SendInput paramMiddle = %paramMiddle%{Enter}
SendInput paramBack = %paramBack%{Enter}
SendInput paramGreater = %paramGreater%{Enter 2}

SendInput paramAltsRec = %paramAltsRec%{Enter}
SendInput AltRec = %AltRec%{Enter}
SendInput Alt = %Alt%{Enter}
SendInput AltCount = %AltCount%{Enter}
SendInput NumAlts = %NumAlts%{Enter 2}

SendInput paramShWh = %paramShWh%{Enter}
SendInput trueShWh = %trueShWh%{Enter}
SendInput paramExtra = %paramExtra%{Enter}
SendInput trueExtra = %trueExtra%{Enter}
SendInput paramMult = %paramMult%{Enter 2}

SendInput paramMetHel = %paramMetHel%{Enter}
DebugX:=ListToString("ConflictingLand")
SendInput ConflictingLand = [ %DebugX% ]{Enter}
SendInput OpenTerritory = %OpenTerritory%{Enter 2}

SendInput paramClickSS = %ClickSS%{Enter 2}

SendInput A_Index = %A_Index%{Enter 2}

SendInput paramSign = %paramSign%{Enter}
SendInput paramNum = %paramNum%{Enter 2}

SendInput paramDisCom = %paramDisCom%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

SendInput paramMaxMessages = %paramMaxMessages%{Enter}
SendInput paramOthMess = %paramOthMess%{Enter}
SendInput paramRestRew = %paramRestRew%{Enter}
SendInput paramShareRest = %paramShareRest%{Enter}
DebugX:=ArrayToString("paramMailType")
SendInput paramMailType = [ %DebugX% ]{Enter}
SendInput TurnMailPages = %TurnMailPages%{Enter 2}

DebugX:=ArrayToString("paramGetItem")
SendInput paramGetItem = [ %DebugX% ]{Enter}
SendInput BagDone = %BagDone%{Enter}
SendInput Multiple = %Multiple%{Enter}
SendInput ConfirmItem = %ConfirmItem%{Enter 2}

SendInput paramDonMet = %paramDonMet%{Enter}
SendInput paramDonHel = %paramDonHel%{Enter}
SendInput paramDonGold = %paramDonGold%{Enter}
SendInput paramMLev = %paramMLev%{Enter}
SendInput paramMShip = %paramMShip%{Enter 2}

SendInput paramOffset = %paramOffset%{Enter}
SendInput trueOffset = %trueOffset%{Enter}
SendInput paramStartPos = %paramStartPos%{Enter}
SendInput paramEndPos = %paramEndPos%{Enter}
SendInput paramNumShips = %paramNumShips%{Enter 2}

SendInput paramFleets = %paramFleets%{Enter}
SendInput trueFleets = %trueFleets%{Enter}
SendInput paramHelium = %paramHelium%{Enter}
SendInput LoopFleets = %LoopFleets%{Enter 2}

SendInput paramComm = %paramComm%{Enter}
SendInput trueComm = %trueComm%{Enter}
SendInput Page = %Page%{Enter}
SendInput MaxPages = %MaxPages%{Enter}
SendInput StartPage = %StartPage%{Enter}
SendInput Direction = %Direction%{Enter 2}

SendInput paramType = %paramType%{Enter}
SendInput trueType = %trueType%{Enter}
SendInput paramRange = %paramRange%{Enter}
SendInput paramTarget = %paramTarget%{Enter}
SendInput paramCommander = %paramCommander%{Enter}
SendInput paramSave = %paramSave%{Enter 2}

SendInput paramMenu = %paramMenu%{Enter}
SendInput paramButton = %paramButton%{Enter 2}

SendInput paramSleepMult = %paramSleepMult%{Enter}
SendInput paramRepeat = %paramRepeat%{Enter}
SendInput paramMoveSpeed = %paramMoveSpeed%{Enter}
SendInput paramImageName = %paramImageName%{Enter}
SendInput paramTolerance = %paramTolerance%{Enter}
SendInput ListLinesOn = %ListLinesOn%{Enter}
SendInput ChromeID = %ChromeID%{Enter}
SendInput TestID = %TestID%{Enter}
SendInput Top = %Top%{Enter}
SendInput paramExpected = %paramExpected%{Enter}
SendInput paramFriendAccept = %paramFriendAccept%{Enter}
SendInput friendreq = %friendreq%{Enter}
SendInput paused = %paused%{Enter}
SendInput Maximized = %Maximized%{Enter 2}

SendInput LastFlashImageName = %LastFlashImageName%{Enter}
SendInput SameFlashImageCalled = %SameFlashImageCalled%{Enter}
SendInput MaxSameFlashImageName = %MaxSameFlashImageName%{Enter}
SendInput MaxSameFlashImageCalled = %MaxSameFlashImageCalled%{Enter}
SendInput LastChromeImageName = %LastChromeImageName%{Enter}
SendInput SameChromeImageCalled = %SameChromeImageCalled%{Enter}
SendInput MaxSameChromeImageName = %MaxSameChromeImageName%{Enter}
SendInput MaxSameChromeImageCalled = %MaxSameChromeImageCalled%{Enter 2}

SendInput DismissWeike = %DismissWeike%{Enter}
SendInput BrokeFlag = %BrokeFlag%{Enter}
SendInput Broke = %Broke%{Enter}
SendInput Broke2 = %Broke2%{Enter}
SendInput AltLocked = %AltLocked%{Enter 2}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

DebugI=25
Loop 25{
  DebugX:=LastFunction%DebugI%
  SendInput LastFunction%DebugI% = %DebugX%{Enter}
  DebugI--
}
SendInput {Enter}

if(DebugMode=1)
  Pause
else
  Sleep DefaultClickDelay

ClipSaved:=ClipboardAll
ListLines
Sleep DefaultClickDelay/2
SetTitleMatchMode 2
BlockInput On
if(WinActive("MasterBot.ahk")=0) and (WinExist("MasterBot.ahk")){
  WinActivate MasterBot.ahk
  Sleep DefaultClickDelay/2
}
if(WinActive("MasterBot.ahk")){
  SendInput ^+{End}
  Sleep DefaultClickDelay/4
  SendInput ^c
  Sleep DefaultClickDelay/4
  WinHide MasterBot.ahk
  Sleep DefaultClickDelay/2
  WinActivate ahk_id %BugReport%
  if(WinActive("ahk_id" BugReport)){
    SendInput ^v
    Sleep DefaultClickDelay/2
  }
}
BlockInput Off
SetTitleMatchMode 1
ClipBoard:=ClipSaved
ClipSaved=
SendInput +{Home}{Enter 5}Done{!} Scroll to the top of the file to delete passwords if you want. Also do a Ctrl+F and find "Password", in case it's still in the script history. Then save this file and email it to koozhk.koozhk@gmail.com. Make sure to also include a screenshot of what was happening when you noticed the bot break.
ListLines On