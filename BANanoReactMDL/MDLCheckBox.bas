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
	Private Span As ReactElement
End Sub


'initialize the checkbox
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLCheckBox
	ID = sid
	'
	Label = BR.label("").AddClasses(Array("mdl-checkbox", "mdl-js-checkbox", "mdl-js-ripple-effect"))
	Label.SetFor(ID)
	'
	Input = BR.input(sid).SetType("checkbox").AddClass("mdl-checkbox__input")
	'
	Span = BR.span("").AddClass("mdl-checkbox__label")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(CheckBox)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLCheckBox
	Input.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLCheckBox
	Input.SetProps(m)
	Return Me
End Sub

Sub SetChecked(b As Boolean) As MDLCheckBox
	Input.SetChecked(b)
	Return Me
End Sub

Sub SetLabel(l As String) As MDLCheckBox
	Span.SetLabel(l)
	Return Me
End Sub

Sub CheckBox As ReactElement
	Label.AddElements(Array(Input,Span))
	Return Label
End Sub