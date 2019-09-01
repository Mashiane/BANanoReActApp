B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
'create a UOEColumn class
Sub Class_Globals
	Public Columns As Int
	Public OffsetSmall As Int
	Public OffsetMedium As Int
	Public OffsetLarge As Int
	Public SpanSmall As Int
	Public SpanMedium As Int
	Public SpanLarge As Int
	Public MarginTop As Int
	Public MarginBottom As Int
	Public MarginLeft As Int
	Public MarginRight As Int
	Public PaddingTop As Int
	Public PaddingBottom As Int
	Public PaddingLeft As Int
	Public PaddingRight As Int
	Public Theme As String
	Public Visibility As String
	Public ClassName As String
	Public Row As Int
	Public Col As Int
End Sub
'Initializes UOEColumn object
Sub Initialize
	Columns = 1
	OffsetSmall = 0
	OffsetMedium = 0
	OffsetLarge = 0
	SpanSmall = 12
	SpanMedium = 12
	SpanLarge = 12
	MarginTop = 0
	MarginBottom = 0
	MarginLeft = 0
	MarginRight = 0
	PaddingTop = 0
	PaddingBottom = 0
	PaddingRight = 0
	PaddingLeft = 0
	Theme = ""
	Visibility = ""
	ClassName = ""
	Row = 0
	Col = 0
End Sub
