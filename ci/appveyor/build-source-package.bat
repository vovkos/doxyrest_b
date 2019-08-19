:: .............................................................................
::
::   This file is part of the Doxyrest toolkit.
::
::   Doxyrest is distributed under the MIT license.
::   For details see accompanying license.txt file,
::   the public copy of which is also available at:
::   http://tibbo.com/downloads/archive/doxyrest/license.txt
::
:: .............................................................................

@echo off

if not "%APPVEYOR_REPO_TAG%" == "true" goto :eof
if not "%CONFIGURATION%" == "Release" goto :eof
if not "%TOOLCHAIN%" == "msvc10" goto :eof

:: build package first

cpack --config CPackSourceConfig.cmake

:: then get package file name

echo include(CPackSourceConfig.cmake) >  print-package-file-name.cmake
echo message(${CPACK_PACKAGE_FILE_NAME}.tar.xz) >> print-package-file-name.cmake
cmake -P print-package-file-name.cmake > package_file_name 2>&1

set /P PACKAGE_FILE_NAME=<package_file_name
set DOXYREST_SOURCE_PACKAGE_FILE=build\%PACKAGE_FILE_NAME%
set BUILD_SOURCE_PACKAGE=ON
