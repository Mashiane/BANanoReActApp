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
	Private BR As BANanoReact
End Sub

Sub Show
	'get the body of the page
	body = BANano.GetElement("#body")
	'clear the body
	body.Empty
	
	'create a parent container div on the body: recommended
	Dim rrhtml As BANanoHTML
	rrhtml.Initialize("div").SetID("react-root")
	'add the div to the body, get it and convert it to an object
	Dim rr As BANanoObject = body.Append(rrhtml.HTML).Get("#react-root").ToObject
	'
	'initialize banano react
	BR.Initialize
	'create a form
	Dim form As ReactElement = BR.form("").SetTarget("_blank").SetAction("https://google.com/search")
	'
	Dim div1 As ReactElement = BR.div("").AddChild("Enter input and click Search")
	'create button
	Dim inp As ReactElement = BR.input("").SetName("q").SetClassName("input").SetPlaceholder("Search...")
	'
	form.AddReactElements(Array(div1,inp))
	form.AddReactElement(Button(CreateMap("label":"Search")))
	form.AddReactElement(ErrorDisplay("There are no android bots here!"))
	
	BR.Render(form, rr)
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