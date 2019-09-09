B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private BanRe As BANanoReact
	Public PrimaryContent As ReactElement
	Public TwoLines As Boolean
	Public ThreeLines As Boolean
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLListItemPrimaryContent
	ID = sid
	BanRe = BR
	PrimaryContent = BR.span(sid).AddClass("mdl-list__item-primary-content")
	TwoLines = False
	ThreeLines = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(PrimaryContent)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLListItemPrimaryContent
	PrimaryContent.AddClass(clsList)
	Return Me
End Sub

'set the icon
Sub SetIcon(iconName As String) As MDLListItemPrimaryContent
	Dim i As ReactElement = BanRe.i("").AddClass("material-icons mdl-list__item-icon").SetLabel(iconName)
	PrimaryContent.AddElement(i)
	Return Me
End Sub

'set the avatar
Sub SetAvatar(iconName As String) As MDLListItemPrimaryContent
	Dim i As ReactElement = BanRe.i("").AddClass("material-icons mdl-list__item-avatar").SetLabel(iconName)
	PrimaryContent.AddElement(i)
	Return Me
End Sub

'set the label
Sub SetLabel(lbl As String) As MDLListItemPrimaryContent
	PrimaryContent.AddElement(BanRe.CreateElement("span",Null,lbl))
	Return Me
End Sub

'set sub title
Sub SetSubTitle(lbl As String) As MDLListItemPrimaryContent
	TwoLines = True
	'add sub title
	PrimaryContent.AddElement(BanRe.CreateElement("span",Null,lbl).AddClass("mdl-list__item-sub-title"))
	Return Me
End Sub

'set text body
Sub SetTextBody(tb As String) As MDLListItemPrimaryContent
	ThreeLines = True
	'add sub title
	PrimaryContent.AddElement(BanRe.CreateElement("span",Null,tb).AddClass("mdl-list__item-text-body"))
	Return Me
End Sub