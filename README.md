BatteField 2 Placebo
==============

A BattleField 2 Placebo Installer
It is needed in case of PR:BF2 installation.

Features
---------------------
- Install only core files for vBF2.
- Minimal code base is about ~9 MB at all.
- Replaced BF2.exe with reminder.

If you wish to modify the code, or add any additional features, please feel free to make a **fork** and submit a [pull request].


Setting up the project
---------------------

1. Be sure to have [Inno Setup 5.5 Inno Setup Compiler 5.4.3] installed. You might be able to compile it using previous versions of Inno Setup or using Inno Setup Compiler, but this is untested and may not work.

2. Open **Placebo.iss**, and build installer. Watch for log while building. Everything should be successfull.

3. Run **Placebo.exe** and it should start up with no errors. You can use debugger to debug setup process at the all setup stages.

4. If there's issues, unlucky, I'm sure you'll be able to figure them out :).
    
Stuff to do
---------------------
Of course, no project is ever really *complete*. I'm a crazy perfectionist, and unwilling to redraw, rewrite, remake everything. 
Please consider you did issue ticket open if you have catched bug or get in trouble.

- Always test, testing releases automatically in all windows VM's including Windows XP,Vista,7,8,10
- Comment the code line by line so you poor folk can understand all the black magic.

Credits
---------------------

[Artyom Shcherbakov aka Tema567] (http://art567.ru) for doing all this stuff.