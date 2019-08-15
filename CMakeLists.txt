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

project(doxyrest_b)

cmake_minimum_required(VERSION 3.3)

include(axl/cmake/axl_cmake.cmake NO_POLICY_SCOPE)

set(BUILD_AXL_TESTS OFF CACHE BOOL "AXL tests disabled" FORCE)
add_subdirectory(axl EXCLUDE_FROM_ALL)
include(axl/cmake/import_axl.cmake)

if(TARGET axl_glibc)
	# force build axl_glibc
	# we link to axl_glibc using CMAKE_STANDARD_LIBRARIES; as such,
	# axl_glibc is not a direct dependency and will be skipped otherwise

	add_custom_target(
		force_build_axl_glibc ALL
		DEPENDS axl_glibc
		)
endif()

set(BUILD_GRACO_TESTS OFF CACHE BOOL "Graco tests disabled" FORCE)
add_subdirectory(graco EXCLUDE_FROM_ALL)
include(graco/cmake/import_graco.cmake)

add_subdirectory(luadoxyxml)
set(LUADOXYXML_EXE ${CMAKE_CURRENT_BINARY_DIR}/luadoxyxml/bin/${CONFIGURATION}/luadoxyxml)

add_subdirectory(cmakedoxyxml)
set(CMAKEDOXYXML_EXE ${CMAKE_CURRENT_BINARY_DIR}/cmakedoxyxml/bin/${CONFIGURATION}/cmakedoxyxml)

add_subdirectory(doxyrest)

include(doxyrest/version.cmake)

#...............................................................................

set(CPACK_PACKAGE_VERSION_MAJOR ${DOXYREST_VERSION_MAJOR})
set(CPACK_PACKAGE_VERSION_MINOR ${DOXYREST_VERSION_MINOR})
set(CPACK_PACKAGE_VERSION_PATCH ${DOXYREST_VERSION_REVISION})

if(WIN32)
	set(CPACK_SOURCE_GENERATOR 7Z)
else()
	set(CPACK_SOURCE_GENERATOR TXZ)
endif()

set(CPACK_SOURCE_IGNORE_FILES "/[.];[.]user$;/build/;/ci/;/paths.cmake$")

set(CPACK_SOURCE_PACKAGE_FILE_NAME doxyrest-${DOXYREST_VERSION_FILE_SUFFIX}-src)

if(APPLE)
	set(CPACK_PACKAGE_FILE_NAME doxyrest-${DOXYREST_VERSION_FILE_SUFFIX}-mac)
else()
	string(TOLOWER ${CMAKE_SYSTEM_NAME} OS_NAME)
	set(CPACK_PACKAGE_FILE_NAME doxyrest-${DOXYREST_VERSION_FILE_SUFFIX}-${OS_NAME}-${TARGET_CPU})
endif()

include(CPack)

#...............................................................................
