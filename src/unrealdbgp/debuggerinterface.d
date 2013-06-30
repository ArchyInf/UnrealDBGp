module unrealdbgp.debuggerinterface;

import core.runtime;
import core.sys.windows.windows;
import core.sys.windows.dll;

import unrealdbgp.system;
import unrealdbgp.debugger.session;
import unreal = unrealdbgp.debugger.unreal;

__gshared HINSTANCE g_hInst;
__gshared DebuggerSession session;
__gshared unreal.DebuggerState unrealState;

extern (Windows) BOOL DllMain(HINSTANCE hInstance, ULONG ulReason, LPVOID pvReserved) 
{
	switch (ulReason) 
	{
		case DLL_PROCESS_ATTACH:
			g_hInst = hInstance;
			dll_process_attach( hInstance, true );
			Info( "IF_SYS", "DllMain: DLL_PROCESS_ATTACH" );
			break;

		case DLL_PROCESS_DETACH: 
			Info( "IF_SYS", "DllMain: DLL_PROCESS_DETACH" );
			session = null;
			unrealState =  null;
			dll_process_detach( hInstance, true );
			g_hInst = null;
			break;

		case DLL_THREAD_ATTACH: 
			dll_thread_attach( true, true );
			Info( "IF_SYS", "DllMain: DLL_THREAD_ATTACH" );
			break;

		case DLL_THREAD_DETACH: 
			Info( "IF_SYS", "DllMain: DLL_THREAD_DETACH" );
			dll_thread_detach( true, true );
			break;

		default:
			break;
	}
	
	return true; 
}

extern(C) export
{ 
	void SetCallback( void* callbackFunc ) 
	{
		Info( "IF_UDK", "SetCallback" );
		unrealState = new unreal.DebuggerState();
		session = new DebuggerSession( unrealState );
		//unrealState.SetCallback( callbackFunc );
	}

	void ShowDllForm()
	{
		Info( "IF_UDK", "ShowDllForm" );
		//unrealState.ShowDllForm();
	}

	void BuildHierarchy()
	{
		Info( "IF_UDK", "BuildHierarchy" );
		//unrealState.BuildHierarchy();
	}

	void ClearHierarchy()
	{
		Info( "IF_UDK", "ClearHierarchy" );
		//unrealState.ClearHierarchy();
	}

	void AddClassToHierarchy( const char* className )
	{
		Info( "IF_UDK", "AddClassToHierarchy" );
		//unrealState.AddClassToHierarchy( className );
	}

	void ClearWatch( int watchType )
	{
		Info( "IF_UDK", "ClearWatch" );
		//unrealState.ClearWatch( watchType );
	}

	void ClearAWatch( int watchType )
	{
		Info( "IF_UDK", "ClearAWatch" );
		//unrealState.ClearAWatch( watchType );
	}

	int AddAWatch( int watchType, int parentIndex, const char* varName, const char* varValue )
	{
		Info( "IF_UDK", "AddAWatch" );
		return 1;
		//return unrealState.AddAWatch( watchType, parentIndex, varName, varValue );
	}

	void LockList( int watchList )
	{
		Info( "IF_UDK", "LockList" );
		//unrealState.LockList( watchList );
	}

	void UnlockList( int watchList )
	{
		Info( "IF_UDK", "UnlockList" );
		//unrealState.UnlockList( watchList );
	}

	void AddBreakpoint( const char* className, int lineNo )
	{
		Info( "IF_UDK", "AddBreakpoint" );
		//unrealState.AddBreakpoint( className, lineNo );
	}

	void RemoveBreakpoint( const char* className, int lineNo )
	{
		Info( "IF_UDK", "RemoveBreakpoint" );
		//unrealState.RemoveBreakpoint( className, lineNo );
	}

	void EditorLoadClass( const char* className )
	{
		Info( "IF_UDK", "EditorLoadClass" );
		//unrealState.EditorLoadClass( className );
	}

	void EditorGotoLine( int lineNo, int bHighlight )
	{
		Info( "IF_UDK", "EditorGotoLine" );
		//unrealState.EditorGotoLine( lineNo, bHighlight );
	}

	void AddLineToLog( const char* text )
	{
		Info( "IF_UDK", "AddLineToLog" );
		//unrealState.AddLineToLog( text );
	}

	void CallStackClear()
	{
		Info( "IF_UDK", "CallStackClear" );
		//unrealState.CallStackClear();
	}

	void CallStackAdd( const char* callStackEntry )
	{
		Info( "IF_UDK", "CallStackAdd" );
		//unrealState.CallStackAdd( callStackEntry );
	}

	void SetCurrentObjectName( const char* objectName )
	{
		Info( "IF_UDK", "SetCurrentObjectName" );
		//unrealState.SetCurrentObjectName( objectName );
	}

	void DebugWindowState( int stateCode )
	{
		Info( "IF_UDK", "DebugWindowState" );
		//unrealState.DebugWindowState( stateCode );
	}
}