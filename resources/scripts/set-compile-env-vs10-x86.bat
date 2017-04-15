@echo off
rem Copyright 2016, akashche at redhat.com
rem
rem Licensed under the Apache License, Version 2.0 (the "License");
rem you may not use this file except in compliance with the License.
rem You may obtain a copy of the License at
rem
rem http://www.apache.org/licenses/LICENSE-2.0
rem
rem Unless required by applicable law or agreed to in writing, software
rem distributed under the License is distributed on an "AS IS" BASIS,
rem WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
rem See the License for the specific language governing permissions and
rem limitations under the License.

rem shortcuts from script directory
set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%
set OJDKBUILD_DIR=%SCRIPT_DIR%/../..

rem tools dirs
set VS=%OJDKBUILD_DIR%/tools/toolchain/vs2010e
set WINSDK=%OJDKBUILD_DIR%/tools/toolchain/sdk71

rem set compiler environment manually
set WINDOWSSDKDIR=%WINSDK%
set VS100COMNTOOLS=%VS%/Common7/Tools
set Configuration=Release
set WindowsSDKVersionOverride=v7.1
set ToolsVersion=4.0
set TARGET_CPU=x86
set CURRENT_CPU=x86
set PlatformToolset=Windows7.1SDK
set TARGET_PLATFORM=XP
set LIB=%VS%/VC/Lib;%WINSDK%/Lib
set LIBPATH=%VS%/VC/Lib
set INCLUDE=%VS%/VC/INCLUDE;%WINSDK%/INCLUDE;%WINSDK%/INCLUDE/gl;

rem additional tools
set WINLD=%VS%/VC/Bin/link.exe
set MT=%WINSDK%/Bin/mt.exe
set RC=%WINSDK%/Bin/rc.exe
set WINAR=%VS%/VC/Bin/lib.exe
set DUMPBIN=%VS%/VC/Bin/dumpbin.exe

rem set path
set PATH=%VS%/Common7/IDE;%VS%/Common7/Tools;%VS%/VC/Bin;%VS%/VC/Bin;%VS%/VC/Bin/VCPackages
set PATH=%PATH%;%WINSDK%/Bin;C:/WINDOWS/System32;C:/WINDOWS;C:/WINDOWS/System32/wbem
set PATH=%PATH%;%OJDKBUILD_DIR%/tools/toolchain/msvcr100/i586
set PATH=%PATH%;%VS%/Common7/IDE
set PATH=%PATH%;%OJDKBUILD_DIR%/tools/cmake/bin
set PATH=%PATH%;%OJDKBUILD_DIR%/tools/pkgconfig/bin
set PATH=%PATH%;%OJDKBUILD_DIR%/tools/nasm
set PATH=%PATH%;%OJDKBUILD_DIR%/tools/perl/perl/bin
set PATH=%PATH%;%OJDKBUILD_DIR%/resources/scripts
