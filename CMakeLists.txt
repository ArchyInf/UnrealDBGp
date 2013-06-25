cmake_minimum_required(VERSION 2.8.11.0)

set(CMAKE_MODULE_PATH
	${CMAKE_SOURCE_DIR}/cmake/Modules
)

# Using Phobos
# ( Be sure to set this _before_ PROJECT definition )
set(CMAKE_D_USE_PHOBOS False)

# check for DDoc usage
# include(UseDDoc)

PROJECT (UnrealDBGp D)

ADD_SUBDIRECTORY (src)
