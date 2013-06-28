module unrealdbgp.util.log;

import std.file;
import std.datetime;

void Info( string message )
{
	auto currentTime = Clock.currTime();
	auto timeString = TimeOfDay( currentTime.hour(), currentTime.minute(), currentTime.second() ).toISOExtString();
	append( "DebuggerInterface.log", timeString ~ ": " ~ message ~ "\r\n" );
}
