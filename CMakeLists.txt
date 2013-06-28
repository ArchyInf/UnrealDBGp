cmake_minimum_required(VERSION 2.8.11.0)

set(CMAKE_MODULE_PATH
	${CMAKE_SOURCE_DIR}/cmake/Modules
)

# Using Phobos
# ( Be sure to set this _before_ PROJECT definition )
set(CMAKE_D_USE_PHOBOS False)

# check for DDoc usage
# include(UseDDoc)

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

PROJECT (UnrealDBGp D)
set(CMAKE_BUILD_TYPE "Debug")

set(APPLICATION_NAME ${PROJECT_NAME})
set(APPLICATION_VERSION "0.0.1")

ADD_SUBDIRECTORY (src)
