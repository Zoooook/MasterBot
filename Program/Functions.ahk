ReturnMain(Go=1,Rec=0,ColMail=0,LoginControl=0){
  global
  ListLines Off
  LastFunctionCalled("ReturnMain")
  if(DebugMode=1)
    MsgBox ReturnMain( Go=%Go%, Rec=%Rec%, LoginControl=%LoginControl% )
  paramGo:=Go
  paramRec:=Rec
  paramColMail:=ColMail
  paramLoginControl:=LoginControl
  ListLines On

  EZStop()
  Login(0,LoginControl)
  EZStart()
  DoRefresh=0
  SetChat()
  HarvestWarehouse(0)
  if(ColMail=1) and (FlashImageSearch("NewMail",280,55,420,85)=1)
    CollectMail(50,GetMail*)
  if(DoScience=1)
    ClickScience(0)
  FlashClick(690,596) ; Space Base
  if(Rec=0){
    FormatTime temphour, , H
    FormatTime tempminute, , m
    TempTime:=60*temphour+tempminute+TimeZoneOffset
    if(TempTime>=1440)
      TempTime-=1440
    if(TempTime<0)
      TempTime+=1440
  }
  if(RecruitDelay>0) and (Rec=1) or (CompareTime(OldTime,RecruitTime,TempTime,0)=1){
    DoRecruit=0
    Recruit(DismissCommons0)
    RecruitTime:=TempTime+RecruitDelay+10
    if(RecruitTime>=1440)
      RecruitTime-=1440
  }
  if(Go=1)
    GoInstance()
}

EZStart(){
  global
  if(EZOn=0){
    FormatTime ezhour, , H
    FormatTime ezminute, , m
    FormatTime ezsecond, , s
    TempTime:=60*ezhour+ezminute+TimeZoneOffset
    if(TempTime>=1440)
      TempTime-=1440
    if(TempTime<0)
      TempTime+=1440
    EZEndTime:=TempTime*60+ezsecond+EZTimeLeft
    EZOn=1
  }
}

EZStop(){
  global
  if(EZOn=1){
    FormatTime ezhour, , H
    FormatTime ezminute, , m
    FormatTime ezsecond, , s
    TempTime:=60*ezhour+ezminute+TimeZoneOffset
    if(TempTime>=1440)
      TempTime-=1440
    if(TempTime<0)
      TempTime+=1440
    EZTimeLeft:=EZEndTime-(TempTime*60+ezsecond)
    if(EZTimeLeft>915)
      EZTimeLeft-=86400
    if(EZTimeLeft<0)
      EZTimeLeft=0
    EZOn=0
  }
}

SetChat(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("SetChat")
  if(DebugMode=1)
    MsgBox SetChat()
  ListLines On

  k=0
  i=1
  while(k=0) and (i<7){
    if(ChatChannels[i]=0)
      k=1
    else
      i++
  }
  if(k=1){
    while(FlashPixelGetColor(10,591)!=0x782903)
      FlashClick(62,510) ; Down Arrow
    i=1
    while(i<7){
      if(ChatChannels[i]=0)
        FlashClick(48,513+16*i,.5) ; Checkbox
      i++
    }
    if(DefaultChannel!=1) and (ChatSize=0)
      while(FlashPixelGetColor(10,591)=0x782903)
        FlashClick(62,510) ; Down Arrow
  }
  if(ChatSize>0)
    Loop %ChatSize%
      FlashClick(348,626,.5)
  if(DefaultChannel!=1){
    FlashClick(72,633) ; Up Arrow
    FlashClick(34,538+18*DefaultChannel)
  }
  if(ShowProductivity=1)
    FlashClick(959,57,.5)
  if(ShowBuilds=0)
    FlashClick(1012,638,.5)
}

Login(Count,LoginControl=0,ClickWheel=0){
  global
  ListLines Off
  LastFunctionCalled("Login")
  if(DebugMode=1)
    MsgBox Login( Count=%Count%, LoginControl=%LoginControl%, ClickWheel=%ClickWheel% )
  AltCount:=Count
  paramCount:=Count
  paramLoginControl:=LoginControl
  trueLoginControl:=LoginControl
  LoginWait=1
  LoginRetry=0
  paramClickWheel:=ClickWheel
  AltLocked=0
  ListLines On

  if(Broke)
    Broke2=1
  else
    Broke2=0
  Broke=0
  if(Count!=0){
    HarvestAltsNow=0
    EZStop()
  }
  Email:=Email%Count%
  Password:=Password%Count%
  while(trueLoginControl>=0){	; Very beginning, Click over to tab 1
    if(trueLoginControl=0){
      ChromeClick(Tab1XY[1],Tab1XY[2],.5) ; Tab 1
      SendInput ^1 ; Tab 1
      Sleep 1.5*DefaultClickDelay
      trueLoginControl=2
    }
    while(trueLoginControl>=1){	; Reload facebook
      if(trueLoginControl=1){
        ChromeClick(Tab1XY[1],Tab1XY[2],.5) ; Tab 1
        SendInput ^1 ; Tab 1
        Sleep 1.5*DefaultClickDelay
        ChromeClick(AddressBarXY[1],AddressBarXY[2],.5) ; Address Bar
        SendInput ^afacebook.com{Delete}{Enter}
        Sleep DefaultClickDelay
        if(AltLocked=1)
          return
        trueLoginControl=2
      }
      if(trueLoginControl=2){	; On facebook, log out
        if(ChromeImageSearch("AccountLocked")=1){
          if(Count=0) and (UnlockMain=0)
            Pause
          else if(Count>0) and (UnlockAlts=0){
            Broke=1
            AltLocked=1
            trueLoginControl=1
          }else{
            while(ChromeImageSearch("AccountLockedContinue")=0)
              Sleep DefaultClickDelay
            ChromeClick(ximage+28,yimage+3,,2)
            while(ChromeImageSearch("AccountSuspiciousAccess")=0)
              Sleep DefaultClickDelay
            while(ChromeImageSearch("AccountVerifyOkay")=0)
              Sleep DefaultClickDelay
            ChromeClick(ximage+36,yimage+3,,2)
            ChromeClick(Tab2XY[1],Tab2XY[2],.5) ; Tab 2
            SendInput ^2 ; Tab 2
            Sleep DefaultClickDelay/2
            trueLoginControl=4
          }
        }else{
          i=0
          while(i<15) and (FacebookLoggedOut()=0) and (ChromeImageSearch("LogoutArrow")=0) and (ChromeImageSearch("LogoutArrow2")=0) and (ChromeImageSearch("LogoutGear")=0) and (ChromeImageSearch("LogoutGear2")=0){
            Sleep DefaultClickDelay
            i++
          }
          if(checkFacebookLoggedOut=1)
            trueLoginControl=3
          if(trueLoginControl=2){
            if(i>=15)
              trueLoginControl=1
            else{
              xright:=ximage+6
              ytop:=yimage+5
              ChromeClick(xright,ytop) ; Arrow / Gear
              i=0
              while(ChromeImageSearch("Logout",,ytop,xright)=0) and (ChromeImageSearch("Logout2",,ytop,xright)=0) and (ChromeImageSearch("Logout3",,ytop,xright)=0) and (ChromeImageSearch("Logout4",,ytop,xright)=0) and (i<15){
                Sleep DefaultClickDelay
                i++
              }
              if(i>=15)
                trueLoginControl=1
              else{
                ChromeClick(ximage+18,yimage+5,2) ; Logout
                i=0
                while(trueLoginControl<3) and (i<15){
                  if(FacebookLoggedOut()=1)
                    trueLoginControl=3
                  else
                    Sleep DefaultClickDelay
                  i++
                }
                if(trueLoginControl<3)
                  trueLoginControl=1
              }
            }
          }
        }
      }
      while(trueLoginControl>=3){	; Logged out of facebook
        if(trueLoginControl=3){
          ChromeClick(EmailXY[1],EmailXY[2],.5) ; Email
          SendInput ^a{Raw}%Email%
          Sleep DefaultClickDelay/2
          ChromeClick(PasswordXY[1],PasswordXY[2],.5) ; Password
          SendInput ^a{Raw}%Password%
          Sleep DefaultClickDelay/2
          ChromeClick(LoginXY[1],LoginXY[2],,2) ; Login
          ChromeClick(Tab2XY[1],Tab2XY[2],.5) ; Tab 2
          SendInput ^2 ; Tab 2
          Sleep DefaultClickDelay/2
          trueLoginControl=4
        }
        j=0
        while(trueLoginControl>=4){	; Logged into facebook and on tab 2
          if(LoginRetry>0) and (Go2DashBoard()=1)
            trueLoginControl=5
          if(trueLoginControl=4){
            ChromeClick(AddressBarXY[1],AddressBarXY[2],.5) ; Address Bar
            SendInput ^a%Go2Address%{Delete}{Enter} ; Load go2
            Sleep 3*DefaultClickDelay
            trueLoginControl=5
          }
          i=0
          k=0
          while(trueLoginControl>=5)	; Go2 reloaded
            if(ScrollNum>0) and (ScrollFail()=1){
              Click %LeftSideX%, %LeftSideY% ; Left Side
              Sleep DefaultClickDelay/2
              SendInput {Home}{Down %ScrollNum%} ; Center Page
              Sleep DefaultClickDelay/2
            }else if(Go2DashBoard()=1){
              Sleep DefaultClickDelay
              trueLoginControl=-1
            }else if(LoginFail()=1){
              WinClose Log In | Facebook - Google Chrome
              Sleep DefaultClickDelay
              i++
              k++
              if(k<3){
                Click %EnterGameX%, %EnterGameY% ; Enter Game
                Sleep 5*LoginWait*DefaultClickDelay
              }
            }else if(i>=6) or (k>=3)
              if(k>0) or (j=1){
                trueLoginControl=0
                LoginRetry++
              }else{
                trueLoginControl=4
                LoginWait++
                j++
              }
            else{
              Click %EnterGameX%, %EnterGameY% ; Enter Game
              Sleep 5*LoginWait*DefaultClickDelay
              i++
            }
        }
      }
    }
  }
  if(Broke2){
    FormatTime brokehour, , H
    FormatTime brokeminute, , m
    FormatTime brokesecond, , s
    TempTime:=brokehour*60+brokeminute+TimeZoneOffset
    if(TempTime>=1440)
      TempTime-=1440
    if(TempTime<0)
      TempTime+=1440
    broketime:=TempTime*60+brokesecond
  }
  if(ClickWheel=1)
    FlashClick(654,488,2) ; Wheel
  else
    FlashClick(731,538,2) ; Cancel
  while(Go2DashBoard()=1)
    Sleep DefaultClickDelay
}

CompareTime(Front,Middle,Back,Greater=1){
  global
  paramFront:=Front
  paramMiddle:=Middle
  paramBack:=Back
  paramGreater:=Greater

  k=0
  if(Greater=0){
    if(Front<Middle) and (Back>=Middle)
      k=1
    else if(Back<Front)
      if(Front-1440<Middle) and (Back>=Middle)
        k=1
      else if(Front<Middle) and (Back+1440>=Middle)
        k=1
  }else{
    if(Front<=Middle) and (Back>Middle)
      k=1
    else if(Back<Front)
      if(Front-1440<=Middle) and (Back>Middle)
        k=1
      else if(Front<=Middle) and (Back+1440>Middle)
        k=1
  }
  return k
}

Spins(AltsRec){
  global
  ListLines Off
  LastFunctionCalled("Spins")
  if(DebugMode=1)
    MsgBox Spins( AltsRec=%AltsRec% )
  paramAltsRec:=AltsRec
  ListLines On

  FlashClick(726,613) ; Ground Base
  MenuButton(5,3,2) ; Lucky Wheel
  RunSpins(ShareWheel,SpinWheelVouchers0,1)
  if(Recurring=0)
    SpinWheelVouchers0=0
  HarvestWarehouse(0)
  CollectItems(GetItems*)
  Donate(DonateMetal0,DonateHelium0,DonateGold0)
  if(SpinsDailyRewards=1)
    DailyQuestRewards()
  if(DoAltsDailies=1) and (NumAlts>0){
    FlashClick(6,243) ; Collect EZ-Reward
    AltCount=1
    while(AltCount<=NumAlts){
      if(DoAltsSpins=1){
        b=0
        while(b=0){
          Login(AltCount,,1)
          RunSpins(AltsShareWheel,SpinWheelVouchers%AltCount%)
          if(Recurring=0)
            SpinWheelVouchers%AltCount%=0
          if(Broke) and (!AltLocked) and (RetryAltsSpins=1)
            Sleep AltsRetryDelay*1000
          else
            b=1
        }
      }else
        Login(AltCount)
      HarvestWarehouse(AltCount)
      if(FlashImageSearch("NewMail",280,55,420,85)=1)
        CollectMail(50,AltsGetMail*)
      CollectItems(AltsGetItems*)
      if(DoAltsRestricteds=1){
        b=0
        while(b=0){
          BrokeFlag=0
          if(Broke) and (!AltLocked) and (RetryAltsRestricteds=1){
            Sleep AltsRetryDelay*1000
            Login(AltCount)
          }
          FlashClick(690,596) ; Space Base
          if(!Broke)
            DismissWeike=1
          DoWeikeRestricteds(0,DismissCommons%AltCount%)
          if(AltsRecruit=1) and (AltRec=1)
            Recruit(2)
          if(Broke) and (!AltLocked){
            BrokeFlag=1
            if(RetryAltsDismissFleets=1) and (DismissWeike=1){
              c=0
              while(c=0){
                Sleep AltsRetryDelay*1000
                Login(AltCount)
                FlashClick(690,596) ; Space Base
                DismissFleet()
                DismissFleet()
                if(!Broke) or (RetryAltsDismissFleets=0){
                  DismissWeike=0
                  c=1
                }
              }
            }
          }else{
            c=0
            while(c=0){
              DismissFleet()
              DismissFleet()
              if(Broke) and (!AltLocked) and (RetryAltsDismissFleets=1) and (DismissWeike=1){
                Sleep AltsRetryDelay*1000
                Login(AltCount)
                FlashClick(690,596) ; Space Base
              }else{
                DismissWeike=0
                c=1
              }
            }
          }
          if(!BrokeFlag) or (AltLocked) or (RetryAltsRestricteds=0)
            b=1
        }
      }else if(AltsRecruit=1) and (AltsRec=1)
        Recruit(DismissCommons%AltCount%)
      if(DoAltsDonate=1){
        b=0
        while(b=0){
          if(Broke) and (!AltLocked) and (RetryAltsDonate=1){
            Sleep AltsRetryDelay*1000
            Login(AltCount)
          }
          Donate(DonateMetal%AltCount%,DonateHelium%AltCount%,DonateGold%AltCount%,MallLevel%AltCount%,MallShip%AltCount%)
          if(!Broke) or (AltLocked) or (RetryAltsDonate=0)
            b=1
        }
      }
      if(SpinsDailyRewards=1){
        b=0
        while(b=0){
          if(Broke) and (!AltLocked) and (RetryAltsQuestRewards=1){
            Sleep AltsRetryDelay*1000
            Login(AltCount)
          }
          DailyQuestRewards()
          if(!Broke) or (AltLocked) or (RetryAltsQuestRewards=0)
            b=1
        }
      }
      FlashClick(6,243) ; Collect EZ-Reward
      AltCount++
    }
    ReturnMain()
  }else{
    RecruitMailItems=1
    if(SpinsDailyRewards=1)
      RecruitDailyRewards=1
    if(DoScience=1)
      ClickScience(0)
    FlashClick(690,596) ; Space Base
    GoInstance()
  }
}

RunSpins(ShWh,Extra=0,Mult=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("RunSpins")
  if(DebugMode=1)
    MsgBox RunSpins( ShWh=%ShWh%, Extra=%Extra%, Mult=%Mult% )
  paramShWh:=ShWh
  paramExtra:=Extra
  paramMult:=Mult
  ListLines On

  FlashClick(516,402) ; Spin Free Wheel
;  ChromeClick(Tab3XY[1],Tab3XY[2]) ; Tab 3
;  Loop 2{
;    ChromeClick(AddressBarXY[1],AddressBarXY[2]) ; Address Bar
;    SendInput ^a%Go2Address%/event/wheel{Delete}{Enter} ; Load HD Wheel
;    Sleep 3*DefaultClickDelay
;    k=0
;    while(HDWheelLoaded()=0) and (HDWheelLoadFail()=0)
;      if(k=15){
;        ChromeClick(AddressBarXY[1],AddressBarXY[2]) ; Address Bar
;        SendInput ^a%Go2Address%/event/wheel{Delete}{Enter} ; Load HD Wheel
;        Sleep 3*DefaultClickDelay
;        k=0
;      }else{
;        Sleep DefaultClickDelay
;        k++
;      }
;    if(ChromeImageSearch("Start")=1){
;      ChromeClick(ximage+35,yimage+6,2) ; Spin HD Wheel
;      SendInput {Enter 2} ; In case of HD Spin Fail
;      Sleep DefaultClickDelay
;    }
;  }
;  ChromeClick(Tab2XY[1],Tab2XY[2],.5) ; Tab 2
;  SendInput ^2 ; Tab 2
;  Sleep DefaultClickDelay/2
  k=0
  while(k=0){						;Spin wheel first time
    while((FreeSpinFail()=0) and (FreeSpinDone()=0))
      Sleep DefaultClickDelay
    if(FreeSpinDone()=1){
      if(ShWh>0){
        FlashClick(533,422) ; Share
        ShWh--
        trueShWh:=ShWh
      }else
        FlashClick(666,212) ; X
      if(Mult>0) or (Extra>0)				;Spin wheel again for MVP Tool
        FlashClick(516,402) ; Spin Free Wheel
      else
        k=1
    }else
      k=1
  }
  if(Extra>0)
    FlashClick(557,415,2,3) ; Vouchers
  while(Extra>0){					;Spin wheel with vouchers
    FlashClick(449,445,2) ; Buy & Spin
    Extra-=5
    trueExtra:=Extra
    while((FreeSpinFail()=0) and (FreeSpinDone()=0))
      Sleep DefaultClickDelay
    if(FreeSpinDone()=1){
      if(ShWh>0){
        FlashClick(533,422) ; Share
        ShWh--
        trueShWh:=ShWh
      }else
        FlashClick(666,212) ; X
      if(Extra>0)
        FlashClick(516,402) ; Spin Free Wheel
    }else{
      Extra=0
      trueExtra:=Extra
    }
  }
  FlashClick(622,586) ; End
}

DoWeikeRestricteds(Num,DisCom){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("DoWeikeRestricteds")
  if(DebugMode=1)
    MsgBox DoWeikeRestricteds( Num=%Num%, DisCom=%DisCom% )
  paramNum:=Num
  paramDisCom:=DisCom
  ListLines On

  if(Num=-1)
    NumFleets++
  SwitchFormation(Num,DisCom)
  i=0
  while(i<2){
    GoInstance(1)
    SelectRestricted(1)
    ClickFleets(0)
    if(InstanceMenu()=1){
      FlashClick(794,33) ; X
      i=2
    }else{
      if(!Broke)
        Sleep 2*DefaultClickDelay
      FlashClick(730,562) ; Stop
      i++
    }
  }
}

Rocks(AltsRec){
  global
  ListLines Off
  LastFunctionCalled("Rocks")
  if(DebugMode=1)
    MsgBox Rocks( AltsRec=%AltsRec% )
  paramAltsRec:=AltsRec
  ListLines On

  if(DoAltsStealRocks=1) and (NumAlts>0){
    b=0
    while(b=0) and (NumAlts>1){
      AltCount:=NumAlts-1
      Login(AltCount)
      MenuButton(4,4,3) ; Subsidiary Territory
      if(StealRocksList%AltCount%[1]="")
        StealAll(StealRocks%AltCount%)
      else
        AltsStealRocks(StealRocks%AltCount%,StealRocksList%AltCount%*)
      FlashClick(785,102) ; X
      FlashClick(6,243) ; Collect EZ-Reward
      if(Broke) and (!AltLocked) and (RetryAltsStealRocks=1)
        Sleep AltsRetryDelay*1000
      else
        b=1
    }
    b=0
    while(b=0){
      AltCount:=NumAlts
      Login(AltCount)
      MenuButton(4,4,3) ; Subsidiary Territory
      if(StealRocksList%AltCount%[1]="")
        StealAll(StealRocks%AltCount%)
      else
        AltsStealRocks(StealRocks%AltCount%,StealRocksList%AltCount%*)
      FlashClick(785,102) ; X
      FlashClick(6,243) ; Collect EZ-Reward
      if(Broke) and (!AltLocked) and (RetryAltsStealRocks=1)
        Sleep AltsRetryDelay*1000
      else
        b=1
    }
  }
  if(StealRocks0>0){
    if((DoAltsStealRocks=1) and (NumAlts>0)) or (Broke)
      ReturnMain(0)
    else{
      FlashClick(726,613) ; Ground Base
      HarvestWarehouse(0)
      FlashClick(690,596) ; Space Base
    }
    MenuButton(4,4,3) ; Subsidiary Territory
    k=StealAll(StealRocks0)
    if(k>0)
      FlashClick(525,119,2) ; Return
    FlashClick(423,290) ; Harvest Vouchers
    BuildSpaceRocks(SpaceRocks0)
    if(DoAltsRocks=1) or (DoAltsWrenches=1){
      FlashClick(785,102) ; X
      FlashClick(6,243) ; Collect EZ-Reward
    }else
      FlashClick(680,170) ; Game Friend
  }
  if(DoAltsRocks=1) and (NumAlts>0){
    AltCount=1
    while(AltCount<=NumAlts){
      Login(AltCount)
      HarvestWarehouse(AltCount)
      if(AltsRecruit=1) and (AltsRec=1)
        Recruit(DismissCommons%AltCount%)
      MenuButton(4,4,3) ; Subsidiary Territory
      k=0
      if(DoAltsStealRocks=1) and (AltCount<NumAlts-1){
        if(StealRocksList%AltCount%[1]="")
          k=StealAll(StealRocks%AltCount%)
        else
          k=AltsStealRocks(StealRocks%AltCount%,StealRocksList%AltCount%*)
      }
      if(k>0)
        FlashClick(525,119,2) ; Return
      if(DoAltsGetVouchers=1)
        FlashClick(423,290) ; Harvest Vouchers
      if(DoAltsSpaceRocks=1){
        BuildSpaceRocks(SpaceRocks%AltCount%)
        if(AltCount<NumAlts) or (DoAltsWrenches=0){
          FlashClick(785,102) ; X
          if(DoAltsWrenches=0) and (SpinsDailyRewards=0)
            DailyQuestRewards()
          FlashClick(6,243) ; Collect EZ-Reward
        }
      }
      if(Broke) and (!AltLocked) and (RetryAltsSpaceRocks=1)
        Sleep AltsRetryDelay*1000
      else
        AltCount++
    }
  }
  if(DoAltsWrenches=1) and ((DoAltsRocks=0) or ((Broke) and (RetryAltsWrenches=0))) and (NumAlts>0){
    Login(NumAlts)
    HarvestWarehouse(NumAlts)
    MenuButton(4,4,3) ; Subsidiary Territory
  }
  if(DoAltsWrenches=1) and (NumAlts>0){
    AltCount:=NumAlts
    while(AltCount>0){
      if(AltCount<NumAlts){
        MenuButton(4,4,3) ; Subsidiary Territory
      }
      if(AltsWrenchAll=1)
        WrenchAll()
      else{
        Wrench(1)
        Wrench(2)
        Wrench(3)
        Wrench(4)
        Wrench(5)
        Wrench(6)
        FlashClick(754,441,1.5) ; Right Arrow
        Wrench(1)
        Wrench(2)
        Wrench(3)
      }
      FlashClick(785,102) ; X
      if(AltCount=NumAlts)
        HarvestWarehouse(AltCount)
      if(SpinsDailyRewards=0)
        DailyQuestRewards()
      FlashClick(6,243) ; Collect EZ-Reward
      if(Broke) and (!AltLocked) and (RetryAltsWrenches=1)
        Sleep AltsRetryDelay*1000
      else
        AltCount--
      if(AltCount>0){
        Login(AltCount)
        HarvestWarehouse(AltCount)
      }
    }
  }
  if(((DoAltsRocks=1) or (DoAltsWrenches=1)) and (NumAlts>0)) or (Broke){
    ReturnMain(0)
    MenuButton(4,4,3) ; Subsidiary Territory
  }else{
    if(StealRocks0=0){
      FlashClick(690,596) ; Space Base
      MenuButton(4,4,3) ; Subsidiary Territory
    }
  }
  if(DoAltsRocks=0) and (DoAltsWrenches=0) and (Midnight=0)
    RecruitDailyRewards=1
  WrenchAll()
  FlashClick(785,102) ; X
  if(SpinsDailyRewards=0)
    DailyQuestRewards()
  GoInstance()
}

StealAll(StealMax){
  global
  ListLines Off
  LastFunctionCalled("StealAll")
  if(DebugMode=1)
    MsgBox StealAll( StealMax=%StealMax% )
  paramStealMax:=StealMax
  ListLines On

  s=0
  Loop 2{
    i=1
    while(i<7) and (s<StealMax){
      var:=Harvest(i)
      s+=var
      i++
    }
    while(FlashPixelGetColor(754,441)!=0x742605) and (s<StealMax){
      FlashClick(754,441,1.5) ; Right Arrow
      i=1
      while(i<7) and (s<StealMax){
        var:=Harvest(i)
        s+=var
        i++
      }
    }
    if(s<StealMax) and (A_Index=1)
      FlashClick(760,170) ; FB Friend
  }
  return s
}

AltsStealRocks(MaxRocks,HarvestList*){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("AltsStealRocks")
  if(DebugMode=1){
    hl:=HarvestList[1]
    i=2
    while(HarvestList[i]!=""){
      hl.=" " HarvestList[i]
      i++
    }
    MsgBox AltsStealRocks( MaxRocks=%MaxRocks%, HarvestList=[ %hl% ] )
  }
  paramMaxRocks:=MaxRocks
  ListLines On

  i=1
  s=0
  p=1
  while(s<MaxRocks) and (HarvestList[i]!=""){
    while(ceil(HarvestList[i]/6)>p){
      FlashClick(754,441,1.5) ; Right Arrow
      p++
    }
    s+=Harvest(HarvestList[mod(i,6)])
    i++
  }
  return s
}

WrenchAll(){
  Loop 2{
    i=1
    while(i<7){
      Wrench(i)
      i++
    }
    while(FlashPixelGetColor(754,441)!=0x742605){
      FlashClick(754,441,1.5) ; Right Arrow
      i=1
      while(i<7){
        Wrench(i)
        i++
      }
    }
    if(A_Index=1)
      FlashClick(760,170) ; FB Friend
  }
}

BuildSpaceRocks(MetHel=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("BuildSpaceRocks")
  if(DebugMode=1)
    MsgBox BuildSpaceRocks( MetHel=%MetHel% )
  paramMetHel:=MetHel
  ListLines On

  FlashClick(626,478,5) ; Harvest Territories
  i=1
  OpenTerritory=0
  while(i<13){
    if(FlashPixelGetColor(RocksPixelX[i],RocksPixelY[i],1)>FlashPixelGetColor(RocksPixelX[i],RocksPixelY[i]))
      ConflictingLand%i%=1
    else{
      ConflictingLand%i%=0
      OpenTerritory++
    }
    i++
  }
  i=1
  k=1
  if(OpenTerritory>1){
    FlashClick(414,474) ; Build
    if(MetHel=2)
      FlashClick(523,404) ; 24 Hour He3
    else
      FlashClick(521,330) ; 24 Hour Metal
    while(k<=OpenTerritory/2){
      if(ConflictingLand%i%=0){
        FlashMouseMove(RocksClickX[i],RocksClickY[i],5) ; Sub #i
        FlashClick()
        k++
      }
      i++
    }
    if(MetHel=0){
      FlashMouseMove(610,430,5) ; Turn Off Build
      FlashClick()
    }
  }
  if(OpenTerritory>0){
    if(OpenTerritory=1) or (MetHel=0){
      FlashClick(414,474) ; Build
      if(MetHel=1)
        FlashClick(521,330) ; 24 Hour Metal
      else
        FlashClick(523,404) ; 24 Hour He3
    }
    while(k<=OpenTerritory){
      if(ConflictingLand%i%=0){
        FlashMouseMove(RocksClickX[i],RocksClickY[i],5) ; Sub #i
        FlashClick()
        k++
      }
      i++
    }
    FlashMouseMove(610,430,5) ; Turn Off Build
    FlashClick()
  }
}

DailyQuestRewards(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("DailyQuestRewards")
  if(DebugMode=1)
    MsgBox DailyQuestRewards()
  ListLines On

  MenuButton(4,3) ; Quest
  FlashClick(438,164) ; Daily
  if(FlashImageSearch("InsufficientPoints",460,415,565,430)=0) and (FlashImageSearch("Claimed",460,415,510,430)=0){
    FlashClick(443,415) ; 10
    iLag=0
    while(iLag<20){
      if(CollectQuestReward()=1)
        iLag=25
      else{
        FlashClick(443,415,.5,,,0) ; 10
        iLag++
      }
    }
    FlashClick(574,348,1.5,,,0) ; OK
  }
  if(FlashImageSearch("InsufficientPoints",650,415,755,430)=0) and (FlashImageSearch("Claimed",650,415,700,430)=0){
    FlashClick(633,414) ; 30
    iLag=0
    while(iLag<20){
      if(CollectQuestReward()=1)
        iLag=25
      else{
        FlashClick(633,414,.5,,,0) ; 30
        iLag++
      }
    }
    FlashClick(574,348,1.5,,,0) ; OK
  }
  if(FlashImageSearch("InsufficientPoints",460,445,565,460)=0) and (FlashImageSearch("Claimed",460,445,510,460)=0){
    FlashClick(442,449) ; 50
    iLag=0
    while(iLag<20){
      if(CollectQuestReward()=1)
        iLag=25
      else{
        FlashClick(442,449,.5,,,0) ; 50
        iLag++
      }
    }
    FlashClick(574,348,1.5,,,0) ; OK
  }
  if(FlashImageSearch("InsufficientPoints",650,445,755,460)=0) and (FlashImageSearch("Claimed",650,445,700,460)=0){
    FlashClick(632,445) ; 70
    iLag=0
    while(iLag<20){
      if(CollectQuestReward()=1)
        iLag=25
      else{
        FlashClick(632,445,.5,,,0) ; 70
        iLag++
      }
    }
    FlashClick(574,348,1.5,,,0) ; OK
  }
  FlashClick(785,111) ; X
}

Harvest(Num){
  global
  if(Broke)
    return 1
  paramNum:=Num
  if(FlashPixelGetColor(786,41*Num+168)>0x900000){
    FlashClick(730,41*Num+168) ; Friend <Num>
    FlashClick(555,476) ; Harvest All
    return 1
  }
  return 0
}

Wrench(Num){
  global
  if(Broke)
    return
  paramNum:=Num
  if(FlashPixelGetColor(788,41*Num+148)<0x670000){
    FlashClick(730,41*Num+148) ; Friend <Num>
    FlashClick(423,290) ; Wrench
  }
}

AltsHarvest(){
  global
  ListLines Off
  LastFunctionCalled("AltsHarvest")
  if(DebugMode=1)
    MsgBox AltsHarvest()
  ListLines On

  AltCount=1
  while(AltCount<=NumAlts){
    Login(AltCount)
    HarvestWarehouse(AltCount)
    if(RecruitMailItems=1){
      if(FlashImageSearch("NewMail",280,55,420,85)=1)
        CollectMail(50,AltsGetMail*)
      CollectItems(AltsGetItems*)
    }
    if(RecruitDailyRewards=1)
      DailyQuestRewards()
    if(AltsRecruit=1)
      Recruit(DismissCommons%AltCount%)
    if(AltsDoScience=1)
      ClickScience(AltCount)
    FlashClick(6,243) ; Collect EZ-Reward
    if(Broke) and (!AltLocked) and (RetryAltsHarvest=1)
      Sleep AltsRetryDelay*1000
    else
      AltCount++
  }
  if(RecruitMailItems=1)
    RecruitMailItems=0
  if(RecruitDailyRewards=1)
    RecruitDailyRewards=0
  ReturnMain()
}

Recruit(DisCom){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("Recruit")
  if(DebugMode=1)
    MsgBox Recruit( DisCom=%DisCom% )
  paramDisCom:=DisCom
  ListLines On

  MenuButton(2,4) ; Commander
  if(FlashPixelGetColor(231,488,1)>FlashPixelGetColor(231,488)){ ; Commander ready to recruit
    k=0
    i=1
    while(i<10) and (k=0){
      if(FlashImageSearch(CommandersMaxxed[i],200,80,250,100)=1)
        k=1
      i++
    }
    if(k=0) and (DisCom<2){
      FlashMouseMove(230,487)
      if(!Broke)
        Sleep DefaultClickDelay/2
      FlashClick(,,1.5) ; Recruit Commander
      if(RecruitMax()=1){
        FlashClick(707,344) ; OK
        k=1
      }
    }
    if((k=1) and (DisCom=1)) or (DisCom=2){
      FlashClick(468,480) ; Dismiss All Common Commanders
      FlashClick(583,346,1.5) ; OK
      FlashMouseMove(230,487)
      if(!Broke)
        Sleep DefaultClickDelay
      FlashClick(,,1.5) ; Recruit Commander
      if(RecruitMax()=1)
        FlashClick(707,344) ; OK
    }
  }
  FlashClick(837,91) ; X
}

CollectMail(MaxMessages,OthMess,RestRew,ShareRest,MailType*){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("CollectMail")
  if(DebugMode=1){
    mt:=MailType[1]
    i=2
    while(MailType[i]!=""){
      mt.=" " MailType[i]
      i++
    }
    MsgBox CollectMail( MaxMessages=%MaxMessages%, OthMess=%OthMess%, RestRew=%RestRew%, ShareRest=%ShareRest%, MailType=[ %mt% ] )
  }
  paramMaxMessages:=MaxMessages
  paramOthMess:=OthMess
  paramRestRew:=RestRew
  paramShareRest:=ShareRest
  paramMailType:=MailType
  ListLines On

  if(RestRew=0){
    TurnMailPages=0
    i=1
    while(TurnMailPages=0) and (i<17)
      if(MailType[i]=1)
        TurnMailPages=1
      else
        i++
  }else
    TurnMailPages=1
  MenuButton(4,2,2) ; Mail
  iLag=0
  while(iLag<20){
    if(IsMail()>0)
      iLag=25
    else{
      if(!Broke)
        Sleep DefaultClickDelay/2
      iLag++
    }
  }
  i=0
  while(i<MaxMessages) and ((im:=IsMail())>0){
    k=0								;Restricteds
    if(FlashImageSearch("RestrictedInstanceRewards",430,230,630,480)=1) and ((RestRew=1) or (MailOverflow()=1)){
      k=1
      FlashClick(450,yimage+3,2) ; Message
      if(ShareRest=1)
        FlashClick(529,420) ; Share
      else
        FlashClick(666,214) ; X
      iLag=0
      while(iLag<20){
        if(FlashImageSearch("Allcharge",600,490,670,510)=1)
          iLag=25
        else{
          if(!Broke)
            if(ShareRest=1)
              FlashClick(529,420,.5) ; Share
            else
              FlashClick(666,214,.5) ; X
          iLag++
        }
      }
      FlashClick(634,500) ; All Charge
      iLag=0
      while(iLag<20){
        if(AllCharged()=1)
          iLag=25
        else{
          if(!Broke)
            FlashClick(634,500,.5) ; All Charge
          iLag++
        }
      }
      FlashClick(250,500,1.5) ; Delete
    }
    j=1
    while(k=0) and (j<14){					;Collect items
      if(FlashImageSearch(MailName[j],430,230,630,480)=1) and ((MailType[j]=1) or (MailOverflow()=1)){
        k=1
        FlashClick(450,yimage+3,2)
        iLag=0
        while(iLag<20){
          if(FlashImageSearch("Allcharge",600,490,670,510)=1)
            iLag=25
          else{
            if(!Broke)
              Sleep DefaultClickDelay/2
            iLag++
          }
        }
        FlashClick(634,500) ; All Charge
        iLag=0
        while(iLag<20){
          if(AllCharged()=1)
            iLag=25
          else{
            if(!Broke)
              FlashClick(634,500,.5) ; All Charge
            iLag++
          }
        }
        FlashClick(250,500,1.5) ; Delete
        if(j=3) and (DoInstances=1) and (OpenBoxEvery>0) and (OpenBoxes>0){
          InstanceBoxCount++
          OpenExtraBoxes=1
        }
      }else
        j++
    }
    while(k=0) and (j<17){ ;14+3				;Share battle reports
      if(MailType[j+4]=1) and (MailType[j]=1) and (FlashImageSearch(MailName[j],430,230,630,480)=1){
        k=1
        FlashClick(450,yimage+3,2) ; Message
        FlashClick(529,420,1.5) ; Share
        FlashClick(722,94,1.5) ; X              
        FlashClick(250,500,1.5) ; Delete
      }else
        j++
    }
    if(k=0){
      j=14 ; 14
      MailOverflow()
      while(j<17){						;Delete battle reports and rank change
        if((MailType[j]=1) and (MailType[j+4]=0)) or (checkMailOverflow=1){
          yimage=215
          while(FlashImageSearch(MailName[j],430,yimage+15,630,480)=1){
            k=1
            FlashClick(201,yimage+3,.5) ; Checkbox
          }
        }
        j++
      }
      if(k=1)
        FlashClick(360,500,1.5) ; Delete
      else if(TurnMailPages=1) or (MailOverflow()=1){
        n=1							;Next page
        while(n<10) and (FlashImageSearch(MailLastPage[n],510,530,540,550)=0)
          n++
        if(n=10)
          FlashClick(576,537) ; Right Arrow
      }
    }
    if(k=0) and (n<10){
      if(OthMess=1){						;Delete other messages
        FlashClick(550,110) ; Normal Letter
        FlashClick(530,500) ; Show Unread Mail Only
        while(i<MaxMessages) and ((im:=IsMail())>0){
          i++
          FlashClick(250,500) ; Select All
          FlashClick(360,500,1.5) ; Delete
          if(im<9){
            iLag=0
            while(iLag<20){
              if(IsMail()=0)
                iLag=25
              else{
                if(!Broke)
                  Sleep DefaultClickDelay/2
                iLag++
              }
            }
          }else
            Sleep DefaultClickDelay
        }
      }else
        i:=MaxMessages
    }
    if(k=1){
      if(im<9){
        iLag=0
        while(iLag<20){
          if(IsMail()<im)
            iLag=25
          else{
            if(!Broke)
              Sleep DefaultClickDelay/2
            iLag++
          }
        }
      }else
        Sleep DefaultClickDelay
      i++
    }
  }
  FlashClick(825,57) ; X
}

MailOverflow(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  checkMailOverflow=-1
  p=1
  while(p<5){
    if(FlashImageSearch(MailOverflow[p],510,530,540,550)=1)
      checkMailOverflow=1
    p++
  }
  p=1
  while(p<16){
    if(FlashImageSearch(MailNotOverflow[p],510,530,540,550)=1)
      checkMailOverflow=0
    p++
  }
  if(checkMailOverflow=-1)
    checkMailOverflow=1
  ListLines On
  return checkMailOverflow
}

CollectItems(GetItem*){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("CollectItems")
  if(DebugMode=1){
    gi:=GetItem[1]
    i=2
    while(GetItem[i]!=""){
      gi.=" " GetItem[i]
      i++
    }
    MsgBox CollectItems( GetItem=[ %gi% ] )
  }
  paramGetItem:=GetItem
  ListLines On

  SendInput {Shift Up}
  MenuButton(4,1) ; Bag
  ActivateBagSlots()
  if(FlashImageSearch("BagEmpty25",715,380,760,425,8)=0) and (FlashImageSearch("BagFull25",715,380,760,425,8)=0) and (FlashImageSearch("BagLocked25",715,380,760,425,8)=0)
    FlashClick(787,257,2) ; Items
  BagDone=0
  while(BagDone=0){
    j=0
    while(j=0){
      j=1
      i=1
      Multiple=0
      ConfirmItem=1
      while(i<35){
        ListLines Off
        if(i=4) or (i=31)
          Multiple=1
        else if(i=25) or (i=32)
          Multiple=0
        if(i=4) or (i=16) or (i=21)
          ConfirmItem=0
        else if(i=7) or (i=17) or (i=25)
          ConfirmItem=1
        if(GetItem[i]=1) and (FlashImageSearch(ItemName[i],530,190,760,425)=1){
          j=0
          ClickItem(ximage,yimage,Multiple,ConfirmItem)
        }
        i++
      }
    }
    if(Broke) or (FlashImageSearch("BagEmpty25",715,380,760,425,8)=1) or (FlashImageSearch("BagFull25",715,380,760,425,8)=1) or (FlashImageSearch("BagLocked25",715,380,760,425,8)=1)
      BagDone=1
    else{
      FlashClick(750,451,2) ; Right Arrow
      ActivateBagSlots()
      if(Broke) or (FlashImageSearch("BagEmpty1",530,190,575,235,8)=1) or (FlashImageSearch("BagFull1",530,190,575,235,8)=1) or (FlashImageSearch("BagPadlock1",715,380,760,425,8)=1)
        BagDone=1
    }
  }
  FlashClick(757,155) ; X
}

ClickItem(xitem,yitem,Mult=0,ConfItem=1){
  global
  ListLines Off
  paramxItem:=xItem
  paramyItem:=yItem
  paramMult:=Mult
  paramConfItem:=ConfItem
  ListLines On

  FlashClick(xitem+23,yitem+10) ; Item
  if(Mult=1){
    iLag=0
    while(iLag<10){
      if(FlashImageSearch("Multiple",xitem+50,yitem+40,xitem+110,yitem+70)=1)
        iLag=15
      else{
        if(!Broke)
          Sleep DefaultClickDelay/2
        iLag++
      }
    }
    if(iLag=15){
      FlashClick(xitem+79,yitem+57) ; Multiple
      jLag=0
      while(jLag<20){
        if(MultipleItems()=1)
          jLag=25
        else{
          if(!Broke)
            Sleep DefaultClickDelay/2
          jLag++
        }
      }
      if(FlashPixelGetColor(490,338)!=0x661F08)
        FlashClick(490,344) ; >|
      FlashClick(592,342) ; OK
    }
  }else{
    iLag=0
    while(iLag<10){
      if(FlashImageSearch("Use",xitem+60,yitem+20,xitem+100,yitem+45)=1)
        iLag=15
      else{
        if(!Broke)
          Sleep DefaultClickDelay/2
        iLag++
      }
    }
    if(iLag=15){
      FlashClick(xitem+79,yitem+36) ; Use
      i--
    }
  }
  if(iLag=15) and (ConfItem=1){
    jLag=0
    while(jLag<20){
      if(ConfirmItems()=1)
        jLag=25
      else{
        if(!Broke)
          Sleep DefaultClickDelay/2
        jLag++
      }
    }
    FlashClick(513,438) ; Confirm
  }
  iLag=0
  while(iLag<20){
    if(BagScreen()=1)
      iLag=25
    else{
      FlashClick(513,438,.5) ; Confirm
      iLag++
    }
  }
  if(!Broke)
    if(ConfItem=1)
      Sleep DefaultClickDelay
    else
      Sleep 2*DefaultClickDelay
}

ActivateBagSlots(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  jbag=200
  while(jbag<400){
    ibag=542
    while(ibag<750){
      if(FlashPixelGetColor(ibag,jbag,,0)=0x333233) and (FlashPixelGetColor(ibag+22,jbag,,0)=0x333233) and (FlashPixelGetColor(ibag,jbag+24,,0)=0x333233) and (FlashPixelGetColor(ibag+22,jbag+24,,0)=0x333233){
        ListLines On
        FlashClick(ibag+10,jbag+10) ; Padlock
        if(FlashPixelGetColor(542,339)=0x591D0C){
          FlashClick(705,343,.5) ; Cancel
          FlashMouseMove(513,438)
          if(!Broke)
            Sleep DefaultClickDelay
          jbag=400
          ibag=750
        }else
          FlashClick(577,345,1.5) ; Activate
        ListLines Off
      }
      ibag+=46
    }
    jbag+=47
  }
  ListLines On
}

Donate(DonMet,DonHel,DonGold,MLev=0,MShip=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("Donate")
  if(DebugMode=1)
    MsgBox Donate( DonMet=%DonMet%, DonHel=%DonHel%, DonGold=%DonGold%, MLev=%MLev%, MShip=%MShip% )
  paramDonMet:=DonMet
  paramDonHel:=DonHel
  paramDonGold:=DonGold
  paramMLev:=MLev
  paramMShip:=MShip
  ListLines On

  if(DonMet>0) or (DonHel>0) or (DonGold>0){
    MenuButton(3,4) ; Corps
    FlashClick(613,470,1.5) ; My Corps
    FlashClick(211,467) ; Corps Donations
    if(DonMet>0){
      FlashClick(268,178) ; Metal
      if(!Broke){
        SendInput %DonMet%
        Sleep DefaultClickDelay
      }
      FlashClick(370,180) ; Donate
    }
    if(DonHel>0){
      FlashClick(268,238) ; Helium
      if(!Broke){
        SendInput %DonHel%
        Sleep DefaultClickDelay
      }
      FlashClick(371,244) ; Donate
    }
    if(DonGold>0){
      FlashClick(268,300) ; Gold
      if(!Broke){
        SendInput %DonGold%
        Sleep DefaultClickDelay
      }
      FlashClick(370,302) ; Donate
    }
    FlashClick(829,81) ; X
    if(MLev>0) and (MShip>0){
      FlashClick(244,458,0) ; Corps Mall
      FlashClick(268,458,0) ; Corps Mall
      FlashClick(270,475,0) ; Corps Mall
      FlashClick(244,475,0) ; Corps Mall
      FlashClick(258,469,2) ; Corps Mall
      FlashClick(260,144+28*MLev,,2) ; Mall #
      FlashClick(415,110+56*MShip,,2) ; Ship #
      FlashClick(710,441) ; Max
      FlashClick(654,465) ; Purchase
      FlashClick(574,348,,,,0) ; OK
      FlashClick(755,111) ; X
    }
    FlashClick(829,81) ; X
  }
}

HarvestWarehouse(Count){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("HarvestWarehouse")
  if(DebugMode=1)
    MsgBox HarvestWarehouse( Count=%Count% )
  paramCount:=Count
  xstart:=Warehouse%Count%XY[1]
  ystart:=Warehouse%Count%XY[2]
  ListLines On

  i=0
  while(i<10){
    if(i=0) or (i=5){
      if(i=5)
        FlashClick(726,613) ; Ground Base
      FlashClick(xstart,ystart) ; Warehouse
    }
    if(FlashImageSearch("Harvest",xstart,ystart,xstart+120,ystart+100)=1){
      i=10
      FlashClick(ximage+23,yimage+5) ; Harvest
    }else{
      i++
      if(!Broke)
        Sleep DefaultClickDelay
    }
  }
}

GoInstance(Type=4){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("GoInstance")
  if(DebugMode=1)
    MsgBox GoInstance( Type=%Type% )
  paramType:=Type
  ListLines On

  if(Type!=10)
    Type++
  if(Type=5)
    Type=1
  trueType:=Type
  if(Control!=5){
    igo=0
    while(igo<10){
      if(Broke)
        return
      if(igo=5)
        if(InstanceDone()=1){
          FlashClick(734,501,1.5) ; Close
          igo=0
        }else{
          FlashClick(690,627) ; Return to Homeland
          FlashClick(690,596,1.5) ; Space Base
        }
      if(igo=0) or (igo=5)
        if(InstanceMenu()=1)
          if(Type=10){
            FlashClick(794,33,.5) ; X
            igo--
          }else{
            FlashClick(165+100*Type,90) ; Normal/Restricted/Trial/Constellations
            igo=12
          }
        else{
          if(CollectMail=0) and (FlashImageSearch("NewMail",280,55,420,85)=1)
            CollectMail=1
          CenterSpaceStation()
        }
      if(igo<10)
        if(Type=10) and (FlashImageSearch("League",480,340,555,425)=1){
          FlashClick(ximage+21,yimage+6,2) ; League
          igo=12
        }else if(Type!=10) and (FlashImageSearch("Instance",475,320,560,400)=1){
          FlashClick(ximage+26,yimage+5,2) ; Instance
          igo=11
        }else{
          igo++
          Sleep DefaultClickDelay
        }
      if(igo=10)
        igo=0
    }
    if(igo=11) and (Type>1)
      FlashClick(165+100*Type,90,1.5) ; Normal/Restricted/Trial/Constellations
  }
}

CenterSpaceStation(ClickSS=1){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  paramClickSS:=ClickSS
  checkCenterSpaceStation=1

  if(FlashImageSearch("SpaceStation1",513,298,531,315,,0)=1) or (FlashImageSearch("SpaceStation2",513,298,531,315,,0)=1) or (FlashImageSearch("SpaceStation3",513,298,531,315,,0)=1) or (FlashImageSearch("SpaceStation4",513,298,531,315,,0)=1){
    if(ClickSS=1)
      FlashClick(518,307,,,0)
    checkCenterSpaceStation=1
  }else if(FlashImageSearch("SpaceStation1",,,,,,0)=1) or (FlashImageSearch("SpaceStation2",,,,,,0)=1) or (FlashImageSearch("SpaceStation3",,,,,,0)=1) or (FlashImageSearch("SpaceStation4",,,,,,0)=1){
    FlashClickDrag(ximage+3,yimage+7,518,307,0)
    if(ClickSS=0)
      FlashClick(5,90,,,0)
    checkCenterSpaceStation=1
  }else{
    FlashClick(690,596,,,0) ; Space Base
    if(!Broke)
      Sleep 2*DefaultClickDelay
    if(FlashImageSearch("SSFailTest",,,,,,0)=1){
      SendInput ^{PrintScreen}
      ;MsgBox Space Station Failed
    }
    if(ClickSS=1)
      FlashClick(518,307,,,0)
    ListLines On
    checkCenterSpaceStation=0
  }
  ListLines On
  return checkCenterSpaceStation
}

DismissAll(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("DismissAll")
  if(DebugMode=1)
    MsgBox DismissAll()
  ListLines On

  if(TrialFleetsOut=1)
    DismissTrials()
  else if(NumFleets=0)
    CenterSpaceStation(0)
  while(NumFleets>0){
    DismissFleet()
    NumFleets--
  }
  k=0
  FlashClick(DefaultFleetX,DefaultFleetY) ; Fleet
  while(k<2){
    if(FlashImageSearch("Dismiss",DefaultFleetX+50,DefaultFleetY+25,DefaultFleetX+130,DefaultFleetY+70)=1) or (FlashImageSearch("Dismiss2",DefaultFleetX+50,DefaultFleetY+25,DefaultFleetX+130,DefaultFleetY+70)=1){
      FlashClick(ximage+21,yimage+5) ; Dismiss
      FlashClick(DefaultFleetX,DefaultFleetY) ; Fleet
    }else{
      k++
      if(!Broke)
        Sleep DefaultClickDelay
    }
  }
  NumFleets=0
}

DismissTrials(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("DismissTrials")
  if(DebugMode=1)
    MsgBox DismissTrials()
  ListLines On

  if(TrialFleets<1)
    CenterSpaceStation(0)
  i=1
  while(i<=TrialFleets){
    DismissFleet(TrialFleet%i%XYT[1],TrialFleet%i%XYT[2])
    i++
  }
  NumFleets-=TrialFleets
  TrialFleetsOut=0
}

DismissFleet(xpos=0,ypos=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramxpos:=xpos
  paramypos:=ypos
  CenterSpaceStation(0)
  ListLines Off
  if(xpos=0) and (ypos=0){
    xpos:=DefaultFleetX
    ypos:=DefaultFleetY
    truexpos:=xpos
    trueypos:=ypos
  }
  FlashClick(xpos,ypos) ; Fleet
  FlashClick(xpos+93,ypos+48) ; Dismiss
  ListLines On
}

SwitchFormation(Num,DisCom=0,Go=1){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("SwitchFormation")
  if(DebugMode=1)
    MsgBox SwitchFormation( Num=%Num%, DisCom=%DisCom%, Go=%Go% )
  paramNum:=Num
  paramDisCom:=DisCom
  paramGo:=Go
  ListLines On

  if(InstanceMenu()=1)
    FlashClick(794,33) ; X
  if(Num!=0){
    if(CurrentFormation=2)
      DismissTrials()
    else
      DismissAll()
    TrialsDone=-1
  }
  if(Num<=0){
    MenuButton(2,2,3) ; Create Fleet
    if(Discom>=0) and (((Num=-1) and (RecruitDelay>0)) or ((Num=0) and (AltsRecruit=1))){
      if(FlashPixelGetColor(227,457,1)>FlashPixelGetColor(227,457)){ ; Commander ready to recruit
        AltRec=1
        SetAltsHarvestTime=1
        if(DisCom!=2){
          FlashMouseMove(230,460)
          if(!Broke)
            Sleep DefaultClickDelay/2
          FlashClick(,,1.5) ; Recruit Commander
          if(RecruitMax()=1){
            FlashClick(707,344) ; OK
            if(DisCom=0)
              AltRec=0
          }else
            AltRec=0
        }
      }else
        AltRec=0
    }
    if(Num=-1)
      CurrentFormation=-1
    CreateFleet(0)
    FlashClick(791,129,1.5) ; X
    MenuButton(2,3) ; Fleet Supplies
    FlashClick(357,117) ; Supply All
    FlashClick(720,116) ; All Confirmed
    return
  }
  if((CurrentFormation=1) or (CurrentFormation=-1)) and (NewTime>=RocksTime) and ((Midnight=0) or (SpinsDailyRewards=0))
    DailyQuestRewards()
  if(Num=4){
    if(FlashImageSearch("NewMail",280,55,420,85)=1)
      CollectMail(50,GetMail*)
    CollectMail=0
    if(DoScience=1)
      ClickScience(0)
    CollectItems(GetItems*)
  }
  MenuButton(2,2,3) ; Create Fleet

  ListLines Off
  LastFunctionCalled("SetFormation")
  if(DebugMode=1)
    MsgBox SetFormation( Num=%Num% )
  if(Broke){
    ListLines On
    return
  }
  ListLines On

  SetFormation(Num)
  if(Broke){
    Control=0
    CurrentFormation=0
  }else
    CurrentFormation:=Num
  if(Num!=2)
    FlashClick(791,129) ; X
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
  FlashClick(726,613) ; Ground Base
  HarvestWarehouse(0)
  FlashClick(690,596) ; Space Base
  Refill(NumFleets,RefillHelium)
  if(Go=1)
    GoInstance()
}

CreateTrialFleet1(Type,Range=0,Target=0,Commander=1,Save=0){
  ListLines Off
  CreateTrialFleet(1,Type,Range,Target,Commander,Save)
}

CreateTrialFleet2(Type,Range=0,Target=0,Commander=1,Save=0){
  ListLines Off
  CreateTrialFleet(2,Type,Range,Target,Commander,Save)
}

CreateTrialFleet3(Type,Range=0,Target=0,Commander=1,Save=0){
  ListLines Off
  CreateTrialFleet(3,Type,Range,Target,Commander,Save)
}

CreateTrialFleet4(Type,Range=0,Target=0,Commander=1,Save=0){
  ListLines Off
  CreateTrialFleet(4,Type,Range,Target,Commander,Save)
}

CreateTrialFleet(Num,Type,Range,Target,Commander,Save){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("CreateTrialFleet")
  if(DebugMode=1)
    MsgBox CreateTrialFleet( Num=%Num%, Type=%Type%, Range=%Range%, Target=%Target%, Commander=%Commander%, Save=%Save% )
  paramNum:=Num
  ListLines On

  TrialFleetsOut=1
  CreateFleet(Type,Range,Target,Commander,Save)
  if((TrialFleet%Num%XYT[1]>0) and (TrialFleet%Num%XYT[2]>0)) or (TrialFleet%Num%XYT[3]>0) or (Num=TrialFleets){
    FlashClick(791,129) ; X
    TurnFleet(,,TrialFleet%Num%XYT[3])
  }
  if(TrialFleet%Num%XYT[1]>0) and (TrialFleet%Num%XYT[2]>0){
    FlashClick(DefaultFleetX,DefaultFleetY) ; New Fleet
    FlashClick(TrialFleet%Num%XYT[1],TrialFleet%Num%XYT[2]) ; Move to Position
  }
  if(Num!=TrialFleets) and (((TrialFleet%Num%XYT[1]>0) and (TrialFleet%Num%XYT[2]>0)) or (TrialFleet%Num%XYT[3]>0))
    MenuButton(2,2,3) ; Create Fleet
}

CreateFleet(Type,Range=0,Target=0,Commander=1,Save=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("CreateFleet")
  if(DebugMode=1)
    MsgBox CreateFleet( Type=%Type%, Range=%Range%, Target=%Target%, Commander=%Commander%, Save=%Save% )
  paramType:=Type
  paramRange:=Range
  paramTarget:=Target
  paramCommander:=Commander
  paramSave:=Save
  ListLines On

  if(Type=0){ ; AltRestricted
    FillStack(0,1,1,1)
    PickCommander(1)
    FlashClick(782,399) ; Save Fleet
    return
  }
  if(Type=1) or (Type=2) or (Type=3)
    LoadFleet(Type)
  else{
    ListLines Off
    LastFunctionCalled("BuildFleet")
    if(DebugMode=1)
      MsgBox BuildFleet( Type=%Type% )
    ListLines On

    BuildFleet(Type)
  }
  if(Save=1) or (Save=2) or (Save=3)
    SaveFleet(Save)
  if(Range>0){
    FlashClick(486,180) ; Dropdown Menu
    FlashClick(486,18*Range+184) ; Pick Range
  }
  if(Target>0){
    FlashClick(684,180) ; Dropdown Menu
    FlashClick(684,18*Target+184) ; Pick Target
  }
  PickCommander(Commander)
  NumFleets++
  FlashClick(782,399,2) ; Save Fleet
}

ClickFleets(Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("ClickFleets")
  if(DebugMode=1)
    MsgBox ClickFleets( Num=%Num% )
  paramNum:=Num
  ListLines On

  if(Num=10)
    FlashClick(709,171) ; Increase Fleet
  else
    FlashClick(709,163) ; Increase Fleet
  iLag=0
  while(iLag<20){
    if(IncreaseFleet()=1)
      iLag=25
    else{
      if(!Broke)
        Sleep DefaultClickDelay/2
      iLag++
    }
  }
  Page=1
  MaxPages:=Ceil(NumFleets/9)
  if(Num=0)					; AltRestricteds
    FlashClick(336,211) ; Fleet 1
  else if(Num=2)				; Trials
    ClickAllCommanders()
  else if(Num=10){				; League
    FlashClick(336,211) ; Fleet 1
    if(LeagueFleets>1) and (NumFleets>1){
      FlashClick(520,211) ; Fleet 2
      if(LeagueFleets>2) and (NumFleets>2){
        FlashClick(704,211) ; Fleet 3
        if(LeagueFleets>3) and (NumFleets>3)
          FlashClick(336,315) ; Fleet 4
      }
    }
  }else{
    ListLines Off
    LastFunctionCalled("SelectFleets")
    if(DebugMode=1)
      MsgBox SelectFleets( Num=%Num% )
    ListLines On

    SelectFleets(Num)
  }
  FlashClick(764,502) ; OK / Race
  if(Num=10){
    LeagueCount++
    FlashClick(711,129,2) ; GO
  }else
    FlashClick(711,117,2) ; GO
  if(!Broke){
    if(Num=1)
      RestrictedCount++
    else if(Num=2)
      RefillHelium:=TrialHelium
    else if(Num=3){
      ConstellationCount++
      if(ConstellationCount<NumConstellations)
        RefillHelium:=ConstellationHelium
    }else if(Num=4){
      InstanceRefillCount++
      if(InstanceRefillCount>=RefillEvery)
        RefillHelium:=InstanceHelium
      InstanceCount++
    }
  }
}

TurnFleet(xpos=0,ypos=0,Num=1){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("TurnFleet")
  if(DebugMode=1)
    MsgBox TurnFleet( xpos=%xpos%, ypos=%ypos%, Num=%Num% )
  paramxpos:=xpos
  paramypos:=ypos
  paramNum:=Num
  ListLines On

  if(Num>0){
    if(xpos=0) and (ypos=0){
      xpos:=DefaultFleetX
      ypos:=DefaultFleetY
      truexpos:=xpos
      trueypos:=ypos
    }
    FlashClick(xpos,ypos) ; Fleet
    Loop %Num%
      FlashClick(xpos+93,ypos-48) ; Turn
  }
}

LoadFleet(Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramNum:=Num
  ListLines On

  FlashClick(800,38*Num+145) ; Load
  FlashClick(847,38*Num+138) ; Load
}

SaveFleet(Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramNum:=Num
  ListLines On

  FlashClick(806,38*Num+162) ; Save
}

FillStack(Offset,StartPos,EndPos,NumShips=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramOffset:=Offset
  paramStartPos:=StartPos
  paramEndPos:=EndPos
  paramNumShips:=NumShips
  ListLines On

  while(Offset>0){
    FlashClick(784,489,1.5) ; Right Arrow
    Offset--
    trueOffset:=Offset
  }
  while(Offset<0){
    FlashClick(303,489,1.5) ; Left Arrow
    Offset++
    trueOffset:=Offset
  }
  if(EndPos=7)
   xend=436
  else if(EndPos=4) or (EndPos=8)
   xend=510
  else if(EndPos=1) or (EndPos=5) or (EndPos=9)
   xend=584
  else if(EndPos=2) or (EndPos=6)
   xend=656
  else if(EndPos=3)
   xend=729
  if(EndPos=9)
   yend=239
  else if(EndPos=8) or (EndPos=6)
   yend=270
  else if(EndPos=7) or (EndPos=5) or (EndPos=3)
   yend=304
  else if(EndPos=4) or (EndPos=2)
   yend=340
  else if(EndPos=1)
   yend=373
  FlashClickDrag(74*StartPos+284,490,xend,yend)
  if(NumShips>0){
    FlashClick(493,301,.5) ; Enter Amount:
    if(!Broke){
      SendInput ^a%NumShips%
      Sleep DefaultClickDelay
    }
  }
  FlashClick(433,346) ; OK
}

PickCommander(Comm){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramComm:=Comm
  ListLines On

  if Comm is digit
  {
    while(Comm>6){
      FlashClick(686,117,1.5) ; Right Arrow
      Comm-=6
      trueComm:=Comm
    }
    FlashClick(60*Comm+283,115)
  }else{
    i=0
    k=0
    while(k=0) and (FlashImageSearch(Comm,310,80,675,145)=0){
      i++
      if(i>=10){
        Loop 10
          FlashClick(300,117) ; Left Arrow
        i=0
      }else{
        FlashClick(686,117) ; Right Arrow
        if(FlashImageSearch(Comm,310,80,675,145)=1)
          k=1
        else if(!Broke)
          Sleep DefaultClickDelay
      }
    }
    FlashClick(ximage+10,yimage+10) ; Commander
  }
}

SelectRestricted(Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("SelectRestricted")
  if(DebugMode=1)
    MsgBox SelectRestricted( Num=%Num% )
  paramNum:=Num
  ListLines On

  FlashClick(RestrictedLocationsX[Num],RestrictedLocationsY[Num]) ; Restricted #
}

SelectConstellation(Sign,Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("SelectConstellation")
  if(DebugMode=1)
    MsgBox SelectConstellation( Sign=%Sign%, Num=%Num% )
  paramSign:=Sign
  paramNum:=Num
  ListLines On

  FlashClick(562,91) ; Constellations
  FlashClick(ConstellationLocations%Sign%X[0],ConstellationLocations%Sign%Y[0]) ; Constellation Sign
  FlashClick(ConstellationLocations%Sign%X[Num+1],ConstellationLocations%Sign%Y[Num+1]) ; Constellation #
}

SelectInstance(Num){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("SelectInstance")
  if(DebugMode=1)
    MsgBox SelectInstance( Num=%Num% )
  paramNum:=Num
  ListLines On

  FlashClick(InstanceLocationsX[Num],InstanceLocationsY[Num]) ; Instance #
}

Refill(Fleets,Helium){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("Refill")
  if(DebugMode=1)
    MsgBox Refill( Fleets=%Fleets%, Helium=%Helium% )
  paramFleets:=Fleets
  paramHelium:=Helium
  ListLines On

  MenuButton(2,3) ; Fleet Supplies
  if(Helium=1)
    FlashClick(357,117) ; Supply All
  else{
    while(Fleets>0){
      ypos=198
      if(Fleets<10)
        LoopFleets:=Fleets
      else
        LoopFleets=10
      Loop %LoopFleets%{
        FlashClick(641,ypos) ; Fleet #
        if(!Broke){
          SendInput ^a%Helium%
          Sleep DefaultClickDelay
        }
        ypos+=29
      }
      if(Fleets>10)
        FlashClick(591,560) ; Right Arrow
      Fleets-=10
      trueFleets:=Fleets
    }
  }
  FlashClick(720,116) ; All Confirmed
  if(!Broke)
    RefillHelium=0
}

FindCommander(Commander){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramCommander:=Commander
  StartPage:=Page
  Direction=1
  k=1
  Loop{
    j=0
    while(j<3) and ((Page<MaxPages) or (Mod(NumFleets-1,9)+1>3*j)){
      i=0
      while(i<3) and ((Page<MaxPages) or (Mod(NumFleets-1,9)+1>3*j+2) or (Mod(NumFleets,3)>i)){
        if(FlashImageSearch(Commander,271+184*i,184+104*j,321+184*i,234+104*j,,0)=1){
          FlashClick(ximage+10,yimage+10,,,0)
          ListLines On
          return
        }
        i++
      }
      j++
    }
    if(k=1){
      k=0
      if(Direction=1) and (Page<MaxPages){
        FlashClick(605,555) ; Right Arrow
        Page++
      }else if(Direction=-1){
        if(Page>1){
          FlashClick(452,555) ; Left Arrow
          Page--
        }else{
          Direction=1
         if(MaxPages>1){
            FlashClick(605,555) ; Right Arrow
            StartPage:=MaxPages
            Page=2
          }
        }
      }else if(Page>=MaxPages){
        Direction=-1
        while(Page>=StartPage) and (Page>1){
          FlashClick(452,555) ; Left Arrow
          Page--
        }
      }
    }else{
      k=1
      if(!Broke)
        Sleep DefaultClickDelay
    }
  }
}

ClickAllCommanders(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  LastFunctionCalled("ClickAllCommanders")
  if(DebugMode=1)
    MsgBox ClickAllCommanders()
  ListLines On

  StartPage:=Page
  Direction=1
  Loop %MaxPages%{
    j=0
    while(j<3) and ((Page<MaxPages) or (Mod(NumFleets-1,9)+1>3*j)){
      i=0
      while(i<3) and ((Page<MaxPages) or (Mod(NumFleets-1,9)+1>3*j+2) or (Mod(NumFleets,3)>i)){
        if(FlashPixelGetColor(336+184*i,211+104*j)<0x500000) ; Blue Background
          FlashClick(336+184*i,211+104*j)
        i++
      }
      j++
    }
    if(A_Index<MaxPages){
      if(Page<MaxPages) and (Direction=1){
        FlashClick(605,555,2) ; Right Arrow
        Page++
      }else if(Page=MaxPages){
        Direction=-1
        while(Page>=StartPage){
          FlashClick(452,555,2) ; Left Arrow
          Page--
        }
      }else{
        FlashClick(452,555,2) ; Left Arrow
        Page--
      }        
    }
  }
}

MenuButton(Menu,Button,SleepMult=1.5){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return
  }
  paramMenu:=Menu
  paramButton:=Button
  ListLines On

  FlashClick(737+47*Menu,613) ; Menu
  iLag=0
  while(iLag<10){
    if((Menu=1) and (FlashImageSearch("BuildMenu",765,420,800,590)=1)) or ((Menu=2) and (FlashImageSearch("MilitaryMenu",810,420,845,590)=1)) or ((Menu=3) and (FlashImageSearch("SocialMenu",860,420,895,590)=1)) or ((Menu=4) and (FlashImageSearch("MyToolsMenu",910,420,945,590)=1)) or ((Menu=5) and (FlashImageSearch("MallLuckyDrawMenu",955,420,990,590)=1))
      iLag=15
    else{
      if(!Broke)
        FlashClick(737+47*Menu,613) ; Menu
      iLag++
    }
  }
  FlashClick(737+47*Menu,605-30*Button+8*(Menu=5),SleepMult) ; Button
}

LastFunctionCalled(FunctionName){
  global
  iFunc=25
  while(iFunc>1){
    jFunc:=iFunc-1
    LastFunction%iFunc%:=LastFunction%jFunc%
    iFunc--
  }
  LastFunction1:=FunctionName
}

ListToString(ListName){
  global
  DebugString:=%ListName%1
  DebugI=2
  while(%ListName%%DebugI%!=""){
    DebugString.=" " %ListName%%DebugI%
    DebugI++
  }
  return DebugString
}

ListToString3(ListName){
  global
  DebugString:=%ListName%1
  DebugI=2
  while(%ListName%%DebugI%!=""){
    DebugString.="   " %ListName%%DebugI%
    DebugI++
  }
  return DebugString
}

ListArrayToString(ListName1,ListName2,DebugIndex){
  global
  DebugString:=%ListName1%1%ListName2%[DebugIndex]
  DebugI=2
  while(%ListName1%%DebugI%%ListName2%[DebugIndex]!=""){
    DebugString.=" " %ListName1%%DebugI%%ListName2%[DebugIndex]
    DebugI++
  }
  return DebugString
}

ArrayToString(ArrayName){
  global
  DebugString:=%ArrayName%[1]
  DebugI=2
  while(%ArrayName%[DebugI]!=""){
    DebugString.=" " %ArrayName%[DebugI]
    DebugI++
  }
  return DebugString
}

min(a,b){
  return a<b?a:b
}

max(a,b){
  return a>b?a:b
}
