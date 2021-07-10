# Fortnite-launch-script

If you play Fortnite you may be familar with the two anticheats used which are EasyAntiCheat and Battle Eye.

For many people, launching with the different anticheats can result in better mouse input and online hit-reg. This may or may not be caused directly by the anticheat thus i will continue to only refer to launching Fortnite this way as "launching with EAC or BATTLEYE".

To launch with the anticheats you would have to find the system date on windows in which your desired anticheat would launch, this process is time consuming and may take ages to find the date to launch with your desired anticheat. I have written a script to automatically: 
1) launch Fortnite 
2) query the anticheat 
3) if it is not running, -1 day to the system date and relaunch
4) query the anticheat until it is running
5) once it is running, create a script to launch Fortnite with the date and time in which the anticheat launched in the C:\ directory.

NOTE: You must always use this script in the C:\ dir to launch the game.

You may also discover that your chosen anticheat date will be invalid after a game update etc.. Simply run the EAC DATE FINDER script to find a new date and create a new launch script in the C:\ dir.
