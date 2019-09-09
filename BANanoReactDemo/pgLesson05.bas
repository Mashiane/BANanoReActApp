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
	'to hold the reference to the input box
	Private textInput As BANanoObject
	'the input box
	Private input As ReactElement
End Sub

Sub Show
	Dim appDiv As ReactElement = BR.Initialize
	'add a menu
	appDiv.AddBR
	appDiv.AddReactElement(modReact.ExamplesMenu(BR))
	App.addhr
	'
	appDiv.AddReactElement(App)
	
	appDiv.Render("app")
End Sub

Sub App As ReactElement
	'create a div for the app
	Dim appint As ReactElement = BR.div("")
	'create an input box
	input = BR.input("").SetType("text")
	'get its reference
	textInput = input.ref
	'set the initial state to blank
	input.state.Put("value", "")
	'
	appint.AddReactElement(BR.CreateElement("h1", Null, "React Ref - createRef"))
	appint.AddReactElement(BR.CreateElement("h3", Null, "Value: " & input.state.Get("value")))
	'
	Dim form As ReactElement = BR.form("").SetOnSubmit(Me, "submitForm")
	'
	form.AddReactElement(input)
	'
	form.AddReactElement(BR.CreateElement("button",Null, "Submit"))
	'
	form.Pop(appint)
	'
	Return appint
End Sub

Sub submitForm(e As BANanoEvent)
	'prevent default operation
	e.PreventDefault
	'get the value from the current reference
	Dim lastValue As String = BR.GetReferenceValue(textInput)
	Log(lastValue)
	Log(textInput)
	
	'update the state of the control
	'textInput.RunMethod("setState", CreateMap("value" : lastValue))
	input.SetStateRealTime(CreateMap("value": lastValue))
End Sub