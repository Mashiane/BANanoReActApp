B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private ChipInt As ReactElement
	Private banreact As BANanoReact
	Private bDelete As Boolean
	Private sText As String
	Private bContact As String
	Private prefix As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String, isButton As Boolean) As MDLChip
	ID = sid
	banreact = BR
	If isButton Then
		ChipInt = BR.button(sid)
	Else
		ChipInt = BR.span(sid)
	End If
	ChipInt.AddClass("mdl-chip")
	bDelete = False
	bContact = False
	sText = ""
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Chip)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLChip
	ChipInt.AddClass(clsList)
	Return Me
End Sub

'set text
Sub SetLabel(mText As String) As MDLChip
	sText = mText
	Return Me
End Sub

'can deletable
Sub SetDeletable(b As Boolean) As MDLChip
	bDelete = b
	ChipInt.AddClass("mdl-chip--deletable")
	Return Me
End Sub

'set prefix label
Sub SetPrefix(cPrefix As String, theme As String) As MDLChip
	bContact = True
	ChipInt.AddClass("mdl-chip--contact")
	'
	prefix.Initialize(banreact, "span").AddClass("mdl-chip__contact").SetLabel(cPrefix)
	Dim cls As String = banreact.gettheme(theme)
	prefix.AddClass(cls)
	Return Me
End Sub

'set image for chip
Sub SetImage(img As String) As MDLChip
	bContact = True
	ChipInt.AddClass("mdl-chip--contact")
	'
	prefix.Initialize(banreact, "img").AddClass("mdl-chip__contact").SetSRC(img)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLChip
	ChipInt.SetProps(m)
	Return Me
End Sub

'get chip
Sub Chip As ReactElement
	'contact
	If bContact Then
		ChipInt.AddElement(prefix)
	End If
	'mdl-color--teal mdl-color-text--white">A</span>
	
	'text
	Dim txt As MDLItem
	txt.Initialize(banreact, "span").AddClass("mdl-chip__text").SetLabel(sText)
	ChipInt.AddElement(txt.Item)
	'add delete button
	If bDelete Then
		Dim btn As MDLItem
		btn.Initialize(banreact, "button")
		btn.SetID($"${ID}-delete"$)
		btn.SetType("button").AddClass("mdl-chip__action")
		btn.SetMaterialIcons("cancel")
		ChipInt.AddElement(btn.Item)
	End If
	Return ChipInt	 
End Sub
