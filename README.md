# Problem with Spatial.look_at and translation in same frame

## [Video](https://www.youtube.com/watch?v=wy1nhFdu7uc)

## Description

Commenting line 38 in Code/Game.gd fixes the issue of rotation seemingly 
being interpolated if the spatial node is translated in the same frame 
as look_at.

All code in the repo is public domain, just in case.
