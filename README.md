nfEngineDeps README file
===============

nfEngineDeps is a repository used to provide all required dependencies for nfEngine project. 

nfEngine is an open source 3D game engine. For more info about it, visit main project repository [here](http://www.github.com/nfprojects/nfengine).

Contents
--------

This document consists of following sections (in order of appearance in file):

- Building nfEngineDeps on Windows platform
- Building nfEngineDeps on Linux platform
- Documentation
- Issue tracking
- Workflow

Building nfEngineDeps on Windows platform
-----------------------------------------

Right now building nfEngineDeps on Windows is performed only by using Microsoft Visual Studio 2013 compiler. Additionally, AntTweakBar relies on Direct3D, so DirectX SDK must be installed on the system. 

To properly build nfEngineDeps with Visual Studio:

1. Download and install required tools
    * Microsoft Visual Studio 2013 (Express edition should be enough)
    * DirectX SDK (it should be provided within Windows SDK package installed together with Visual Studio IDE)
2. Open **Deps.sln** file
3. Right click on **Solution Deps** inside Solution Explorer
4. Choose **Batch Build** option
5. Click on **Select All**
6. Click on **Rebuild**

This will compile dependencies on all available platform/configuration combinations. Compilation process might take a while, however it should be a one-time process.

Building nfEngineDeps on Linux platform
-----------------------------------------

Bullet Physics engine requires OpenGL and GLUT to be built. On Fedora, it is easy to install it by using "sudo yum install freeglut-devel", which will download all required dependencies as well.

Documentation
-------------

If any references are needed for API from specific library included in nfEngineDeps, it should be found in its official website. nfEngineDeps is meant to keep code only, not documentations for used dependencies.

Issue tracking
--------------

nfEngineDeps is only a support repository for main nfEngine repo. Any issues related to nfEngineDeps should be reported on [main nfEngine GitHub Issue Tracker](https://github.com/nfprojects/nfengine/issues).

Workflow
--------

Usually nfEngineDeps is updated only to bump library version. This will be handled by owners of nfEngine Project.
