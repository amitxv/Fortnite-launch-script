# Fortnite-launch-script 

https://twitter.com/amitxv

Discord: AMIT#7692

If you play Fortnite you may be familiar with the two anticheats used which are EasyAntiCheat and Battle Eye.

For many people, launching with the different anticheats can result in better mouse input and online hit-reg. This may or may not be caused directly by the anticheat thus i will continue to only refer to launching Fortnite this way as "launching with EAC or BATTLEYE". 

In my personal experience, EasyAntiCheat has felt significantly better ingame in terms of hit-reg in comparison to battleye.

To launch with the anticheats you would have to find the system date on windows in which your desired anticheat would launch, this process is time consuming and may take ages to find the date to launch with your desired anticheat. I have written a script to automatically: 

1) launch Fortnite 
2) query the anticheat 
3) if it is not running, -1 day to the system date and relaunch
4) query the anticheat until it is running
5) once it is running, create a script to launch Fortnite with the date and time in which the anticheat launched in the C:\ directory.

NOTES: 

> You must always use this script in the C:\ dir to launch the game.

> You may also discover that your chosen anticheat date will be invalid after a game update etc.. Simply run the EAC_DATE_FINDER.bat script to find a new date and create a new launch script in the C:\ dir.

--------------------------------------------- INSTRUCTIONS ---------------------------------------------

1) right click the EAC_DATE_FINDER.bat or BE_DATE_FINDER (depending on what anticheat you plan to force) > edit

2) change the game exe path if you have installed Fortnite to somewhere other than the default directory e.g another drive etc... (don't forget to use quotes)

   ![image](https://user-images.githubusercontent.com/86924251/125170762-75ad9e80-e1a8-11eb-9f51-a26b2addf9ad.png)


3) run the script. your game will close and reopen multiple times, just be patient for it to find a date to launch with your chosen anticheat.

4) once the script has found a date to launch with your chosen anticheat, it will create a script in the C:\ dir which you must use to launch Fortnite each time you would like to play.
