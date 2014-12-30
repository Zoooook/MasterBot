BrowserLoaded(){
  global
  ListLines Off
  checkBrowserLoaded=0
  ChromeOnTop()
  checkBrowserLoaded=1
  PixelGetColor pixcheck, 222, 349 ; Yellow
  if(pixcheck!=0x0FC9FA)
    checkBrowserLoaded=0
  else{
    PixelGetColor pixcheck, 340, 346 ; White
    if(pixcheck!=0xDEEBED)
      checkBrowserLoaded=0
    else{
      PixelGetColor pixcheck, 521, 339 ; Blue
      if(pixcheck!=0xF68A3D)
        checkBrowserLoaded=0
      else{
        PixelGetColor pixcheck, 697, 336 ; Red
        if(pixcheck!=0x414DE1)
          checkBrowserLoaded=0
      }
    }
  }
  ListLines On
  return checkBrowserLoaded
}

FacebookLoggedOut(){
  global
  ListLines Off
  ChromeOnTop()
  checkFacebookLoggedOut=0
  if(WinActive("Welcome to Facebook")){
    Sleep 3*DefaultClickDelay
    if(WinActive("Welcome to Facebook"))
      checkFacebookLoggedOut=1
  }else if(WinActive("Selamat Datang di Facebook")){
    Sleep 3*DefaultClickDelay
    if(WinActive("Selamat Datang di Facebook"))
      checkFacebookLoggedOut=1
  }
  ListLines On
  return checkFacebookLoggedOut
}

Go2Dashboard(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  checkGo2DashBoard=1
  ImageSearch xoffset, yoffset, 0, 0, A_ScreenWidth, A_ScreenHeight, *32 Images\Play.bmp
  if(ErrorLevel)
    checkGo2DashBoard=0
  else{
    xoffset+=xdiff
    yoffset+=ydiff
    PixelGetColor pixcheck, xoffset+477, yoffset+19 ; Dashboard
    if(pixcheck!=0xFFF5CF)
      checkGo2DashBoard=0
    else{
      PixelGetColor pixcheck, xoffset+395, yoffset+92 ; Dark Blue Background
      if(pixcheck!=0x381001)
        checkGo2DashBoard=0
      else{
        PixelGetColor pixcheck, xoffset+753, yoffset+106 ; Light Blue Background
        if(pixcheck!=0x713400)
          checkGo2DashBoard=0
        else{
          PixelGetColor pixcheck, xoffset+440, yoffset+368 ; Green Yellow Background
          if(pixcheck!=0x305809)
            checkGo2DashBoard=0
        }
      }
    }
  }
  ListLines On
  return checkGo2DashBoard
}

LoginFail(){
  global
  ListLines Off
  ImageSearch xwheel, ywheel, 0, 0, A_ScreenWidth, A_ScreenHeight, *32 Images\LoginFail.bmp
  checkLoginFail:=1-ErrorLevel
  ListLines On
  return 1-ErrorLevel
}

ScrollFail(){
  global
  ListLines Off
  checkScrollFail=0
  ImageSearch xscroll, yscroll, 0, 0, A_ScreenWidth, A_ScreenHeight, *32 Images\Play.bmp
  if(yscroll=ydefault)
    checkScrollFail=1
  ListLines On
  return checkScrollFail
}

HDWheelLoaded(){
  global
  ListLines Off
  checkHDWheelLoaded:=1-ChromeImageSearch("Start")
  ListLines On
  return checkHDWheelLoaded
}

HDWheelLoadFail(){
  global
  ListLines Off
  ChromeOnTop()
  checkHDWheelLoadFail=1
  PixelGetColor pixcheck, 579, 74 ; Blue Header
  if(pixcheck!=0xB4846D)
    checkHDWheelLoadFail=0
  else{
    PixelGetColor pixcheck, 596, 138 ; White Background
    if(pixcheck!=0xFFFFFF)
      checkHDWheelLoadFail=0
  }
  ListLines On
  return checkHDWheelLoadFail
}

FreeSpinFail(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkFreeSpinFail=1
  PixelGetColor pixcheck, xoffset+517, yoffset+379 ; Blue Background
  if(pixcheck!=0x341100)
    checkFreeSpinFail=0
  else{
    PixelGetColor pixcheck, xoffset+477, yoffset+411 ; Mall Points
    if(pixcheck!=0x5EEFA6) and (pixcheck!=0x53D694)
      checkFreeSpinFail=0
    else{
      PixelGetColor pixcheck, xoffset+578, yoffset+410 ; Vouchers
      if(pixcheck!=0xA5E3F1) and (pixcheck!=0x92BDCD)
        checkFreeSpinFail=0
      else{
        PixelGetColor pixcheck, xoffset+515, yoffset+444 ; Blue Background
        if(pixcheck!=0x3D1200)
          checkFreeSpinFail=0
      }
    }
  }
  ListLines On
  return checkFreeSpinFail
}

FreeSpinDone(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkFreeSpinDone=1
  PixelGetColor pixcheck, xoffset+385, yoffset+225 ; Image Pixel
  if(pixcheck!=0xDCC39A) and (pixcheck!=0xEAD19E)
    checkFreeSpinDone=0
  else{
    PixelGetColor pixcheck, xoffset+406, yoffset+232 ; Image Pixel
    if(pixcheck!=0xA57B6C) and (pixcheck!=0xE3BA9B)
      checkFreeSpinDone=0
    else{
      PixelGetColor pixcheck, xoffset+421, yoffset+255 ; Image Pixel
      if(pixcheck!=0xAFABCC) and (pixcheck!=0xB7B5D2)
        checkFreeSpinDone=0
      else{
        PixelGetColor pixcheck, xoffset+595, yoffset+301 ; Blue Background
        if(pixcheck!=0x5D2E0A) and (pixcheck!=0x5D2D0A)
          checkFreeSpinDone=0
      }
    }
  }
  ListLines On
  return checkFreeSpinDone
}

InstanceDone(ListLinesOn=1){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 0
  }
  paramListLinesOn:=ListLinesOn
  checkInstanceDone=1
  PixelGetColor pixcheck, xoffset+756, yoffset+165 ; Light Blue Ship
  if(pixcheck!=0xFFF708)
    checkInstanceDone=0
  else{
    PixelGetColor pixcheck, xoffset+775, yoffset+144 ; Light Blue Circle
    if(pixcheck!=0xE56B05)
      checkInstanceDone=0
    else{
      PixelGetColor pixcheck, xoffset+749, yoffset+205 ; Light Blue Circle
      if(pixcheck!=0xD35905)
        checkInstanceDone=0
      else{
        PixelGetColor pixcheck, xoffset+723, yoffset+131 ; Light Blue Circle
        if(pixcheck!=0xD35905)
          checkInstanceDone=0
      }
    }
  }
  if(ListLinesOn=1)
    ListLines On
  return checkInstanceDone
}

InstanceMenu(ListLinesOn=1){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 0
  }
  paramListLinesOn:=ListLinesOn
  checkInstanceMenu=1
  PixelGetColor pixcheck, xoffset+435, yoffset+46 ; Grey Border
  if(pixcheck!=0x333333)
    checkInstanceMenu=0
  else{
    PixelGetColor pixcheck, xoffset+600, yoffset+46 ; Grey Border
    if(pixcheck!=0x333333)
      checkInstanceMenu=0
    else{
      PixelGetColor pixcheck, xoffset+796, yoffset+183 ; Blue Sidebar
      if(pixcheck!=0x300C01)
        checkInstanceMenu=0
      else{
        PixelGetColor pixcheck, xoffset+797, yoffset+447 ; Blue Sidebar
        if(pixcheck!=0x300C01)
          checkInstanceMenu=0
      }
    }
  }
  if(ListLinesOn=1)
    ListLines On
  return checkInstanceMenu
}

IsMail(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 0
  }
  checkIsMail=0
  jIsMail=1
  while(jIsMail<10){
    PixelGetColor pixcheck, xoffset+202, yoffset+207+29*jIsMail
    if(pixcheck=0x341202){ ; Check Box Background
      checkIsMail:=jIsMail
      jIsMail++
    }else
      jIsMail=10
  }
  ListLines On
  return checkIsMail
}

RecruitMax(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 0
  }
  checkRecruitMax=1
  PixelGetColor pixcheck, xoffset+525, yoffset+316 ; Dark Blue Background
  if(pixcheck!=0x380D00)
    checkRecruitMax=0
  else{
    PixelGetColor pixcheck, xoffset+759, yoffset+318 ; Dark Blue Background
    if(pixcheck!=0x380D00)
      checkRecruitMax=0
    else{
      PixelGetColor pixcheck, xoffset+760, yoffset+267 ; Dark Blue Background
      if(pixcheck!=0x380D00)
        checkRecruitMax=0
      else{
        PixelGetColor pixcheck, xoffset+518, yoffset+248 ; Light Blue Border
        if(pixcheck!=0x661F00)
          checkRecruitMax=0
        else{
          PixelGetColor pixcheck, xoffset+767, yoffset+257 ; Light Blue Border
          if(pixcheck!=0x661F00)
            checkRecruitMax=0
        }
      }
    }
  }
  ListLines On
  return checkRecruitMax
}

MultipleItems(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkMultipleItems=1
  PixelGetColor pixcheck, xoffset+381, yoffset+248 ; Blue Background
  if(pixcheck!=0x661F00)
    checkMultipleItems=0
  else{
    PixelGetColor pixcheck, xoffset+645, yoffset+258 ; Blue Background
    if(pixcheck!=0x661F00)
      checkMultipleItems=0
    else{
      PixelGetColor pixcheck, xoffset+632, yoffset+314 ; Dark Blue Background
      if(pixcheck!=0x561500)
        checkMultipleItems=0
    }
  }
  ListLines On
  return checkMultipleItems
}

ConfirmItems(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkConfirmItems=1
  PixelGetColor pixcheck, xoffset+501, yoffset+264 ; Grey Background
  if(pixcheck!=0x212120)
    checkConfirmItems=0
  else{
    PixelGetColor pixcheck, xoffset+664, yoffset+363 ; Grey Background
    if(pixcheck!=0x212120)
      checkConfirmItems=0
    else{
      PixelGetColor pixcheck, xoffset+511, yoffset+404 ; Dark Grey Background
      if(pixcheck!=0x191716)
        checkConfirmItems=0
      else{
        PixelGetColor pixcheck, xoffset+656, yoffset+386 ; Light Grey Background
        if(pixcheck!=0x2D2D2C)
          checkConfirmItems=0
      }
    }
  }
  ListLines On
  return checkConfirmItems
}

BagScreen(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkBagScreen=1
  PixelGetColor pixcheck, xoffset+524, yoffset+408 ; Light Grey Corner
  if(pixcheck!=0x727271)
    checkBagScreen=0
  else{
    PixelGetColor pixcheck, xoffset+274, yoffset+432 ; Light Grey Corner
    if(pixcheck!=0x727271)
      checkBagScreen=0
    else{
      PixelGetColor pixcheck, xoffset+360, yoffset+144 ; Light Blue Top
      if(pixcheck!=0xBC3E11)
        checkBagScreen=0
      else{
        PixelGetColor pixcheck, xoffset+663, yoffset+144 ; Light Blue Top
        if(pixcheck!=0xBC3E11)
          checkBagScreen=0
      }
    }
  }
  ListLines On
  return checkBagScreen
}

AllCharged(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkAllCharged=1
  PixelGetColor pixcheck, xoffset+255, yoffset+455 ; Blue Background
  if(pixcheck!=0x491802)
    checkAllCharged=0
  else{
    PixelGetColor pixcheck, xoffset+270, yoffset+455 ; Blue Background
    if(pixcheck!=0x491802)
      checkAllCharged=0
    else{
      PixelGetColor pixcheck, xoffset+255, yoffset+465 ; Blue Background
      if(pixcheck!=0x491802)
        checkAllCharged=0
      else{
        PixelGetColor pixcheck, xoffset+270, yoffset+465 ; Blue Background
        if(pixcheck!=0x491802)
          checkAllCharged=0
      }
    }
  }
  ListLines On
  return checkAllCharged
}

IncreaseFleet(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop()=0){
    ListLines On
    return 1
  }
  checkIncreaseFleet=1
  PixelGetColor pixcheck, xoffset+390, yoffset+250 ; Dark Blue Background
  if(pixcheck!=0x330F01)
    checkIncreaseFleet=0
  else{
    PixelGetColor pixcheck, xoffset+765, yoffset+250 ; Dark Blue Background
    if(pixcheck!=0x330F01)
      checkIncreaseFleet=0
    else{
      PixelGetColor pixcheck, xoffset+400, yoffset+500 ; Blue Background
      if(pixcheck!=0x6D2303)
        checkIncreaseFleet=0
      else{
        PixelGetColor pixcheck, xoffset+666, yoffset+500 ; Blue Background
        if(pixcheck!=0x6D2303)
          checkIncreaseFleet=0
      }
    }
  }
  ListLines On
  return checkIncreaseFleet
}

CollectQuestReward(){
  global
  ListLines Off
  if(Broke) or (FlashOnTop(,0)=0){
    ListLines On
    return 1
  }
  checkCollectQuestReward=1
  PixelGetColor pixcheck, xoffset+394, yoffset+321 ; Dark Blue Background
  if(pixcheck!=0x380D00)
    checkCollectQuestReward=0
  else{
    PixelGetColor pixcheck, xoffset+630, yoffset+321 ; Dark Blue Background
    if(pixcheck!=0x380D00)
      checkCollectQuestReward=0
    else{
      PixelGetColor pixcheck, xoffset+637, yoffset+264 ; Blue Background
      if(pixcheck!=0x661F00)
        checkCollectQuestReward=0
      else{
        PixelGetColor pixcheck, xoffset+637, yoffset+290 ; Blue Background
        if(pixcheck!=0x672000)
          checkCollectQuestReward=0
      }
    }
  }
  ListLines On
  return checkCollectQuestReward
}


RestrictedsDone(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  LastFunctionCalled("RestrictedsDone")
  if(DebugMode=1)
    MsgBox RestrictedsDone()
  ListLines On

  if(InstanceMenu()=0)
    GoInstance()
  FlashClick(364,90,1.5) ; Restricted
  checkRestrictedsDone:=1-FlashImageSearch("RestrictedsNotDone",230,530,340,550)
  return checkRestrictedsDone
}

TrialsDone(InTrials=0){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  LastFunctionCalled("TrialsDone")
  if(DebugMode=1)
    MsgBox TrialsDone( InTrials=%InTrials% )
  paramInTrials:=InTrials
  checkTrialsDone=1
  ListLines On

  if(InTrials=0){
    if(InstanceMenu()=0)
      GoInstance()
    FlashClick(461,91,2) ; Trial
  }
  k=1
  PixelGetColor pixcheck, xoffset+770, yoffset+226 ; Black Background
  if(pixcheck<0x200000)
    k=0
  PixelGetColor pixcheck, xoffset+770, yoffset+326 ; Black Background
  if(pixcheck<0x200000)
    k=0
  if(k=1)
    return 1
  checkTrialsDone:=FlashImageSearch("TrialsDone",385,290,400,305)
  return checkTrialsDone
}

LeagueDone(){
  global
  ListLines Off
  if(Broke){
    ListLines On
    return 0
  }
  LastFunctionCalled("LeagueDone")
  if(DebugMode=1)
    MsgBox LeagueDone()
  ListLines On

  if(InstanceMenu()=1)
    FlashClick(793,32) ; X
  if(LeagueCount>=3){
    checkLeagueDone=1
    return 1
  }else if(NumFleets=0) and (LeagueWeike=0){
    SwitchFormation(0,-1)
    LeagueWeike=1
  }else if(RefillHelium>0)
    Refill(NumFleets,RefillHelium)
  GoInstance(10)
  checkLeagueDone:=FlashImageSearch("LeagueDone",475,150,560,170)
  if(checkLeagueDone=1)
    FlashClick(792,47) ; X
  return checkLeagueDone
}