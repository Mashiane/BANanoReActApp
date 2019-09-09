B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private ButtonInt As ReactElement
	Private banreact As BANanoReact
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLButton
	banreact = BR
	ButtonInt = BR.button(sid).AddClass("mdl-button").AddClass("mdl-js-button")
	SetRipple(True)
	Return Me
End Sub


'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLButton
	ButtonInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'set button as a menu button icon
Sub SetMenu(b As Boolean) As MDLButton
	SetButtonIcon(True)
	SetIcon("more_vert")
	Return Me
End Sub

'on click event
Sub SetOnClick(module As Object, methodName As String) As MDLButton
	ButtonInt.SetOnClick(module, methodName)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLButton
	ButtonInt.AddClass(cls)
	Return Me
End Sub

'set type
Sub SetType(t As Object) As MDLButton
	ButtonInt.SetType(t)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLButton
	ButtonInt.SetProps(m)
	Return Me
End Sub

'disable the button
Sub SetDisabled(b As Boolean) As MDLButton
	ButtonInt.SetDisabled(b)
	Return Me
End Sub

'make fab
Sub SetFab(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--fab")
	End If
	Return Me
End Sub

'make button icon
Sub SetButtonIcon(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--icon")
	End If
	Return Me
End Sub

'set mini fab
Sub SetMiniFab(b As Boolean) As MDLButton
	If b Then
		SetFab(True)
		ButtonInt.AddClass("mdl-button--mini-fab")
	End If
	Return Me
End Sub

'set primary
Sub SetPrimary(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--primary")
	End If
	Return Me
End Sub

'set coloures
Sub SetColored(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--colored")
	End If
	Return Me
End Sub

'set label
Sub SetLabel(lbl As String) As MDLButton
	ButtonInt.SetLabel(lbl)
	Return Me
End Sub

'set raised
Sub SetRaised(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--raised")
	End If
	Return Me
End Sub

'set the icon
Sub SetIcon(icon As String) As MDLButton
	Dim icn As MDLItem
	icn.Initialize(banreact, "i").SetMaterialIcons(icon) 
	ButtonInt.AddElement(icn.Item)
	Return Me
End Sub

'set ripple
Private Sub SetRipple(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-js-ripple-effect")
	End If
	Return Me
End Sub

'set accent
Sub SetAccent(b As Boolean) As MDLButton
	If b Then
		ButtonInt.AddClass("mdl-button--accent")
	End If
	Return Me
End Sub

'get the button
Sub Button As ReactElement
	Return ButtonInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Button)
End Sub
