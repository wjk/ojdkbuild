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

@echo off

rem shortcuts from script directory
set BAD_SLASH_SCRIPT_DIR=%~dp0
set SCRIPT_DIR=%BAD_SLASH_SCRIPT_DIR:\=/%
set OJDKBUILD_DIR=%SCRIPT_DIR%

call "%OJDKBUILD_DIR%/resources/scripts/modules.bat"
if errorlevel 1 goto :failure

if not "%1" == "/clean" goto :mkdir
rmdir /s /q build
if exist build goto :failure

:mkdir
if exist build goto :cmake
mkdir build || goto :failure

:cmake
pushd build || goto :failure

cmake "%OJDKBUILD_DIR%/src/java-1.8.0-openjdk" -G "NMake Makefiles" || goto :failure
nmake zip VERBOSE=1 || goto :failure

popd || goto :failure
echo OJDKBUILD_FINISH_SUCCESS
goto :eof

:failure
echo OJDKBUILD_FAILURE
