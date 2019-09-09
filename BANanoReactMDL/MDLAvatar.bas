B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private AvatarInt As ReactElement
	Private banreact As BANanoReact
	Private lbl As ReactElement
	Private inp As ReactElement
	Private fil As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLAvatar
	ID = sid.tolowercase
	banreact = BR
	AvatarInt = BR.div($"${ID}-div"$).AddClass("mdl-avatar mdl-js-avatar mdl-avatar--floating-label")
	inp = BR.input($"${ID}"$).SetType("text").AddClass("mdl-avatar__input")
	lbl = BR.label($"${ID}-label"$).SetFor($"${ID}-input"$).AddClass("mdl-avatar__label")
	fil = BR.input($"${ID}-file"$).SetType("file")
	Return Me
End Sub

'set value
Sub SetValue(v As String) As MDLAvatar
	inp.SetValue(v)
	Return Me
End Sub
'set name
Sub SetName(n As String) As MDLAvatar
	inp.SetName(n)
	fil.SetName(n)
	Return Me
End Sub

'set label
Sub SetLabel(l As String) As MDLAvatar
	lbl.SetLabel(l)
	Return Me
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLAvatar
	AvatarInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLAvatar
	AvatarInt.AddClass(cls)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLAvatar
	AvatarInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLAvatar
	AvatarInt.SetDisabled(b)
	Return Me
End Sub

'get the button
Sub Avatar As ReactElement
	'check name
	Dim sname As String = AvatarInt.GetProp("name")
	If sname = "" Then
		Log("Name should be provided!")
	End If
	AvatarInt.AddReactElement(inp)
	AvatarInt.AddReactElement(fil)
	AvatarInt.AddReactElement(lbl)
	Return AvatarInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Avatar)
End Sub
