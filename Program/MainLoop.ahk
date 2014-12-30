Loop{
  ListLines Off
  OldTime:=NewTime
  FormatTime hour, , H
  FormatTime minute, , m
  FormatTime second, , s
  NewTime:=60*hour+minute+TimeZoneOffset
  if(NewTime>=1440)
    NewTime-=1440
  if(NewTime<0)
    NewTime+=1440
  NewTime60:=NewTime*60+second
  if(Broke2) and ((NewTime60>broketime+ReconnectWait) or ((broketime>NewTime60) and (NewTime60+86400>broketime+ReconnectWait)))
    Broke2=0
  if(EZCollect=0) and (NewTime60>=EZEndTime){									; Time to collect EZ-Rewards
    ListLines On
    EZCollect=1
    ListLines Off
  }
  if(SetRocksTime=1){												; Just got done with rocks, reset time
    ListLines On
    DoRocks=0
    RocksTime:=NewTime
    SetRocksTime=0
    IgnoreRocksTime=1
    ListLines Off
  }else if(IgnoreRocksTime=1) and (OldTime!=RocksTime){								; second pass on setting rocks time
    ListLines On
    IgnoreRocksTime=0
    ListLines Off
  }
  if(SetAltsHarvestTime=1){											; just got done with alts recruit, reset time
    ListLines On
    DoAltsHarvest=0
    AltsHarvestTime:=NewTime+AltsHarvestDelay+min(0,5-Floor(.75*NumAlts))
    if(AltsHarvestTime>=1440)
      AltsHarvestTime-=1440
    SetAltsHarvestTime=0
    ListLines Off
  }
  if((OldTime>NewTime) and (NewTime>0)) or ((OldTime=0) and (NewTime>OldTime)){					; Server Reset
    ListLines On
    Midnight=2
    DoRefresh=1
    if(EZEndTime>=86400)
      EZEndTime-=86400
    if(EZCollect=0) and (NewTime60>=EZEndTime)
      EZCollect=1
    if(Control=10){
      Control:=1
      RefillHelium=0
    }
    ListLines Off
														; League Time
  }else if(ContinueLeague=1) and ((CompareTime(LeagueStartTime1,NewTime,LeagueEndTime1)=1) or (CompareTime(LeagueStartTime2,NewTime,LeagueEndTime2)=1)){
    ListLines On
    ReturnControl:=Control
    Control=10
    ContinueLeague=0
    RefillHelium:=LeagueHelium
    ListLines Off
  }else if(Control=10) and (CompareTime(LeagueEndTime1+30,NewTime,LeagueStartTime2)=1){				; League time 1 ended without 3 matches
; ///// tighten up the 30 minutes by checking if league menu is up
    ListLines On
    ContinueLeague=1
    Control:=ReturnControl
    if(Num=1)
      RefillHelium:=RestrictedHelium
    else if(Num=2)
      RefillHelium:=TrialHelium
    else if(Num=3)
      RefillHelium:=ConstellationHelium
    else if(Num=4){
      RefillHelium:=InstanceHelium
      InstanceRefillCount=0
    }
    FlashClick(792,47) ; X -- check if this leaves fleets in league or not
    if(RefillHelium!=LeagueHelium) and (RefillHelium>0)
      Refill(NumFleets,RefillHelium)
    if(LeagueWeike=1){
      DismissFleet()
      DismissFleet()
      LeagueWeike=0
    }
    GoInstance()
    ListLines Off
  }
  if(RecruitDelay>0) and (CompareTime(OldTime,RecruitTime,NewTime,0)=1){					; Time to recruit on main
    ListLines On
    DoRecruit=1
    ListLines Off
  }
  if(AltsHarvestDelay>0) and (CompareTime(OldTime,AltsHarvestTime,NewTime,0)=1){				; Time to recruit on alts
    ListLines On
    DoAltsHarvest=1
    ListLines Off
  }
  if(IgnoreRocksTime=0) and ((CompareTime(OldTime,RocksTime,NewTime)=1) or (RocksTime=-1)){			; Time to do rocks
    ListLines On
    DoRocks=1
    ListLines Off
  }
  if(Broke) or (FlashOnTop()=0){										; Disconnected
    ListLines On
    if(Broke2)
      Sleep DoubleDisconnectDelay*1000
    else
      Sleep DisconnectDelay*1000
    ReturnMain()
    ListLines Off
  }else if(InstanceDone(0)=1){											; Instance Done
    if((Midnight=1) or (Midnight=2)) and (Control!=10){						; Midnight Clicked
      ListLines On
      RestrictedCount=0
      ConstellationCount=0
      InstanceCount=0
      LeagueCount=0
      if(DoLeague=1)
        ContinueLeague=1
      Control=1
      if(DoRefresh=1)
        ReturnMain(0)
      else
        FlashClick(734,501,1.5) ; Close
      if(RestrictedWeike=1){
        DoWeikeRestricteds(-1,-1)
        if(DoTrials=1)
          TrialsDone:=TrialsDone()
        Control=2
      }else if(CurrentFormation=1)
        Refill(NumFleets,RestrictedHelium)
      else if(DoRestricteds=1) and (Midnight=2)
        SwitchFormation(1,,0)
      if(Control=1)
        GoInstance()
      Midnight=3
      ListLines Off
    }else{
      ListLines On
      FlashClick(734,501,1.5) ; Close
      if(Control=0)
        Control=1
      else if(Control=1){
        if(RestrictedCount>=3){
          if(DoTrials=1)
            TrialsDone:=TrialsDone()
          Control=2
        }
      }else if(Control=2){
      }else if(Control=3){
        if(ConstellationCount>=NumConstellations){
          RefillHelium=0
          Control=4
        }
      }else if(Control=4){
        if(InstanceCount>=NumInstances){
          DismissAll()
          RefillHelium=0
          CurrentFormation=5
          Control=5
        }else if(InstanceRefillCount>=RefillEvery){
          RefillHelium:=InstanceHelium
          InstanceRefillCount=0
        }
      }
      if(RefillHelium>0){									; Refill
        if(Control!=2){
          FlashClick(726,613) ; Ground Base
          HarvestWarehouse(0)
          FlashClick(690,596) ; Space Base
        }
        Refill(NumFleets,RefillHelium)
      }
      ListLines Off
    }
    if(DoRecruit=1){										; Recruit
      ListLines On
      DoRecruit=0
      Recruit(DismissCommons0)
      RecruitTime:=NewTime+RecruitDelay+10
      if(RecruitTime>=1440)
        RecruitTime-=1440
      ListLines Off
    }
    if(Control=10){
      ListLines On
      CheckLeague=1
      ListLines Off
    }else{
      ListLines On
      GoInstance()
      ListLines Off
    }
  }else
    if(InstanceMenu(0)=1) or ((Control!=10) and (Control!=CurrentFormation)) or (CheckLeague=1){			;Instance Menu or SetFormation or do League
;//     
      if(TruceDies>=0) and (CompareTime(OldTime,TruceDies-15,NewTime)=1){			; Truce Dies
        ListLines On
        FlashClick(794,33) ; X
        DismissAll()
        Pause
        ListLines Off
      }
;//     
      if(DoRecruit=1){										; Recruit
        ListLines On
        DoRecruit=0
        if(Control=CurrentFormation) and (CheckLeague=0)
          FlashClick(794,33) ; X
        Recruit(DismissCommons0)
        RecruitTime:=NewTime+RecruitDelay+10
        if(RecruitTime>=1440)
          RecruitTime-=1440
        if(Control=CurrentFormation) and (CheckLeague=0)
          GoInstance()
        ListLines Off
      }else if((Midnight=1) or (Midnight=2)) and (Control!=10){					; Midnight Clicked
        ListLines On
        RestrictedCount=0
        ConstellationCount=0
        InstanceCount=0
        LeagueCount=0
        if(DoLeague=1)
          ContinueLeague=1
        Control=1
        if(DoRefresh=1)
          if(DoRestricteds=1)
            ReturnMain(0)
          else
            ReturnMain()
        else if(RestrictedWeike=1) or (Midnight=2)
          FlashClick(794,33,1.5) ; X
        if(RestrictedWeike=1){
          DoWeikeRestricteds(-1,-1)
          if(DoTrials=1)
            TrialsDone:=TrialsDone()
          Control=2
        }else if(CurrentFormation=1){
          Refill(NumFleets,RestrictedHelium)
          GoInstance()
        }else if(DoRestricteds=1) and (Midnight=2)
          SwitchFormation(1)
        else if(InstanceMenu()=0)
          GoInstance()
        Midnight=3
        ListLines Off
      }else if(Control=0){									; Just started bot
        ListLines On
        Control=1
        ListLines Off
      }else if(Control=1){									; Restricteds
        ListLines On
        if(DoRestricteds=0){
          if(DoTrials=1)
            TrialsDone:=TrialsDone()
          Control=2
        }else
          if(RestrictedsDone()=0)
            if(RestrictedWeike=1){
              DoWeikeRestricteds(-1,-1)
              if(DoTrials=1)
                TrialsDone:=TrialsDone()
              Control=2
            }else if(CurrentFormation!=1)
              SwitchFormation(1)
            else{
              if(RefillHelium>0){
                FlashClick(794,33) ; X
                Refill(NumFleets,RefillHelium)
                GoInstance(1)
              }
              SelectRestricted(RestrictedNum)
              ClickFleets(1)
              if(!Broke)
                Sleep 3*DefaultClickDelay
              if(InstanceMenu()=1)
                if(BuyPassports>0){
                  FlashClick(531,536) ; Buy a Passport
                  FlashClick(435,230) ; Passport
                  FlashClick(571,284,,3) ; Vouchers
                  FlashClick(559,311) ; Amount
                  if(!Broke){
                    SendInput ^a%BuyPassports% ; # of Passports
                    Sleep DefaultClickDelay
                  }
                  FlashClick(534,374) ; Purchase
                  FlashClick(671,162) ; X
                  FlashClick(711,117) ; GO
                }else{
                  if(DoTrials=1)
                    TrialsDone:=TrialsDone()
                  Control=2
                }
            }
          else{
            if(DoTrials=1)
              TrialsDone:=TrialsDone()
            Control=2
          }
        ListLines Off
      }else if(Control=2){									; Trials
        ListLines On
        if(DoTrials=0) or (TrialsDone=1)
          Control=3
        else
          if(CurrentFormation!=2)
            SwitchFormation(2)
          else{
            if(RefillHelium>0){
              TrialsDone=-1
              FlashClick(794,33) ; X
              Refill(NumFleets,RefillHelium)
              GoInstance()
            }
            if(TrialsDone=-1)
              TrialsDone:=TrialsDone()
            if(TrialsDone=0){
              TrialsDone=-1
              ClickFleets(2)
              if(!Broke)
                Sleep 3*DefaultClickDelay
              if(InstanceMenu()=1)
                if(UseSPCards=1){
                  Control=3 ; This needs to go use an SP card
                }else
                  Control=3
            }else
              Control=3
          }
        ListLines Off
      }else if(Control=3){									; Constellations
        ListLines On
        if(DoConstellations=0)
          Control=4
        else if(CurrentFormation!=3){
          SwitchFormation(3)
        }else if(ConstellationCount<NumConstellations){
          if(RefillHelium>0){
            FlashClick(794,33) ; X
            Refill(NumFleets,RefillHelium)
            GoInstance()
          }
          SelectConstellation(ConstellationSign,ConstellationNum)
          ClickFleets(3)
          if(!Broke)
            Sleep 3*DefaultClickDelay
          if(InstanceMenu()=1)
            Control=4
        }else
          Control=4
        ListLines Off
      }else if(Control=4){									; Instances
        ListLines On
        if(DoInstances=1) and (InstanceCount<NumInstances){
          if(CurrentFormation!=4)
            SwitchFormation(4)
          if(RefillHelium>0){
            FlashClick(794,33) ; X
            FlashClick(726,613) ; Ground Base
            HarvestWarehouse(0)
            FlashClick(690,596) ; Space Base
            Refill(NumFleets,RefillHelium)
            GoInstance()
            InstanceRefillCount=0
          }else if(TrialsDone!=-1){
            FlashClick(265,90) ; Normal
            TrialsDone=-1
          }
          SelectInstance(InstanceNum)
          ClickFleets(4)
          while(InstanceMenu()=1)
            Sleep DefaultClickDelay
        }else{
          if(InstanceMenu()=1)
            FlashClick(794,33,1.5) ; X
          if(CollectMail=0) and (FlashImageSearch("NewMail",280,55,420,85)=1)
            CollectMail=1
          DismissAll()
          RefillHelium=0
          CurrentFormation=5
          Control=5
        }
        ListLines Off
      }else if(Control=10){									; League
        ListLines On
        CheckLeague=0
        if(LeagueDone()=0)
          ClickFleets(10)
        else{
          Control:=ReturnControl
          if(Num=1)
            RefillHelium:=RestrictedHelium
          else if(Num=2)
            RefillHelium:=TrialHelium
          else if(Num=3)
            RefillHelium:=ConstellationHelium
          else if(Num=4){
            RefillHelium:=InstanceHelium
            InstanceRefillCount=0
          }
          if(RefillHelium!=LeagueHelium) and (RefillHelium>0)
            Refill(NumFleets,RefillHelium)
          if(LeagueWeike=1){
            DismissFleet()
            DismissFleet()
            LeagueWeike=0
          }
          GoInstance()
        }        
        ListLines Off
      }
    }else if(CollectMail=1) and (Control!=10){									; Collect Mail and Open Boxes
      ListLines On
      FlashClick(690,596) ; Space Base
      CollectMail(50,GetMail*)
      CollectMail=0
      if((OpenBoxEvery>0) and (OpenBoxes>0) and (InstanceBoxCount>=OpenBoxEvery)) or ((OpenExtraBoxes=1) and (OpenBoxEvery=1) and (OpenBoxes>1)){
        if(!Broke)
          SendInput {Shift Up}
        MenuButton(4,1) ; Bag
        ActivateBagSlots()
        i=0
        while(i<OpenBoxes) and (FlashImageSearch("TreasureBox",530,190,760,425)=1){
          ClickItem(ximage,yimage)
          i++
        }
        if(i=0) and (FlashImageSearch("BagEmpty25",715,380,760,425,8)=0) and (FlashImageSearch("BagFull25",715,380,760,425,8)=0) and (FlashImageSearch("BagLocked25",715,380,760,425,8)=0)
          FlashClick(787,257,2) ; Items
        while(i=0){
          while(i<OpenBoxes) and (FlashImageSearch("TreasureBox",530,190,760,425)=1){
            ClickItem(ximage,yimage)
            i++
          }
          if(i=0)
            if(Broke) or (FlashImageSearch("BagEmpty25",715,380,760,425,8)=1) or (FlashImageSearch("BagFull25",715,380,760,425,8)=1) or (FlashImageSearch("BagLocked25",715,380,760,425,8)=1){
              i=1
              OpenExtraBoxes=0
            }else{
              FlashClick(750,451,2) ; Right Arrow
              ActivateBagSlots()
              if(Broke) or (FlashImageSearch("BagEmpty1",530,190,575,235,8)=1) or (FlashImageSearch("BagFull1",530,190,575,235,8)=1) or (FlashImageSearch("BagPadlock1",715,380,760,425,8)=1){
                i=1
                OpenExtraBoxes=0
              }
            }
        }
        FlashClick(757,155) ; X
        InstanceBoxCount-=OpenBoxEvery
        if(InstanceBoxCount<0)
          InstanceBoxCount=0
      }
      GoInstance()
      ListLines Off
    }else if(DoRocks=1) and (Control!=10){									; Rocks
      ListLines On
      if(Midnight>0) and (DoAltsDailies=1)
        SpinsDailyRewards=1
      else
        SpinsDailyRewards=0
      Rocks(DoAltsHarvest)
      SetRocksTime=1
      if(DoAltsHarvest=1) and (DoAltsRocks=1)
        SetAltsHarvestTime=1
      ListLines Off
														; Dailies
    }else if(Midnight=3) and (Control!=10) and ((RocksTime>NewTime+5*NumAlts) or ((NewTime>RocksTime) and (RocksTime+1440>NewTime+5*NumAlts)) or ((DoAltsRocks=0) and (DoAltsWrenches=0))){
      ; it's time to run midnight
      ; it's not during league time
      ; it's out of range of rocks (front and back, also accounting for
      ;   wrap around midnight), or alts rocks aren't being done anyway
      ListLines On
      Midnight=0
      if(NewTime>RocksTime) or ((DoAltsRocks=0) and (DoAltsWrenches=0))
        SpinsDailyRewards=1
      else
        SpinsDailyRewards=0
      Spins(DoAltsHarvest)
      if(DoAltsHarvest=1) and (DoAltsDailies=1)
        SetAltsHarvestTime=1
      ListLines Off
														; Alts Harvest / Recruit
    }else if(Control!=10) and (DoRocks=0) and (Midnight=0) and (NumAlts>0) and ((HarvestAltsNow=1) or ((DoAltsHarvest=1) and ((NewTime<1440-3*NumAlts) or (DoAltsDailies=0) or ((RocksTime<=5*NumAlts) and ((DoAltsRocks=1) or (DoAltsWrenches=1)))) and ((NewTime<RocksTime-3*NumAlts) or ((NewTime>RocksTime) and (NewTime<RocksTime+1440)) or ((DoAltsRocks=0) and (DoAltsWrenches=0))))){
      ; if it's not during league time and it's not rocks time and it's not midnight time and there are alts and
        ; user set doaltsharvest now (which is only persistent if midnight and
        ;   rocks are not also immediate) or the following conditions all hold:
          ; it's time to recruit on alts
          ; it's out of range of midnight, or alts dailies aren't being done anyway, or alts
          ;   dailies will be delayed because of rocks (and alts rocks are being done)
          ; it's out of range of rocks (front and back, also accounting for
          ;   wrap around midnight), or alts rocks aren't being done anyway
      ListLines On
      AltsHarvest()
      SetAltsHarvestTime=1
      ListLines Off
    }else if((Midnight=1) or (Midnight=2)) and (Control=1){							; Midnight Clicked and busy with Restricteds
      ListLines On
      ConstellationCount=0
      InstanceCount=0
      LeagueCount=0
      if(DoLeague=1)
        ContinueLeague=1
      Midnight=3
      if(DoRefresh=1)
        ReturnMain()
      ListLines Off
    }else if(DoRefresh=1){											; Refresh after Midnight
      ListLines On
      ReturnMain()
      ListLines Off
    }else if(ScreenSaverCount>ScreenSaver*30){									; Jiggle Mouse
      ListLines On
      MouseGetPos xpos, ypos
      MouseMove 100, 100
      MouseMove 200, 200
      MouseMove %xpos%, %ypos%
      ScreenSaverCount=0
      Sleep DefaultClickDelay
      ListLines Off
    }else if(EZCollect=1){											; Collect EZ-Rewards
      ListLines On
      if(FlashImageSearch("LVSP",70,30,95,60)=1){
        MouseGetPos xpos, ypos
        FlashClick(6,243,0) ; Collect EZ-Reward
        MouseMove %xpos%, %ypos%
        EZCollect=0
        EZOn=0
        EZTimeLeft=915
        EZStart()
      }else
        ScreenSaverCount++
      Sleep DefaultClickDelay
      ListLines Off
														; Space Station Visible
    }else if(FlashImageSearch("SpaceStation1",,,,,,0)=1) or (FlashImageSearch("SpaceStation2",,,,,,0)=1) or (FlashImageSearch("SpaceStation3",,,,,,0)=1) or (FlashImageSearch("SpaceStation4",,,,,,0)=1){
      ListLines On
      GoInstance()
      ListLines Off
    }else{													; Wait
      ScreenSaverCount++
      if(mod(ScreenSaverCount,30)=0)
        ListLines On
      Sleep DefaultClickDelay
      ListLines Off
    }
}