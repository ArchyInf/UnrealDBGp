module unrealdbgp.debugger.unreal;

import unrealdbgp.system;

enum LOG_UNREAL_IF = true;

class DebuggerState
{
	private void* m_UnrealCallback;

	void SetCallback( void* callbackFunc )
	{
		
		m_UnrealCallback = callbackFunc;
	}

	void ShowDllForm()
	{
		
	}

	void BuildHierarchy()
	{
		
	}

	void ClearHierarchy()
	{
		
	}

	void AddClassToHierarchy( string className )
	{
		
	}

	void ClearWatch( int watchType )
	{
		
	}

	void ClearAWatch( int watchType )
	{
		
	}

	int AddAWatch( int watchType, int parentINdex, string varName, string varValue )
	{
		
		return 0;
	}

	void LockList( int watchList )
	{
		
	}

	void UnlockList( int watchList )
	{
		
	}

	void AddBreakpoint( string className, int lineNo )
	{
		
	}

	void RemoveBreakpoint( string className, int lineNo )
	{
		
	}

	void EditorLoadClass( string className )
	{
		
	}

	void EditorGotoLine( int lineNo, int highlight )
	{
		
	}

	void AddLineToLog( string text )
	{
		Info( "UDK", text );
	}

	void CallStackClear()
	{
		
	}

	void CallStackAdd( string CallStackEntry )
	{
		
	}

	void SetCurrentObjectName( string objectName )
	{
		
	}

	void DebugWindowState( int stateCode )
	{
		
	}

	private void Log( string message )
	{
		static if( LOG_UNREAL_IF )
		{
			Info( "IF_UDK", message );
		}
	}
}