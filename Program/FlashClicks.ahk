FlashClick(x=-1,y=-1,SleepMult=1,Repeat=1,ListLinesOn=1,FriendAccept=1){
  global
  ListLines Off
  if(Broke){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  paramx:=x
  paramy:=y
  paramSleepMult:=SleepMult
  paramRepeat:=Repeat
  paramListLinesOn:=ListLinesOn
  Top=0
  while(Top=0){
    if(FlashOnTop(,FriendAccept)=0){
      if(ListLinesOn=1)
        ListLines On
      return
    }
    Top=1
    if(x<0) or (y<0){
      if(friendreq=1){
        MouseMove %xcurrent%, %ycurrent%
        Sleep DefaultClickDelay/2
      }
      Click %Repeat%
    }else{
      xflashclick:=xoffset+x
      yflashclick:=yoffset+y
      Click %xflashclick%, %yflashclick%, %Repeat%
    }
    TestID:=WinExist("A")
    if(TestID!=ChromeID){
      WinActivate ahk_id %ChromeID%
      WinMaximize ahk_id %ChromeID%
      Top=0
    }
    Sleep SleepMult*DefaultClickDelay
  }
  if(ListLinesOn=1)
    ListLines On
}

ScienceClick(x,y,SleepMult=1){
  ListLines Off
  if(FlashPixelGetColor(305,490)<0x800000)
    FlashClick(x,y,SleepMult)
}

FlashMouseMove(x,y,MoveSpeed=2,ListLinesOn=1){
  global
  ListLines Off
  if(Broke){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  paramx:=x
  paramy:=y
  paramMoveSpeed:=MoveSpeed
  paramListLinesOn:=ListLinesOn
  if(FlashOnTop()=0){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  MouseMove xoffset+x, yoffset+y, MoveSpeed
  if(ListLinesOn=1)
    ListLines On
}

FlashClickDrag(x1,y1,x2,y2,ListLinesOn=1){
  global
  ListLines Off
  if(Broke){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  paramx1:=x1
  paramy1:=y1
  paramx2:=x2
  paramy2:=y2
  paramListLinesOn:=ListLinesOn
  if(FlashOnTop()=0){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  MouseMove xoffset+x1, yoffset+y1
  Sleep DefaultClickDelay/2
  Click down
  Sleep DefaultClickDelay/2
  MouseMove xoffset+x2, yoffset+y2, 5
  Sleep DefaultClickDelay/2
  Click up
  Sleep DefaultClickDelay
  if(ListLinesOn=1)
    ListLines On
}

FlashImageSearch(ImageName,x1=0,y1=0,x2=1024,y2=600,Tolerance=32,ListLinesOn=1){
  global
  ListLines Off
  if(Broke){
    if(ListLinesOn=1)
      ListLines On
    return 0
  }
  paramImageName:=ImageName
  paramx1:=x1
  paramy1:=y1
  paramx2:=x2
  paramy2:=y2
  paramTolerance:=Tolerance
  paramListLinesOn:=ListLinesOn
  if(FlashOnTop()=0){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  if(ImageName=LastFlashImageName)
    SameFlashImageCalled++
  else{
    if(SameFlashImageCalled>MaxSameFlashImageCalled){
      MaxSameFlashImageCalled:=SameFlashImageCalled
      MaxSameFlashImageName:=ImageName
    }
    SameFlashImageCalled=0
    LastFlashImageName:=ImageName
  }
  if(SameFlashImageCalled>=100){
    Broke=1
    if(ListLinesOn=1)
      ListLines On
    return 0
  }
  ImageSearch ximage, yimage, xoffset+x1, yoffset+y1, xoffset+x2, yoffset+y2, *%Tolerance% Images\%ImageName%.bmp
  checkFlashImageSearch=0
  if(ErrorLevel=0){
    ximage-=xoffset
    yimage-=yoffset
    checkFlashImageSearch=1
  }else if(ErrorLevel=2)
    MsgBox Error: Cannot find %ImageName%.bmp
  if(ListLinesOn=1)
    ListLines On
  return checkFlashImageSearch
}

FlashPixelGetColor(x,y,Red=0,ListLinesOn=1){
  global
  ListLines Off
  if(Broke){
    if(ListLinesOn=1)
      ListLines On
    return 0
  }
  paramx:=x
  paramy:=y
  paramRed:=Red
  paramListLinesOn:=ListLinesOn
  if(FlashOnTop()=0){
    if(ListLinesOn=1)
      ListLines On
    return
  }
  if(Red=1)
    PixelGetColor pixelcolor, xoffset+x, yoffset+y, RGB
  else
    PixelGetColor pixelcolor, xoffset+x, yoffset+y
  if(ListLinesOn=1)
    ListLines On
  return pixelcolor
}

FlashOnTop(Expected=1,FriendAccept=1){
  global
  paramExpected:=Expected
  paramFriendAccept:=FriendAccept
  paused=0
  TestID:=WinActive("Galaxy Online II - Google Chrome")
  if(Expected)
    ImageSearch xoffset, yoffset, xoffset-xdiff-3, yoffset-ydiff-3, xoffset-xdiff+26, yoffset-ydiff+10, *32 Images\Play.bmp
  else
    ImageSearch xoffset, yoffset, 0, 0, A_ScreenWidth, A_ScreenHeight, *32 Images\Play.bmp
  xidle=
  yidle=
  windowidle=
  while(TestID!=ChromeID) or (yoffset=""){
    paused=1
    lastxidle:=xidle
    lastyidle:=yidle
    lastwindowidle:=windowidle
    MouseGetPos xidle, yidle
    windowidle:=WinExist("A")
    FormatTime idlehour, , H
    FormatTime idleminute, , m
    FormatTime idlesecond, , s
    IdleTime:=(idlehour*60+idleminute)*60+idlesecond
    if(xidle!=lastxidle) or (yidle!=lastyidle) or (windowidle!=lastwindowidle)
      StartIdleTime:=IdleTime
    else if((IdleTime>StartIdleTime+IdleWait) or ((IdleTime<StartIdleTime) and (IdleTime+86400>StartIdleTime+IdleWait))) and (WinExist("ahk_id" ChromeID)){
      WinActivate ahk_id %ChromeID%
      WinMaximize ahk_id %ChromeID%
      Sleep DefaultClickDelay
      Click %Tab2X%, %Tab2Y% ; Tab 2
      Sleep DefaultClickDelay/2
      SendInput ^2 ; Tab 2
      IdleRestore=1
    }      
    Sleep DefaultClickDelay/2
    TestID:=WinActive("ahk_id" ChromeID)
    WinGetActiveTitle TestTitle
    if(TestID=ChromeID){
      ImageSearch xoffset, yoffset, 0, 0, A_ScreenWidth, A_ScreenHeight, *32 Images\Play.bmp
      if(IdleRestore=1) and (ErrorLevel=1){
        Broke=1
        EZStop()
        return 0
      }
    }
    IdleRestore=0
  }
  xoffset+=xdiff
  yoffset+=ydiff
  if(paused=1)
    Sleep DefaultClickDelay/2
  Broke:=Disconnected()
  if(Broke){
    EZStop()
    return 0
  }
  MouseGetPos xcurrent, ycurrent
  friendreq=0
  while(FriendRequest()=1) or ((FriendAccept=1) and (FriendAccepted()=1)) or (LevelUp()=1){
    friendreq=1
    if(checkFriendRequest=1){
      xfriend:=xoffset+621
      yfriend:=yoffset+247
    }else if(FriendAccept=1) and (checkFriendAccepted=1){
      xfriend:=xoffset+574
      yfriend:=yoffset+348
    }else if(ShareLevelUp=1){
      xfriend:=xoffset+532
      yfriend:=yoffset+421
    }else{
      xfriend:=xoffset+666
      yfriend:=yoffset+213
    }
    Click %xfriend%, %yfriend% ; X
    Sleep DefaultClickDelay
  }
  return 1
}

Disconnected(){
  global
  checkDisconnected=0
  PixelGetColor pixcheck, xoffset+63, yoffset+111 ; Black Background
  if(pixcheck!=0x010101)
    return 0
  PixelGetColor pixcheck, xoffset+560, yoffset+47 ; Black Background
  if(pixcheck!=0x040404)
    return 0
  PixelGetColor pixcheck, xoffset+654, yoffset+388 ; Blue Planet
  if(pixcheck!=0x6D2B0A)
    return 0
  PixelGetColor pixcheck, xoffset+77, yoffset+410 ; Blue Planet
  if(pixcheck!=0x6B2D0B)
    return 0
  checkDisconnected=1
  return 1
}

FriendRequest(){
  global
  checkFriendRequest=0
  PixelGetColor pixcheck, xoffset+395, yoffset+274 ; Blue Background
  if(pixcheck!=0x380D00)
    return 0
  PixelGetColor pixcheck, xoffset+395, yoffset+323 ; Blue Background
  if(pixcheck!=0x380D00)
    return 0
  PixelGetColor pixcheck, xoffset+630, yoffset+323 ; Blue Background
  if(pixcheck!=0x380D00)
    return 0
  PixelGetColor pixcheck, xoffset+388, yoffset+264 ; Light Blue Border
  if(pixcheck!=0x661F00)
    return 0
  PixelGetColor pixcheck, xoffset+512, yoffset+264 ; Light Blue Border
  if(pixcheck!=0x661F00)
    return 0
  PixelGetColor pixcheck, xoffset+629, yoffset+264 ; Light Blue Border
  if(pixcheck!=0x661F00)
    return 0
  checkFriendRequest=1
  return 1
}

FriendAccepted(){
  global
  checkFriendAccepted=0
  PixelGetColor pixcheck, xoffset+394, yoffset+322 ; Blue Background
  if(pixcheck!=0x380D00)
    return 0
  PixelGetColor pixcheck, xoffset+629, yoffset+322 ; Blue Background
  if(pixcheck!=0x380D00)
    return 0
  PixelGetColor pixcheck, xoffset+389, yoffset+244 ; Light Blue Border
  if(pixcheck!=0x661F00)
    return 0
  PixelGetColor pixcheck, xoffset+637, yoffset+254 ; Light Blue Border
  if(pixcheck!=0x661F00)
    return 0
  checkFriendAccepted=1
  return 1
}

LevelUp(){
  global
  ImageSearch xlevel, ylevel, xoffset+514, yoffset+336, xoffset+549, yoffset+371, *32 Images\LevelUp.bmp
  checkLevelUp:=1-ErrorLevel
  return checkLevelUp
}

ChromeClick(x=-1,y=-1,SleepMult=1,Repeat=1,ListLinesOn=1){
  global
  ListLines Off
  paramx:=x
  paramy:=y
  paramSleepTime:=SleepTime
  paramRepeat:=Repeat
  paramListLinesOn:=ListLinesOn
  Top=0
  while(Top=0){
    ChromeOnTop()
    Top=1
    if(x<0) or (y<0)
      Click %Repeat%
    else
      Click %x%, %y%, %Repeat%
    TestID:=WinExist("A")
    if(TestID!=ChromeID){
      WinActivate ahk_id %ChromeID%
      WinMaximize ahk_id %ChromeID%
      Top=0
    }
    Sleep SleepMult*DefaultClickDelay
  }
  if(ListLinesOn=1)
    ListLines On
}

ChromeImageSearch(ImageName,x1=0,y1=0,x2=-1,y2=-1,Tolerance=32,ListLinesOn=1){
  global
  ListLines Off
  paramImageName:=ImageName
  paramx1:=x1
  paramy1:=y1
  paramx2:=x2
  paramy2:=y2
  paramTolerance:=Tolerance
  paramListLinesOn:=ListLinesOn
  ChromeOnTop()
  if(x2=-1)
    x2:=A_ScreenWidth
  if(y2=-1)
    y2:=A_ScreenHeight
  if(ImageName=LastChromeImageName)
    SameChromeImageCalled++
  else{
    if(SameChromeImageCalled>MaxSameChromeImageCalled){
      MaxSameChromeImageCalled:=SameChromeImageCalled
      MaxSameChromeImageName:=ImageName
    }
    SameChromeImageCalled=0
    LastChromeImageName:=ImageName
  }
  ImageSearch ximage, yimage, x1, y1, x2, y2, *%Tolerance% Images\%ImageName%.bmp
  checkChromeImageSearch=1
  if(ErrorLevel)
    checkChromeImageSearch=0
  if(ErrorLevel=2)
    MsgBox Error: Cannot find %ImageName%.bmp
  if(ListLinesOn=1)
    ListLines On
  return checkChromeImageSearch
}

ChromeOnTop(){
  global
  paused=0
  TestID:=WinExist("A")
  xidle=
  yidle=
  windowidle=
  while(TestID!=ChromeID){
    paused=1
    lastxidle:=xidle
    lastyidle:=yidle
    lastwindowidle:=windowidle
    MouseGetPos xidle, yidle
    windowidle:=WinExist("A")
    FormatTime idlehour, , H
    FormatTime idleminute, , m
    FormatTime idlesecond, , s
    IdleTime:=(idlehour*60+idleminute)*60+idlesecond
    if(xidle!=lastxidle) or (yidle!=lastyidle) or (windowidle!=lastwindowidle)
      StartIdleTime:=IdleTime
    else if((IdleTime>StartIdleTime+IdleWait) or ((IdleTime<StartIdleTime) and (IdleTime+86400>StartIdleTime+IdleWait))) and (WinExist("ahk_id" ChromeID)){
      WinActivate ahk_id %ChromeID%
      WinMaximize ahk_id %ChromeID%
    }
    Sleep DefaultClickDelay
    TestID:=WinExist("A")
  }
  WinGet Maximized, MinMax, A
  if(Maximized!=1){
    WinMaximize, A
    Sleep DefaultClickDelay
  }
  if(paused=1)
    Sleep DefaultClickDelay/2
}