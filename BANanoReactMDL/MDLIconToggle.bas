B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private Label As ReactElement
	Private Input As ReactElement
	Private Icon As ReactElement
End Sub


'initialize the checkbox
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLIconToggle
	ID = sid
	'
	Label = BR.label("").AddClasses(Array("mdl-icon-toggle", "mdl-js-icon-toggle", "mdl-js-ripple-effect"))
	Label.SetFor(ID)
	'
	Input = BR.input(sid).SetType("checkbox").AddClass("mdl-icon-toggle__input")
	'
	Icon = BR.i("").AddClasses(Array("mdl-icon-toggle__label","material-icons"))
	Icon.SetProp("role", "presentation")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(IconToggle)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLIconToggle
	Input.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLIconToggle
	Input.SetProps(m)
	Return Me
End Sub

Sub SetChecked(b As Boolean) As MDLIconToggle
	Input.SetChecked(b)
	Return Me
End Sub

Sub SetIcon(l As String) As MDLIconToggle
	Icon.SetLabel(l)
	Return Me
End Sub

Sub IconToggle As ReactElement
	Label.AddElements(Array(Input,Icon))
	Return Label
End Sub