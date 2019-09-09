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
	Public PrimaryContent As MDLListItemPrimaryContent
	Public SecondaryContent As MDLListItemSecondaryContent
	Private Li As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLListItem
	ID = sid
	BanRe = BR
	Li = BanRe.li(sid).AddClass("mdl-list__item")
	PrimaryContent.Initialize(BR,$"${ID}-pc"$)
	SecondaryContent.Initialize(BR,$"${ID}-sc"$)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(ListItem)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLListItem
	Li.AddClass(clsList)
	Return Me
End Sub

'get the list item
Sub ListItem As ReactElement
	If PrimaryContent.TwoLines Then
		Li.AddClass("mdl-list__item--two-line")
	End If
	If PrimaryContent.ThreeLines Then
		Li.AddClass("mdl-list__item--three-line")
	End If
	Li.AddElement(PrimaryContent.PrimaryContent)
	Li.AddElement(SecondaryContent.SecondaryContent) 
	Return Li
End Sub
