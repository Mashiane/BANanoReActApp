B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
#IgnoreWarnings: 12
Sub Process_Globals
	
End Sub

Sub ExamplesMenu(BR As BANanoReact) As ReactElement
	Dim exbox As ReactElement = BR.div("")
	exbox.SetBackgroundColor("lightgray")
	'
	Dim ex1 As ReactElement = BR.a("").SetLabel("Example 1").SetHREF("#").SetOnClick1(Me, "example1").SetPadding("10px")
	Dim ex2 As ReactElement = BR.a("").SetLabel("Example 2").SetHREF("#").SetOnClick1(Me, "example2").SetPadding("10px")
	Dim ex3 As ReactElement = BR.a("").SetLabel("Example 3").SetHREF("#").SetOnClick1(Me, "example3").SetPadding("10px")
	Dim ex4 As ReactElement = BR.a("").SetLabel("Example 4").SetHREF("#").SetOnClick1(Me, "example4").SetPadding("10px")
	
	exbox.AddReactElement(ex1)
	exbox.AddReactElement(ex2)
	exbox.AddReactElement(ex3)
	exbox.AddReactElement(ex4)
	
	Return exbox
End Sub

Sub example1
	pgIndex.show
End Sub

Sub example2
	pgLesson01.show
End Sub

Sub example3
	pgLesson03.show
End Sub

Sub example4
	pgLesson04.show
End Sub