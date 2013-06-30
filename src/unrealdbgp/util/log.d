module unrealdbgp.util.log;

import std.stdio;
import std.datetime;
import core.sync.mutex;

// todo: learn some more about correct synchronization in D
__gshared LogFile theFile;

static this()
{
	theFile = new LogFile(); 
}

static ~this()
{
	theFile = null;
}

void Info( string moduleName, string message )
{
	theFile.Info( moduleName, message );
}

class LogFile
{
	private File m_File;
	private Mutex m_Mutex;

	this()
	{
		m_Mutex = new Mutex();
		m_File.open( "DebuggerInterface.log", "w" );
	}

	~this()
	{
		m_File.detach();
	}

	void Info( string moduleName, string message )
	{
		// todo: this should be a safe way for multi threaded logging but there are much
		//  	 more elegant solutions in D; learn them
		synchronized( m_Mutex )
		{
			auto currentTime = Clock.currTime();
			auto timeString = TimeOfDay( currentTime.hour(), currentTime.minute(), currentTime.second() ).toISOExtString();
			m_File.writeln( timeString ~ ": " ~ moduleName ~ " - " ~ message );
			m_File.flush();
		}
	}
}
