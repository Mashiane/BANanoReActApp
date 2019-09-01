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
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSwitch
	ID = sid
	'
	Label = BR.label("").AddClasses(Array("mdl-switch", "mdl-js-switch", "mdl-js-ripple-effect"))
	Label.SetFor(ID)
	'
	Input = BR.input(sid).SetType("checkbox").AddClass("mdl-switch__input")
	'
	Span = BR.span("").AddClass("mdl-switch__label")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Switch)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLSwitch
	Input.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSwitch
	Input.SetProps(m)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLSwitch
	Input.SetValue(v)
	Return Me
End Sub

'set name
Sub SetName(nm As String) As MDLSwitch
	Input.SetName(nm)
	Return Me
End Sub

'set checked
Sub SetChecked(b As Boolean) As MDLSwitch
	Input.SetChecked(b)
	Return Me
End Sub

'set label
Sub SetLabel(l As String) As MDLSwitch
	Span.SetLabel(l)
	Return Me
End Sub

'return switch
Sub Switch As ReactElement
	Label.AddElements(Array(Input,Span))
	Return Label
End Sub