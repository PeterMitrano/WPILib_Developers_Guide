---
Gazebo Integration
---

As I may have explain earlier, FRCSim is simply a combination of Gazebo Plugins, a WPILib clone, and some custom messages. That is true, but it's a little bit simplistic. In the following tutorials, I will go in depth into the role Gazebo plays in FRCSim.

## How much of FRCSim is gazebo?
When you run a robot program in simulation, it builds your code (links with the corresponding WPILib clone). It then launches the simulator. **That** is Gazebo. The physics, the graphics, the tools (like `gz`, which is a really nice debugging tool)--It's all Gazebo. Currently, it is Gazebo 5.0, but when 6.0 is released in January we will update to Gazebo 6. Gazebo is one of the best robot simulators in the world. Many other's exist, but Gazebo is the most widely known. It was used for the DARPA Robotics CHallenege, and is used here at WPI in RBE 3001. The Gazebo Plugins, which are described more in depths in the [Gazebo Plugins Tutorial](https://petermitrano.github.io/WPILib_Developers_Guide/tutorials/FRCSim/Gazebo/gazebo_plugins.html), are what listen to and talk to the Driver Station and robot program.
