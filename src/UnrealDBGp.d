module UnrealDBGp;

import std.c.windows.windows;
import core.sys.windows.dll;

__gshared HINSTANCE g_hInst;

extern (Windows) BOOL DllMain(HINSTANCE hInstance, ULONG ulReason, LPVOID pvReserved) 
{ 
	switch (ulReason) 
	{
		case DLL_PROCESS_ATTACH: 
			g_hInst = hInstance;
			dll_process_attach( hInstance, true );
			break;
		case DLL_PROCESS_DETACH: 
			dll_process_detach( hInstance, true );
			break;
		case DLL_THREAD_ATTACH: 
			dll_thread_attach( true, true );
			break;
		case DLL_THREAD_DETACH: 
			dll_thread_detach( true, true );
			break;
		default:
			break;
	} 
	return true;
}

extern(C)
{
	void SetCallback( void* CallbackFunc )
	{}

	void ShowDllForm()
	{}

	void BuildHierarchy()
	{}

	void ClearHierarchy()
	{}

	void AddClassToHierarchy( const char* ClassName )
	{}

	void ClearWatch( int WatchType )
	{}

	void ClearAWatch( int WatchType )
	{}

	int AddAWatch( int WatchType, int ParentINdex, const char* VarName, const char* VarValue )
	{
		return 0;
	}

	void LockList( int WatchList )
	{}

	void UnlockList( int WatchList )
	{}

	void AddBreakpoint( const char* ClassName, int LineNo )
	{}

	void RemoveBreakpoint( const char* ClassName, int LineNo )
	{}

	void EditorLoadClass( const char* ClassName )
	{}

	void EditorGotoLine( int LineNo, int bHighlight )
	{}

	void AddLineToLog( const char* Text )
	{}

	void CallStackClear()
	{}

	void CallStackAdd( const char* CallStackEntry )
	{}

	void SetCurrentObjectName( const char* ObjectName )
	{}

	void DebugWindowState( int StateCode )
	{}
}