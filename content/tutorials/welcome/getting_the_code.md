---
title: Getting & Using the Code
---

Getting & Using the Code
=================

##Downloading the source 

WPILib code is stored on our CollabNet account. In order to access the source code you need a few things.

 1. An account. Make one if you don't have one already
 2. Access to the repository. Go down to Brad's office (in Atwater Kent, behind the undergrad RBE Lab) or email him. Do'nt email me, I can't do that.
 3. Once you have access, you'll need to add your SSH keys. There's an awesome [Github Tutorial](https://www.github.com/generating-ssh-keys) on generating SSH keys. Go there, then go the your collabnet account and add them 
 4. got to the wpilib project, then hit 'Source'. On the right of the page there should be a line of code like 'git checkout aturing@collabnet.com/wpilib/31415926'. Copy that into your shell and it will checkout (like downloading, but for git) the code

Note: if you don't know git, you will soon. We're getting there in a sec.

<strong>PICTURES</strong>


##Working with the source

Ok, so now you have the code. Great. What do you do with it? Well you probably want to try building the code, so let's go over how to do this, and all the things that could go wrong.
Of course, when I say "all the things", I mearly mean a small subset of the things that could go wrong. I've never had a problem, but I do not deny their existance.

	# This builds everything except WPILibC++Sim and frc_gazebo_plugins
	# I will be fixing those two shortly.
	$> ./gradlew build eclipsePlugins

Side note. I want to explain what I'm telling you to do, so if I ever fail to do that and you're curious, email me and I'll elaborate. The special grey blocks are extra info. If you're in a hurry you can skip them, but i **HIGHLY** recommend you don't.


>
WPILibC++Sim and frc_gazebo_plugins are the two main projects associated with FRCSim. I am currently the main developer of that project along with [Logan Tutt](github.com/logantutt), who did the solidworks stuff.
That command does a few things. First, it runs the graldew script, which setups up gradle if you don't have it already. Second, it builds the code. The two things after gradlew are the targets you want it to build. If you just type graldew not much will happen (except for the first time, where it will install gralde). build tells it to do compile all the C++ code into libaries (.so files) and the Java code into jars (.jar files). The target eclipsePlugins builds and packages the eclipse plugins. More details on these later. Feel free to read the gradlew script to see how it works

So during this process, specifically during the eclipsePlugins part of it, you will probably get some errors. Ususally this is because you don't have some of the dependencies.
These dependencies include:
 1. maven
 2. the java 8 JDK
 3. the java 8 JDK for ARM

Try to see if the errors are related to one of those three. If it is, install that thing. Google it if you don't know how.

That's all I got on this right now, but this will be revisited soon (sooner if you bug me about it.)
