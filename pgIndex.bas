B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private BANano As BANano
	Private body As BANanoElement
	
	Public React As BANanoObject
	Public ReactDOM As BANanoObject
End Sub

Sub Show
	'initialize the react library
	React.Initialize("React")
	'initialize the react dom library
	ReactDOM.Initialize("ReactDOM")
	'
	'get the body of the page
	body = BANano.GetElement("#body")
	'clear the body
	body.Empty
	
	'create a parent container div on the body: recommended
	Dim rootm As BANanoHTML
	rootm.Initialize("div").SetID("react-root")
	
	'add the div to the body, get it and convert it to an object
	Dim root As BANanoObject = body.Append(rootm.HTML).Get("#react-root").ToObject
	'
	Dim welcomeOpt As Map = CreateMap()
	welcomeOpt.Put("style", CreateMap("color":"red"))
	Dim welcome As BANanoObject = React.RunMethod("createElement", Array("h1", welcomeOpt, "Welcome to the react world!"))
	
	'create a button, set its class properties
	Dim btnOpt As Map = CreateMap("className": "btn btn-large")
	'add a click event
	Dim e As BANanoEvent
	btnOpt.Put("onClick", BANano.CallBack(Me, "next_click", e))
	'create the element
	Dim btn As BANanoObject = React.RunMethod("createElement", Array("button", btnOpt, "Next"))
	
	'execute react to create the element
	Dim hw As BANanoObject = React.RunMethod("createElement", Array("div", CreateMap(), "Hello World!", btn, welcome))
	'render the element
	ReactDOM.RunMethod("render", Array(hw, root))
	
	'try another method
	'Dim eHTML As BANanoHTML
	'eHTML.Initialize("h1").SetID("example").SetText("Hey Mashy!")
	'add to the page
	'Dim example As BANanoObject = body.Append(eHTML.HTML).Get("#example").ToObject
	'
	'Dim h1 As BANanoObject = React.RunMethod("createFactory", Array("h1"))
	'h1.Initialize3(Array(CreateMap(), "Hey Anie!"))
	'Log(h1)
	
	'Dim h1ce As BANanoObject = React.RunMethod("createElement", Array(h1))
	'render the element
	'ReactDOM.RunMethod("render", Array(h1, example))
End Sub

Sub next_click(e As BANanoEvent)
	Log(e)
	BANano.Window.Alert("Next Click!")
End Sub