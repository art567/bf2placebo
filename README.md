BatteField 2 Placebo
==============

A BattleField 2 Placebo Installer.

For example: it is needed in case of PR:BF2 installation.

Possible other mods is supported, but we don't care!

Download
---------------------
- Here: http://playbf2.ru/dl/placebo.exe

Features
---------------------
- Tiny installer, size is about ~10 MB.
- Minimal code base for vBF2 Core, size is about ~20 MB.
- Additional code to update PunkBuster and License key.
- Replaced BF2.exe with simple reminder/stub.

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