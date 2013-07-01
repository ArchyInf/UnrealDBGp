module unrealdbgp.debugger.unreal;

import std.string;

import unrealdbgp.system;
import unrealdbgp.debugger.session;
import unrealdbgp.util.log;

enum LOG_UNREAL_IF = true;

// test
import core.thread;
__gshared UnrealCallback TEST_TEST_TEST;

void TestCallback( )
{
	Thread thisThread = Thread.getThis();
	thisThread.sleep( dur!("seconds")( 1 ) );
	TEST_TEST_TEST.Go();
	thisThread.sleep( dur!("seconds")( 500 ) );
}

class UnrealInterface
{
	private DebuggerSession m_Session;
	private UnrealCallback m_UnrealCallback;
	private int m_TempWatchId = 1;
	Thread test;

	this( DebuggerSession session )
	{
		m_Session = session;
		m_UnrealCallback = new UnrealCallback();
		m_Session.SetCallback( m_UnrealCallback );

		TEST_TEST_TEST = m_UnrealCallback;
	}

	void SetCallback( void* callbackFunc )
	{	
		m_UnrealCallback.SetCallback( callbackFunc );
	}

	void ShowDllForm()
	{
		//m_UnrealCallback.Go();
		test = new Thread( &TestCallback );
		test.start();
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

	void ClearAWatch( int watchType )
	{
		switch( watchType )
		{
			case 0:
				m_Session.ClearGlobals();
				break;
			case 1:
				m_Session.ClearLocals();
				break;
			case 2:
				m_Session.ClearUser();
				break;
			default: break;
		}
	}

	int AddAWatch( int watchType, int parentIndex, string varName, string varValue )
	{
		return m_TempWatchId++;
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

class UnrealCallback
{
	alias extern(C) void function( const char* zString ) UnrealCallbackFn;
	UnrealCallbackFn m_UnrealCallback;

	this()
	{}

	bool IsAvailable( )
	{
		return m_UnrealCallback != null;
	}

	void SetCallback( void* callbackFunc )
	{
		m_UnrealCallback = cast( UnrealCallbackFn )( callbackFunc );
	}

	void AddBreakPoint( string className, int lineNumber )
	{}

	void RemoveBreakPoint( string className, int lineNumber )
	{}

	void AddWatch( string varName )
	{}

	void RemoveWatch( string varName )
	{}

	void ClearWatch()
	{}

	void ChangeStack( int stackId )
	{}

	void SetDataWatch( string watchText )
	{}

	void BreakOnNone( bool state )
	{
		DoCallback( "breakonnone " ~ state ? "1" : "0" );
	}

	void Break()
	{ 
		DoCallback( "break" );
	}

	void StopDebugging()
	{
		DoCallback( "stopdebugging" );
	}

	void Go()
	{
		DoCallback( "go" );
	}

	void StepInto()
	{
		DoCallback( "stepinto" );
	}

	void StepOver()
	{
		DoCallback( "stepover" );
	}

	void StepOutOf()
	{
		DoCallback( "stepoutof" );
	}

	private void DoCallback( string command )
	{
		if( !m_UnrealCallback )
		{
			LogError( "UDK_OUT", "Trying to run command '" ~ command ~ "'' but no callback function is registered." );
			return;
		}

		Info( "UDK_OUT", "Run command: " ~ command );
		const (char*) zString = toStringz( command );
		m_UnrealCallback( zString );
	}
}