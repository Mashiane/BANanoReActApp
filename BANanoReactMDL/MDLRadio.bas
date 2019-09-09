B4J=true
Group=Default Group
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
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLRadio
	ID = sid
	'
	Label = BR.label("").AddClasses(Array("mdl-radio", "mdl-js-radio", "mdl-js-ripple-effect"))
	Label.SetFor(ID)
	'
	Input = BR.input(sid).SetType("radio").AddClass("mdl-radio__button")
	'
	Span = BR.span("").AddClass("mdl-radio__label")
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLRadio
	Input.SetOnChange(module, methodName)
	Return Me
End Sub


'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Radio)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLRadio
	Input.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLRadio
	Input.SetProps(m)
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As MDLRadio
	Input.SetDefaultValue(dv)
	Return Me
End Sub


'set value
Sub SetValue(v As Object) As MDLRadio
	Input.SetValue(v)
	Return Me
End Sub

'set name
Sub SetName(nm As String) As MDLRadio
	Input.SetName(nm)
	Return Me
End Sub

'set checked
Sub SetChecked(b As Boolean) As MDLRadio
	Input.SetChecked(b)
	Return Me
End Sub

'set label
Sub SetLabel(l As String) As MDLRadio
	Span.SetLabel(l)
	Return Me
End Sub

'return radio
Sub Radio As ReactElement
	Label.AddElements(Array(Input,Span))
	Return Label
End Sub