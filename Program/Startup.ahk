Broke=0
DismissWeike=0
IdleRestore=0
Tab1X:=Tab1XY[1]
Tab1Y:=Tab1XY[2]
Tab2X:=Tab2XY[1]
Tab2Y:=Tab2XY[2]
LeftSideX:=LeftSideXY[1]
LeftSideY:=LeftSideXY[2]
EnterGameX:=EnterGameXY[1]
EnterGameY:=EnterGameXY[2]
DefaultFleetX=470
DefaultFleetY=455
DoRecruit=0
if(Midnight=1) or (RocksTime=-1){
  DoAltsHarvest=1
  SetAltsHarvestTime=0
}else
  SetAltsHarvestTime=1
DoRocks=0
SetRocksTime=0
IgnoreRocksTime=0
SpinsDailyRewards=0
RecruitMailItems=0
RecruitDailyRewards=0
TrialsDone=-1
RestrictedCount=0
ConstellationCount=0
InstanceCount=0
InstanceBoxCount=0
CollectMail=0
if(Control=0) or (Control=2)
  TrialFleetsOut=1
else
  TrialFleetsOut=0
if(Control=1)
  RefillHelium:=RestrictedHelium
else if(Control=2)
  RefillHelium:=TrialHelium
else if(Control=3)
  RefillHelium:=ConstellationHelium
else if(Control=4){
  RefillHelium:=InstanceHelium
  InstanceRefillCount=0
}else
  RefillHelium=0
CurrentFormation:=Control
ScreenSaverCount=0
EZCollect=1
EZTimeLeft=915
EZOn=0
RocksPixelX:=[413,500,415,326,580,500,326,249,503,414,327,413]
RocksPixelY:=[414,351,342,350,287,289,288,287,229,233,229,186]
RocksClickX:=[427,513,425,337,592,515,337,260,513,424,336,425]
RocksClickY:=[421,358,352,360,298,295,297,296,238,243,239,196]
CommandersMaxxed:=["MaxCommanders10","MaxCommanders15","MaxCommanders20","MaxCommanders25","MaxCommanders30","MaxCommanders40","MaxCommanders45","MaxCommanders50","MaxCommanders60"]
ChatChannels:=[WorldChat,CorpsChat,PlanetChat,TeamChat,PMChat,BattleChat]
MailName:=["ScenarioInstance","ConstellationInstance","InstanceReward","DailyLeagueMatchReward","RewardsforDefeatingPirates","ReturnItem","CancelSale","Salehasexpired","Salesuccessful","Purchasesuccessful","ResourcesGainedfromWar","EventReward","SystemVoucher","LeagueMatchResults","WarReportsDefeat","WarReportsVictory","RankChange"]
GetMail:=[OtherMessages,RestrictedInstanceRewards,ShareRestricted,ScenarioInstance,ConstellationInstance,InstanceReward,DailyLeagueMatchReward,RewardsforDefeatingPirates,ReturnItem,CancelSale,Salehasexpired,Salesuccessful,Purchasesuccessful,ResourcesGainedfromWar,EventReward,SystemVoucher,LeagueMatchResults,WarReportsDefeat,WarReportsVictory,RankChange,ShareLeague,ShareDefeat,ShareVictory,0]
AltsGetMail:=[AltsOtherMessages,AltsRestrictedInstanceRewards,AltsShareRestricted,AltsScenarioInstance,AltsConstellationInstance,AltsInstanceReward,AltsDailyLeagueMatchReward,AltsRewardsforDefeatingPirates,AltsReturnItem,AltsCancelSale,AltsSalehasexpired,AltsSalesuccessful,AltsPurchasesuccessful,AltsResourcesGainedfromWar,AltsEventReward,AltsSystemVoucher,AltsLeagueMatchResults,AltsWarReportsDefeat,AltsWarReportsVictory,AltsRankChange,AltsShareLeague,AltsShareDefeat,AltsShareVictory,0]
MailLastPage:=["Mail1-1","Mail2-2","Mail3-3","Mail4-4","Mail5-5","Mail6-6","Mail7-7","Mail8-8","Mail9-9"]
MailOverflow:=["Mail6","Mail7","Mail8","Mail9"]
MailNotOverflow:=["Mail1-1","Mail1-2","Mail2-2","Mail1-3","Mail2-3","Mail3-3","Mail1-4","Mail2-4","Mail3-4","Mail4-4","Mail1-5","Mail2-5","Mail3-5","Mail4-5","Mail5-5"]
ItemName:=["ChallengingChest","NewYearChest","2013SupplyChest","MetalMiningBoost","He3MiningBoost","ExtraTax","PrimaryMetalPack","JuniorMetalPack","SeniorMetalPack","PrimaryHe3Pack","JuniorHe3Pack","SeniorHe3Pack","GoldPack","SeniorGoldPack","ResourceBox","ExtraTaxAdv","Badge","GiftPack","EmblemofHonor","GiftPack","LuxuriousPlanet","MetallicPlanet","GaseousPlanet","OrdinaryPlanet","TreasureBox","QuadraGemsChest","RaidersChest","FinalScenarioChest","ScrollChest","ScrollChest2345","CorsairsChest","BlackHoleChest","ChimeraChest","SaganChest"]
GetItems:=[ChallengingChest,NewYearChest,2013SupplyChest,MetalMiningBoost,He3MiningBoost,ExtraTax,PrimaryMetalPack,JuniorMetalPack,SeniorMetalPack,PrimaryHe3Pack,JuniorHe3Pack,SeniorHe3Pack,GoldPack,SeniorGoldPack,ResourceBox,ExtraTaxAdv,Badge,GiftPack,EmblemofHonor,GiftPack,LuxuriousPlanet,MetallicPlanet,GaseousPlanet,OrdinaryPlanet,TreasureBox,QuadraGemsChest,RaidersChest,FinalScenarioChest,ScrollChest,ScrollChest2345,CorsairsChest,BlackHoleChest,ChimeraChest,SaganChest]
AltsGetItems:=[AltsChallengingChest,AltsNewYearChest,Alts2013SupplyChest,AltsMetalMiningBoost,AltsHe3MiningBoost,AltsExtraTax,AltsPrimaryMetalPack,AltsJuniorMetalPack,AltsSeniorMetalPack,AltsPrimaryHe3Pack,AltsJuniorHe3Pack,AltsSeniorHe3Pack,AltsGoldPack,AltsSeniorGoldPack,AltsResourceBox,AltsExtraTaxAdv,AltsBadge,AltsGiftPack,AltsEmblemofHonor,AltsGiftPack,AltsLuxuriousPlanet,AltsMetallicPlanet,AltsGaseousPlanet,AltsOrdinaryPlanet,AltsTreasureBox,AltsQuadraGemsChest,AltsRaidersChest,AltsFinalScenarioChest,AltsScrollChest,AltsScrollChest2345,AltsCorsairsChest,AltsBlackHoleChest,AltsChimeraChest,AltsSaganChest]
if(GetItems[20]+GetItems[21]+GetItems[22]>1){
  GetItems[20]=0
  GetItems[21]=0
  GetItems[22]=0
}
if(AltsGetItems[20]+AltsGetItems[21]+AltsGetItems[22]>1){
  AltsGetItems[20]=0
  AltsGetItems[21]=0
  AltsGetItems[22]=0
}
OpenExtraBoxes=1
if(RestrictedWeike=1) or ((RestrictedNum>0) and (RestrictedHelium>0) and (NumRestricteds>0))
  DoRestricteds=1
else
  DoRestricteds=0
if(TrialHelium>0) and (TrialFleets>0)
  DoTrials=1
else
  DoTrials=0
if(ConstellationSign>0) and (ConstellationNum>0) and (ConstellationHelium>0) and (NumConstellations>0)
  DoConstellations=1
else
  DoConstellations=0
if(InstanceNum>0) and (InstanceHelium>0) and (RefillEvery>0) and (NumInstances>0)
  DoInstances=1
else
  DoInstances=0
if(LeagueFleets>0) and (LeagueHelium>0) and (LeagueRank>0){
  DoLeague=1
  ContinueLeague=1
  if(LeagueRank>4){
    LeagueStartTime1=630
    LeagueStartTime2=1290
  }else if(LeagueRank=4){
    LeagueStartTime1=620
    LeagueStartTime2=1280
  }else if(LeagueRank=3){
    LeagueStartTime1=570
    LeagueStartTime2=1230
  }else if(LeagueRank=2){
    LeagueStartTime1=510
    LeagueStartTime2=1170
  }else if(LeagueRank=1){
    LeagueStartTime1=620
    LeagueStartTime2=1280
  }    
  LeagueEndTime1=750
  LeagueEndTime2=1410
  LeagueCount=0
  LeagueWeike=0
}else{
  DoLeague=0
  ContinueLeague=0
}
CheckLeague=0
if(DoAltsDonate=1){
  DoAltsDonate=0
  i=1
  while(i<=NumAlts) and (DoAltsDonate=0){
    DoAltsDonate+=DonateMetal%i%+DonateHelium%i%+DonateGold%i%
    i++
  }
  if(DoAltsDonate>0)
    DoAltsDonate=1
}
if(DoAltsSpins=1) or (DoAltsDonate=1) or (DoAltsRestricteds=1)
  DoAltsDailies=1
else
  DoAltsDailies=0
if(DoAltsStealRocks=1) or (DoAltsGetVouchers=1) or (DoAltsSpaceRocks=1)
  DoAltsRocks=1
else
  DoAltsRocks=0
DoRefresh=0
if(OpenBrowser=1){
  Run C:\Documents and Settings\Deej\Local Settings\Application Data\Google\Chrome\Application\chrome.exe --profile-directory=Bot, , , ChromePID
  WinWait ahk_pid %ChromePID%
  Sleep 2*DefaultClickDelay
  while(BrowserLoaded()=0){
    SendInput !+{Tab} ; Cycle through windows until empty browser found
    Sleep DefaultClickDelay
  }
  ChromeClick(AddressBarXY[1],AddressBarXY[2],.5) ; Address Bar
;set ChromeID
  SendInput facebook.com{Enter}
  Sleep 1.5*DefaultClickDelay
  SendInput ^t ; New Tab
  Sleep DefaultClickDelay
;  SendInput ^t ; New Tab
;  Sleep DefaultClickDelay/2
  if(ScrollNum=0) and (LogMain=1)
    SendInput ^{Tab} ; Tab 1
  else{
    ChromeClick(AddressBarXY[1],AddressBarXY[2],.5) ; Address Bar
    SendInput ^a%Go2Address%{Delete}{Enter} ; Load go2
  }
}else{
  if(ScrollNum=0) and (LogMain=1){
    Click %Tab1X%, %Tab1Y% ; Tab 1
    Sleep DefaultClickDelay/2
    SendInput ^1 ; Tab 1
    Sleep 1.5*DefaultClickDelay
  }else{
    Click %Tab2X%, %Tab2Y% ; Tab 2
    Sleep DefaultClickDelay/2
    SendInput ^2 ; Tab 2
    Sleep DefaultClickDelay/2
  }
  ChromeID:=WinExist("A")
  if(ScrollNum>0){
    Click %LeftSideX%, %LeftSideY% ; Left Side
    Sleep DefaultClickDelay/2
    SendInput {Home} ; Scroll to top of page
    Sleep DefaultClickDelay/2
  }
  ChromeClick(AddressBarXY[1],AddressBarXY[2],.5) ; Address Bar
  if(ScrollNum=0) and (LogMain=1)
    SendInput ^afacebook.com{Delete}{Enter} ; Reload facebook
  else
    SendInput ^a%Go2Address%{Delete}{Enter} ; Load go2
}
Sleep 3*DefaultClickDelay
if(ScrollNum>0){
  while(ChromeImageSearch("Play")=0)
    Sleep DefaultClickDelay
  xdefault:=ximage
  ydefault:=yimage
}
if(LogMain=0)
  ReturnMain(,1,1,5) ; Play
else if(ScrollNum=0)
  ReturnMain(,1,1,2) ; Log Out
else
  ReturnMain(,1,1) ; Tab 1

FormatTime hour, , H
FormatTime minute, , m
NewTime:=60*hour+minute+TimeZoneOffset
if(NewTime>=1440)
  NewTime-=1440
if(NewTime<0)
  NewTime+=1440
RecruitTime:=NewTime+RecruitDelay+10
if(RecruitTime>=1440)
  RecruitTime-=1440

ListLines Off