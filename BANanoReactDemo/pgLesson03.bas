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
	'get the body of the page
	Dim app As ReactElement = BR.Initialize
	'add a menu
	app.AddBR
	app.AddReactElement(modReact.ExamplesMenu(BR))
	app.addhr
	
	
	'create a form
	Dim form As ReactElement = BR.form("").SetTarget("_blank").SetAction("https://google.com/search")
	'
	Dim div1 As ReactElement = BR.div("").AddChild("Enter input and click Search")
	'create button
	Dim inp As ReactElement = BR.input("").SetName("q").SetClassName("input").SetPlaceholder("Search...")
	'
	form.AddElements(Array(div1,inp))
	form.AddElement(Button(CreateMap("label":"Search")))
	form.AddElement(ErrorDisplay("There are no android bots here!"))
	'
	app.AddReactElement(form)
	app.Render("app")
End Sub

'creating a button sub
Sub Button(props As Map) As ReactElement
	Dim b As ReactElement = BR.button("").SetType("submit")
	b.AddChild(props.Get("label"))
	Return b
End Sub

Sub ErrorDisplay(msg As String) As ReactElement
	Dim d As ReactElement = BR.div("")
	d.SetStyle("color","red")
	d.SetStyle("backgroundColor","yellow")
	d.AddChild(msg)
	Return d
End Sub