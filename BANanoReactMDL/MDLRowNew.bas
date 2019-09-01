B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
'create a UOERow class
Sub Class_Globals
	Public Rows As Int
	Public MarginTop As Int
	Public MarginBottom As Int
	Public MarginLeft As Int
	Public MarginRight As Int
	Public PaddingTop As Int
	Public PaddingBottom As Int
	Public PaddingLeft As Int
	Public PaddingRight As Int
	Public Columns As List
	Public Visibility As String
	Public ThemeName As String
	Public ClassName As String
	Public Row As Int
End Sub
'Initializes UOERow object
Sub Initialize
	Columns.Initialize
	Columns.clear
	Rows = 1
	MarginTop = 0
	MarginBottom = 20
	MarginLeft = 0
	MarginRight = 0
	PaddingTop = 0
	PaddingBottom = 0
	PaddingLeft = 0
	PaddingRight = 0
	Visibility = ""
	ThemeName = ""
	ClassName = ""
	Row = 0
End Sub
