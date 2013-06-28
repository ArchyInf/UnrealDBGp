module unrealdbgp.debugger.session;

import unreal = unrealdbgp.debugger.unreal;

class DebuggerSession
{
	private unreal.DebuggerState m_UnrealState;

	this( unreal.DebuggerState unrealState )
	{
		m_UnrealState = unrealState;
	}
}