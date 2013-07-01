module unrealdbgp.debugger.session;

import unrealdbgp.debugger.unreal;
import unrealdbgp.debugger.watch;

class DebuggerSession
{
	private BreakState m_State = new BreakState();
	private UnrealCallback m_UnrealCallback;

	this( )
	{
	}

	void SetCallback( UnrealCallback callback )
	{
		m_UnrealCallback = callback;
	}

	void ClearGlobals()
	{
		m_State.ClearGlobals();
	}

	void ClearLocals()
	{
		m_State.ClearLocals();
	}

	void ClearUser()
	{
		m_State.ClearUser();
	}
}

class BreakState
{
	private WatchList m_Globals;
	private WatchList m_Locals;
	private WatchList m_User;

	this()
	{
		m_Globals = new WatchList();
		m_Locals = new WatchList();
		m_User = new WatchList();
	}

	void ClearGlobals()
	{
		m_Globals.Clear();
	}

	void ClearLocals()
	{
		m_Locals.Clear();
	}

	void ClearUser()
	{
		m_User.Clear();
	}
}