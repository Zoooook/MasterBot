This bot requires a lot of preliminary setup. There is a learning curve. Please be patient and work through it, I've tried to make it relatively user-friendly. It is extremely customizable.

The newest version will always be at https://www.dropbox.com/s/2uonih8hu3med0g/MasterBot.zip

This bot can be considered abandonware. I may try to fix serious bugs, but I will not be adding new features. You are welcome to modify the source code. Let me know if you distribute it though. Notepad++ has syntax highlighting for AutoIt3, it's close enough to work for AutoHotkey. Sublime has decent highlighting, check http://www.autohotkey.com/board/topic/46447-sublime-text-editor-very-nice/?p=349495 and https://sublime.wbond.net/packages/Neon%20Color%20Scheme.

I can't keep up with every Chrome update or Facebook layout change. The bot relies heavily on image detection. If the bot breaks, it's likely that I just need to update an image. Take a screenshot of wherever the bot is broken at, run a debug report (see Hotkeys.txt), and send it to me. If you can figure out which image is the problem, you may be able to just replace it and the problem may go away.



What MasterBot can do:

MasterBot can run Restricteds, Trials, Constellations, Instances, and League.
    It can buy passports for Restricteds, and it can quick-run Restricteds for dailies if you can't beat it.
    You can customize fleet setups for all of these except League.
    It will tear down and rebuild fleets for each of these, so you can reuse ships for different things.
    If you have it run League for you, it will use whatever fleets are handy.
MasterBot can do daily quests on your main and your alts, and collect EZ-Rewards on your main. It can harvest all your warehouses.
MasterBot can burn vouchers on the wheel, on your main and your alts.
MasterBot can buy mall ships on your alts with their donation points.
MasterBot can be configured to do science research on your main and your alts. It's not very advanced though.
MasterBot can check your mail for you and collect items from your mail, on your main and your alts.
MasterBot can use the items in your bag, on your main and your alts.
MasterBot can reconnect to GO2 if it gets disconnected.
MasterBot can unlock Facebook accounts that have been locked for suspicious activity. (Maybe.)
MasterBot can turn off chat channels whenever it logs on. You can use chat while the bot is idling.
MasterBot will automatically reject all game friend requests while it is working.
MasterBot works on the American and European servers.


What MasterBot cannot do:

MasterBot will not truce you.
MasterBot will not run Instances on your alts.
MasterBot will not move gems and chips around on your commanders.
MasterBot will not do Humaroids, Space Raids, or any new features IGG has added recently.
MasterBot will not work on every server. It has only been tested on the American and European servers.



How to use MasterBot:

You must be using Windows. I tested it on Windows XP, it should work on newer versions of Windows, but it could be vulnerable to Windows interfering with it, for example, Windows 8 likes to do automatic updates. You should turn these off.

You must be using Google Chrome. It will not work in Firefox or Internet Explorer.

Download http://l.autohotkey.net/AutoHotkey_L_Install.exe and install it.
    The express installation should work fine, it should associate .ahk files with AutoHotkey.
    (If you search for this on your own, make sure you get the AutoHotkey_L branch and not just AutoHotkey standard, it needs this to interpret arrays that this script uses.)

Open a Chrome browser, the one that you'll be using for the bot.
    Go to Settings (from the menu in the upper right corner).
    Scroll down and click "Show advanced settings".
    Scroll down to Languages and UNcheck the box that says "Offer to translate pages that aren't in a language I read."
    (You don't want any toolbars popping up in a webpage, it will throw off the bot.)
    Scroll up to Privacy and click "Content settings."
    Under Cookies, check the box that says "Block third-party cookies and site data."
    Scroll down to Plug-ins and make sure that they are set to "Run automatically."
    Now log in to facebook, go to go2.igg.com and enter the game.
    At the right of the address bar there should be an icon of a cookie with a red X on it.
    Click it, and then click "Show cookies and other site data."
    It should show that 3 sites have set cookies, go2.igg.com, passport.igg.com, and us-chat.igg.com.
    Block all of them. This will let the bot log different accounts in the same browser.

If you have at least 8 alts, they can all wrench each other. However, if you have more than 8 alts, this could result in the last few not being able to give enough wrenches for dailies. The way to handle this is as follows. Write down your main and all your alts in a circle, like this: A B C D E F G H I J K L M A B C D E... Each account should be game friends with the 4 accounts to its left and the 4 accounts to its right, and no other alts. For example, K should be friends with G H I J and L M A B, but not C D E F. Now each alt is friends with 8 other alts, and everybody will get all their wrenches and dailies.

Run MasterBot.ahk. You should see a green box with an H in it pop up in your system tray at the bottom right of your screen. To close the script, right-click that box and click Exit.



Now read these files in order:

Hotkeys.txt
Settings.txt
Fleets.txt

Widen your text editor to at least 120 characters for optimal reading.
