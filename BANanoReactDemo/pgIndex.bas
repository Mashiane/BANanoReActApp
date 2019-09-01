B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
#IgnoreWarnings:12
Sub Process_Globals
	Private BANano As BANano  'ignore
	Private BR As BANanoReact
End Sub

Sub Show
	'initialize the react library
	Dim app As ReactElement = BR.Initialize
	'add a menu
	app.AddBR
	app.AddReactElement(modReact.ExamplesMenu(BR))
	app.addhr
	'
	Dim h1 As ReactElement = BR.h1("").SetLabel("Welcome to the react world!")
	h1.SetStyle("color", "red")
	'
	
	
	'
	'create a button, set its class properties
	Dim btnOpt As Map = CreateMap()
	'add a click event
	Dim e As BANanoEvent
	btnOpt.Put("onClick", BANano.CallBack(Me, "next_click", e))
	btnOpt.Put("className", "btn btn-primary")
	btnOpt.Put("type", "button")
	'create the element
	Dim btn As ReactElement = BR.CreateElement("button", btnOpt, "Next")
	'
	app.AddReactElement(h1)
	app.AddBR
	
	app.AddReactElement(btn)
	'
	app.Render("app")
End Sub

Sub next_click(e As BANanoEvent)
	Log(e)
	BANano.Window.Alert("Next Click!")
End Sub