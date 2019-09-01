B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private Input As ReactElement
	Private P As ReactElement
End Sub


'initialize the checkbox
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSlider
	ID = sid
	'
	p = BR.p("")
	'
	Input = BR.input(sid).SetType("range").AddClass("mdl-slider").AddClass("mdl-js-slider")
	Input.SetTabIndex("0")
	'
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Slider)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLSlider
	Input.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSlider
	Input.SetProps(m)
	Return Me
End Sub

'set min
Sub SetMin(minvalue As Object) As MDLSlider
	Input.SetMin(minvalue)
	Return Me
End Sub

'set max
Sub SetMax(maxvalue As Object) As MDLSlider
	Input.SetMax(maxvalue)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLSlider
	Input.SetValue(v)
	Return Me
End Sub

'set step
Sub SetStep(s As Object) As MDLSlider
	Input.SetStep(s)
	Return Me
End Sub

'set width
Sub SetWidth(w As Object) As MDLSlider
	P.SetWidth(w)
	Return Me
End Sub

'return slider
Sub Slider As ReactElement
	p.AddElement(Input)
	Return p
End Sub
