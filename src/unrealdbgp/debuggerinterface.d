module unrealdbgp.debuggerinterface;

import unrealdbgp.system;
import unrealdbgp.debugger.session;
import unreal = unrealdbgp.debugger.unreal;

DebuggerSession session;
unreal.DebuggerState unrealState;

import core.runtime;
import core.sys.windows.windows;
import core.sys.windows.dll;

__gshared HINSTANCE g_hInst;

int mainX()
{
	Info( "Main" );
	return 0;
}

extern (Windows) BOOL DllMain(HINSTANCE hInstance, ULONG ulReason, LPVOID pvReserved) 
{
	switch (ulReason) 
	{
		case DLL_PROCESS_ATTACH:
			g_hInst = hInstance;
			dll_process_attach( hInstance, true );
			Info( "DllMain: DLL_PROCESS_ATTACH" );
			break;

		case DLL_PROCESS_DETACH: 
			Info( "DllMain: DLL_PROCESS_DETACH" );
			session = null;
			unrealState =  null;
			dll_process_detach( hInstance, true );
			g_hInst = null;
			break;

		case DLL_THREAD_ATTACH: 
			dll_thread_attach( true, true );
			Info( "DllMain: DLL_THREAD_ATTACH" );
			break;

		case DLL_THREAD_DETACH: 
			Info( "DllMain: DLL_THREAD_DETACH" );
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
		unrealState = new unreal.DebuggerState();
		session = new DebuggerSession( unrealState );
		unrealState.SetCallback( callbackFunc );
	}

	void ShowDllForm()
	{
		unrealState.ShowDllForm();
	}

	void BuildHierarchy()
	{
		unrealState.BuildHierarchy();
	}

	void ClearHierarchy()
	{
		unrealState.ClearHierarchy();
	}

	void AddClassToHierarchy( const char* className )
	{
		AddClassToHierarchy( className );
	}

	void ClearWatch( int watchType )
	{
		unrealState.ClearWatch( watchType );
	}

	void ClearAWatch( int watchType )
	{
		ClearAWatch( watchType );
	}

	int AddAWatch( int watchType, int parentIndex, const char* varName, const char* varValue )
	{
		return unrealState.AddAWatch( watchType, parentIndex, varName, varValue );
	}

	void LockList( int watchList )
	{
		unrealState.LockList( watchList );
	}

	void UnlockList( int watchList )
	{
		unrealState.UnlockList( watchList );
	}

	void AddBreakpoint( const char* className, int lineNo )
	{
		unrealState.AddBreakpoint( className, lineNo );
	}

	void RemoveBreakpoint( const char* className, int lineNo )
	{
		unrealState.RemoveBreakpoint( className, lineNo );
	}

	void EditorLoadClass( const char* className )
	{
		unrealState.EditorLoadClass( className );
	}

	void EditorGotoLine( int lineNo, int bHighlight )
	{
		unrealState.EditorGotoLine( lineNo, bHighlight );
	}

	void AddLineToLog( const char* text )
	{
		unrealState.AddLineToLog( text );
	}

	void CallStackClear()
	{
		unrealState.CallStackClear();
	}

	void CallStackAdd( const char* callStackEntry )
	{
		unrealState.CallStackAdd( callStackEntry );
	}

	void SetCurrentObjectName( const char* objectName )
	{
		unrealState.SetCurrentObjectName( objectName );
	}

	void DebugWindowState( int stateCode )
	{
		unrealState.DebugWindowState( stateCode );
	}
}