# Fortnite-launch-script 

https://twitter.com/amitxv

Discord: AMIT#7692

If you play Fortnite you may be familiar with the two anticheats used which are EasyAntiCheat and Battle Eye.

For many people, launching with the different anticheats can result in better mouse input and online hit-reg. This may or may not be caused directly by the anticheat thus i will continue to only refer to launching Fortnite this way as "launching with EAC or BATTLEYE". 

To launch with the anticheats you would have to find the system date on windows in which your desired anticheat would launch, this process is time consuming and may take ages to find the date to launch with your desired anticheat. I have written a script to automatically: 

1) launch Fortnite 
2) query the anticheat 
3) if it is not running, -1 day to the system date and relaunch
4) query the anticheat until it is running
5) once it is running, create a script to launch Fortnite with the date and time in which the anticheat launched in the C:\ directory.

NOTES: 

> You must use C:\Fortnite.bat to launch your game (obviously)

> You may also discover that your chosen anticheat date will be invalid after a game update etc.. Simply run FN_LAUNCH_SCRIPT.bat again to find a new date and create a new    C:\Fortnite.bat

--------------------------------------------- INSTRUCTIONS ---------------------------------------------

1) right click FN_LAUNCH_SCRIPT.bat > edit

2) change the game exe and EGL path if you have installed Fortnite or EGL to somewhere else other than the default directory e.g another drive etc... (don't forget to use quotes) 

   ![image](https://user-images.githubusercontent.com/86924251/129871634-120f2dad-322a-4807-9da6-5e6d98f276fa.png)

   if you have Fortnite and EGL installed in the default directories continue to step 3
   
3) run FN_LAUNCH_SCRIPT.bat your game will close and reopen multiple times, just be patient for it to find a date to launch with your chosen anticheat.

4) once the script has found a date you will be asked if you would like to launch Fortnite with a specified binary affinity. If you don't know how to calculate affinity in binary    see the end of this README.

6) a script in C:\Fortnite.bat will be created in which you must use to launch Fortnite each time you would like to play.


# AFFINITY IN BINARY

Binary consists of 1's and 0's

1 = Active/Enabled CPU
0 = Inactive/Disabled CPU

type how many cores you have somewhere in the following format.
each 1 represents a core or thread

4c4t = 1111

6c6t = 111111

8c8t = 11111111

4c8t = 11111111
6c12t = 111111111111
8c16t = 1111111111111111

hyperthreading on works as follows:

                                     CPU 0         CPU 1        CPU 2         CPU 3
                                (CORE THREAD) (CORE THREAD) (CORE THREAD) (CORE THREAD)

remember that it works in reverse, so for example: 
removing Fortnite from CPU 0 on a 6c6t processor would be 111110
removing Fortnite from CPU 0 on a 6c12t processor would be 111111111100

Type the binary affinity in the script when asked, it will automatically convert it to decimal and put it in your customized launch script

Enjoy.
