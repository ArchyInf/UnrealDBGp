include_directories(
	${CMAKE_BINARY_DIR}
	${CMAKE_CURRENT_SOURCE_DIR}
)

#hack to add shared library interface definition; hopefully replaced soon
set( CMAKE_D_COMPILER_ARG1 
	${CMAKE_D_COMPILER_ARG1} ${CMAKE_CURRENT_SOURCE_DIR}/unrealdbgp/debuggerinterface.def)
 
ADD_LIBRARY (debuggerinterface SHARED 
				unrealdbgp/debuggerinterface.d
				unrealdbgp/system.d
				unrealdbgp/debugger/breakpoint.d
				unrealdbgp/debugger/protocol.d
				unrealdbgp/debugger/session.d
				unrealdbgp/debugger/unreal.d
				unrealdbgp/net/connection.d
				unrealdbgp/util/log.d
			)

install(TARGETS debuggerinterface DESTINATION "./Binaries/Win32")

# ADD_EXECUTABLE (test_exectuable 
# 				unrealdbgp/debuggerinterface.d
# 				unrealdbgp/system.d
# 				unrealdbgp/debugger/breakpoint.d
# 				unrealdbgp/debugger/protocol.d
# 				unrealdbgp/debugger/session.d
# 				unrealdbgp/debugger/unreal.d
# 				unrealdbgp/net/connection.d
# 				unrealdbgp/util/log.d
# 			)
