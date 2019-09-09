B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.78
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private BANano As BANano  'ignore
	Private BR As BANanoReact
End Sub


Sub Show
	Dim appDiv As ReactElement = BR.Initialize
	'add a menu
	appDiv.AddBR
	appDiv.AddReactElement(modReact.ExamplesMenu(BR))
	
	'
	appDiv.AddReactElement(ContactForm(CreateMap()))
	'
	appDiv.Render("app")
End Sub

'stateless function
Sub ContactForm(props As Map) As ReactElement
	Dim form As ReactElement = BR.form("").SetClassName("ContactForm")
	'
	Dim txtName As ReactElement = BR.input("").SetType("text").SetPlaceholder("Name (required)")
	txtName.setvalue(props.Get("name")).Pop(form)
	'
	Dim txtEmail As ReactElement = BR.input("").SetType("email").SetPlaceholder("Email")
	txtEmail.SetValue(props.Get("email")).Pop(form)
	'
	Dim txtdesc As ReactElement = BR.textarea("").SetPlaceholder("Description")
	txtdesc.SetValue(props.Get("description")).Pop(form)
	'
	Dim btn As ReactElement = BR.button("").SetType("submit").SetLabel("Add Contact")
	btn.Pop(form)
	'
	Return form
End Sub