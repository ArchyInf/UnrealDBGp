module unrealdbgp.debugger.unreal;

import unrealdbgp.system;

enum LOG_UNREAL_IF = true;

class DebuggerState
{
	private void* m_UnrealCallback;

	void SetCallback( void* callbackFunc )
	{
		Log( "SetCallback" );
		m_UnrealCallback = callbackFunc;
	}

	void ShowDllForm()
	{
		Log( "ShowDllForm" );
	}

	void BuildHierarchy()
	{
		Log( "BuildHierarchy" );
	}

	void ClearHierarchy()
	{
		Log( "ClearHierarchy" );
	}

	void AddClassToHierarchy( const char* className )
	{
		Log( "AddClassToHierarchy" );
	}

	void ClearWatch( int watchType )
	{
		Log( "ClearWatch" );
	}

	void ClearAWatch( int watchType )
	{
		Log( "ClearAWatch" );
	}

	int AddAWatch( int watchType, int parentINdex, const char* varName, const char* varValue )
	{
		Log( "AddAWatch" );
		return 0;
	}

	void LockList( int watchList )
	{
		Log( "LockList" );
	}

	void UnlockList( int watchList )
	{
		Log( "UnlockList" );
	}

	void AddBreakpoint( const char* className, int lineNo )
	{
		Log( "AddBreakpoint" );
	}

	void RemoveBreakpoint( const char* className, int lineNo )
	{
		Log( "RemoveBreakpoint" );
	}

	void EditorLoadClass( const char* className )
	{
		Log( "EditorLoadClass" );
	}

	void EditorGotoLine( int lineNo, int highlight )
	{
		Log( "EditorGotoLine" );
	}

	void AddLineToLog( const char* Text )
	{
		Log( "AddLineToLog" );
	}

	void CallStackClear()
	{
		Log( "CallStackClear" );
	}

	void CallStackAdd( const char* CallStackEntry )
	{
		Log( "CallStackAdd" );
	}

	void SetCurrentObjectName( const char* objectName )
	{
		Log( "SetCurrentObjectName" );
	}

	void DebugWindowState( int stateCode )
	{
		Log( "DebugWindowState" );
	}

	private void Log( string message )
	{
		static if( LOG_UNREAL_IF )
		{
			Info( message );
		}
	}
}