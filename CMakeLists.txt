#...............................................................................
#
#  This file is part of the Doxyrest toolkit.
#
#  Doxyrest is distributed under the MIT license.
#  For details see accompanying license.txt file,
#  the public copy of which is also available at:
#  http://tibbo.com/downloads/archive/doxyrest/license.txt
#
#...............................................................................

project (doxyrest_b)

cmake_minimum_required (VERSION 2.8)

include (axl/cmake/axl_cmake.cmake NO_POLICY_SCOPE)

#. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

set (DOXYREST_B_ROOT_DIR     ${CMAKE_CURRENT_LIST_DIR})
set (DOXYREST_B_PACKAGE_DIR  ${CMAKE_CURRENT_BINARY_DIR}/package)

#. . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . .

add_subdirectory (axl)
include (axl/cmake/import_axl.cmake)

add_subdirectory (doxyrest)
include (doxyrest/version.cmake)

add_subdirectory (package)

#...............................................................................
