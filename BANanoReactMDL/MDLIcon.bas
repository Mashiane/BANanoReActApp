B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private IconInt As ReactElement
End Sub

'initialize the icon
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLIcon
	IconInt = BR.i(sid).AddClass("material-icons").SetProp("role","presentation")
	Return Me
End Sub

'set the icon
Sub SetIcon(icn As String) As MDLIcon
	IconInt.SetLabel(icn)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Icon)
End Sub

'set the role
Sub SetRole(rl As String) As MDLIcon
	IconInt.SetRole(rl)
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLIcon
	IconInt.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLIcon
	IconInt.SetProps(m)
	Return Me
End Sub

'set the style of the image
Sub SetStyle(m As Map) As MDLIcon
	IconInt.SetStyles(m)
	Return Me
End Sub

'get the icon
Sub Icon As ReactElement
	Return IconInt
End Sub