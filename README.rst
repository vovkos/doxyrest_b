.. .............................................................................
..
..  This file is part of the Doxyrest toolkit.
..
..  Doxyrest is distributed under the MIT license.
..  For details see accompanying license.txt file,
..  the public copy of which is also available at:
..  http://tibbo.com/downloads/archive/doxyrest/license.txt
..
.. .............................................................................

Doxyrest (bundle repo)
======================
.. image:: https://travis-ci.org/vovkos/doxyrest_b.svg?branch=master
	:target: https://travis-ci.org/vovkos/doxyrest_b
.. image:: https://ci.appveyor.com/api/projects/status/a4krufn6mmenenep?svg=true
	:target: https://ci.appveyor.com/project/vovkos/doxyrest-b

Abstract
--------

``doxyrest_b`` is a helper *bundle repository* for the **Doxyrest** project. It contains both `doxyrest <https://github.com/vovkos/doxyrest>`_ and `axl <https://github.com/vovkos/axl>`_ as *git submodules* and provides a straightforward build sequence:

.. code-block:: bash

	# clone bundle repo

	git clone https://github.com/vovkos/doxyrest_b
	cd doxyrest_b
	git submodule update --init

	# build

	mkdir build
	cd build
	cmake ..
	cmake --build .

``doxyrest_b`` is automatically updated each time a new commit to the ``master`` branch of `doxyrest <https://github.com/vovkos/doxyrest>`_ successfully passes build and test stages on both `Travis CI <https://travis-ci.org/vovkos/doxyrest>`_ and `AppVeyor CI <https://ci.appveyor.com/project/vovkos/doxyrest>`_.