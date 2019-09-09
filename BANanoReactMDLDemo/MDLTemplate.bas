B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private SpeedInt As ReactElement
	Private banreact As BANanoReact
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSpeedDial
	banreact = BR
	SpeedInt = BR.button(sid).AddClass("mdl-button").AddClass("mdl-js-button")
	Return Me
End Sub


'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLSpeedDial
	SpeedInt.AddClassOnCondition(b, cls)
	Return Me
End Sub


'on click event
Sub SetOnClick(cb As BANanoObject) As MDLSpeedDial
	SpeedInt.SetOnClick(cb)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLSpeedDial
	SpeedInt.AddClass(cls)
	Return Me
End Sub

'set type
Sub SetType(t As Object) As MDLSpeedDial
	SpeedInt.SetType(t)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSpeedDial
	SpeedInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLSpeedDial
	SpeedInt.SetDisabled(b)
	Return Me
End Sub


'get the button
Sub SpeedDial As ReactElement
	Return SpeedInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(SpeedDial)
End Sub
