module unrealdbgp.debuggerinterface;

import core.runtime;
import core.sys.windows.windows;
import core.sys.windows.dll;

import std.conv;

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
		Info( "UDK_IF", "SetCallback" );
		unrealState = new unreal.DebuggerState();
		session = new DebuggerSession( unrealState );
		unrealState.SetCallback( callbackFunc );
	}

	void ShowDllForm()
	{
		Info( "UDK_IF", "ShowDllForm" );
		unrealState.ShowDllForm();
	}

	void BuildHierarchy()
	{
		Info( "UDK_IF", "BuildHierarchy" );
		unrealState.BuildHierarchy();
	}

	void ClearHierarchy()
	{
		Info( "UDK_IF", "ClearHierarchy" );
		unrealState.ClearHierarchy();
	}

	void AddClassToHierarchy( const char* className )
	{
		Info( "UDK_IF", "AddClassToHierarchy" );
		unrealState.AddClassToHierarchy( to!string( className ) );
	}

	void ClearWatch( int watchType )
	{
		Info( "UDK_IF", "ClearWatch" );
		unrealState.ClearWatch( watchType );
	}

	void ClearAWatch( int watchType )
	{
		Info( "UDK_IF", "ClearAWatch" );
		unrealState.ClearAWatch( watchType );
	}

	int AddAWatch( int watchType, int parentIndex, const char* varName, const char* varValue )
	{
		Info( "UDK_IF", "AddAWatch" );
		return unrealState.AddAWatch( watchType, parentIndex, to!string( varName ), to!string( varValue ) );
	}

	void LockList( int watchList )
	{
		Info( "UDK_IF", "LockList" );
		unrealState.LockList( watchList );
	}

	void UnlockList( int watchList )
	{
		Info( "UDK_IF", "UnlockList" );
		unrealState.UnlockList( watchList );
	}

	void AddBreakpoint( const char* className, int lineNo )
	{
		Info( "UDK_IF", "AddBreakpoint" );
		unrealState.AddBreakpoint( to!string( className ), lineNo );
	}

	void RemoveBreakpoint( const char* className, int lineNo )
	{
		Info( "UDK_IF", "RemoveBreakpoint" );
		unrealState.RemoveBreakpoint( to!string( className ), lineNo );
	}

	void EditorLoadClass( const char* className )
	{
		Info( "UDK_IF", "EditorLoadClass" );
		unrealState.EditorLoadClass( to!string( className ) );
	}

	void EditorGotoLine( int lineNo, int bHighlight )
	{
		Info( "UDK_IF", "EditorGotoLine" );
		unrealState.EditorGotoLine( lineNo, bHighlight );
	}

	void AddLineToLog( const char* text )
	{
		Info( "UDK_IF", "AddLineToLog" );
		unrealState.AddLineToLog( to!string( text ) );
	}

	void CallStackClear()
	{
		Info( "UDK_IF", "CallStackClear" );
		unrealState.CallStackClear();
	}

	void CallStackAdd( const char* callStackEntry )
	{
		Info( "UDK_IF", "CallStackAdd" );
		unrealState.CallStackAdd( to!string( callStackEntry ) );
	}

	void SetCurrentObjectName( const char* objectName )
	{
		Info( "UDK_IF", "SetCurrentObjectName" );
		unrealState.SetCurrentObjectName( to!string( objectName ) );
	}

	void DebugWindowState( int stateCode )
	{
		Info( "UDK_IF", "DebugWindowState" );
		unrealState.DebugWindowState( stateCode );
	}
}