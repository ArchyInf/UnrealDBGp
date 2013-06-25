include_directories(
	${CMAKE_BINARY_DIR}
	${CMAKE_SOURCE_DIR}/src
)

#hack to add shared library interface definition; hopefully replaced soon
set( CMAKE_D_COMPILER_ARG1 
	${CMAKE_D_COMPILER_ARG1} ${CMAKE_CURRENT_SOURCE_DIR}/debuggerinterface.def)

ADD_LIBRARY (debuggerinterface SHARED debuggerinterface.d system.d)
