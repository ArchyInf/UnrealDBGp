import sublime, sublime_plugin
import subprocess

import os
import sys
import psutil

class RunUdkCommand(sublime_plugin.WindowCommand):
	def run(self):
		exe_path = 'D:\dev\projects\ResidentRift\Binaries\Win32\UDK.com'
		subprocess.Popen([exe_path, "-autodebug"])

# requires working psutil available to sublime
class KillUdkCommand(sublime_plugin.WindowCommand):
	def run(self):
		for proc in psutil.process_iter():
			if proc.name == "UDK.exe":
				proc.kill()
