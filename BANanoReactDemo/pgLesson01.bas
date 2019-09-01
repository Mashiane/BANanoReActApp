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
	
	app.AddReactElement(BR.CreateElement("h1", CreateMap(), "Contacts"))
	'
	Dim ul As ReactElement = BR.ul("")
	'
	'create a list item
	Dim li1 As ReactElement = BR.li("")
	li1.AddReactElement(BR.CreateReactElement("a", CreateMap("href": "mailto:james@frontarm.com"), "James Nelson"))
	'
	Dim li2 As ReactElement = BR.li("")
	li2.AddReactElement(BR.CreateReactElement("a", CreateMap("href": "mailto:mbanga@gmail.com"), "Mashy"))
	'
	ul.AddReactElements(Array(li1, li2))
	'
	app.AddReactElement(ul)
		'
	app.Render("app")
End Sub