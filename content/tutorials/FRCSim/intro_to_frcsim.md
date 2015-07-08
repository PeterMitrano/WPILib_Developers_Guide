---
title: An Introduction to FRCsim
---
#An Introduction to FRCSim


## What is it?

FRCSim is a subproject of wpilib that allows you to run wpilib code in the Gazebo robot simulator. It's comprised of an Eclipse plugin (temporary), a set of gazebo plugins, a set of gazebo models, and a java and a c++ clones of wpilib.

**Eclipse Plugins**

The eclipse plugins is used to deliver all of these to students.
>
The way eclipse plugins are used to deliver stuff is kinda dumb. I don't know of any w:way to have your code run "on install", so what we do is we check if the user hasn't already gotten it, and if they haven't we unzip or download whatever is needed. Because this is done based on plugin version number, when you're working on wpilib and installing locally (we'll get there) they do their thing every single time you make changes and re-load the plugins. It's not a long process, but one you should be aware of since it can happen without you noticing.

**Gazebo Plugins and Models**

The eclips simulation plugin, which lives in 'allwpilib/eclipse-plugins/edu.wpi.first.wpilib.plugins.simulation', is used to deliver the models and gazebo plugins. The plugins connect wpilib to gazebo. The models are just for you to play around with if you don't have your own.

**Simulation WPILib clones**

The simulation clones of wpilib live right next to normal wpilib. The C++ simulation wpilib is at `allwpilib/wpilibc/wpilibC++Sim` and the java one at `allwpilib/wpilibj/wpilib/wpilibJavaSim`. They are used instead of the normal wpilib when you run code in simulation. More detail on this later.



