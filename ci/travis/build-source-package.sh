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

if  [ "$TRAVIS_TAG" != "" ] && \
	[ "$TRAVIS_OS_NAME" == "osx" ] && \
	[ "$BUILD_CONFIGURATION" == "Release" ]; then

	# build package first

	cpack --config CPackSourceConfig.cmake

	# then get package file name

	echo 'include(CPackSourceConfig.cmake)'    >  print-package-file-name.cmake
	echo 'message(${CPACK_PACKAGE_FILE_NAME})' >> print-package-file-name.cmake

	CPACK_PACKAGE_FILE_NAME=`cmake -P print-package-file-name.cmake 2>&1`

	rm print-package-file-name.cmake

	export DOXYREST_SOURCE_PACKAGE_FILE=$(pwd)/$CPACK_PACKAGE_FILE_NAME.tar.xz
	export BUILD_SOURCE_PACKAGE=ON

	echo DOXYREST_SOURCE_PACKAGE_FILE=$DOXYREST_SOURCE_PACKAGE_FILE
fi
