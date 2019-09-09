B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private ULInt As ReactElement
	Private BanRe As BANanoReact
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLMenu
	ID = sid
	BanRe = BR
	ULInt = BR.ul(ID).AddClass("mdl-menu mdl-js-menu mdl-js-ripple-effect")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Menu)
End Sub

'on click event
Sub SetOnClick(module As Object, methodName As String) As MDLMenu
	ULInt.SetOnClick(module, methodName)
	Return Me
End Sub


'set top right
Sub SetTopRight(b As Boolean) As MDLMenu
	ULInt.AddClass("mdl-menu--top-right")
	Return Me
End Sub

'set top left
Sub SetTopLeft(b As Boolean) As MDLMenu
	ULInt.AddClass("mdl-menu--top-left")
	Return Me
End Sub

'set bottom right
Sub SetBottomRight(b As Boolean) As MDLMenu
	ULInt.AddClass("mdl-menu--bottom-right")
	Return Me
End Sub

'set position
Sub SetBottomLeft(b As Boolean) As MDLMenu
	ULInt.AddClass("mdl-menu--bottom-left")
	Return Me
End Sub

'set button link
Sub SetFor(btnID As String) As MDLMenu
	ULInt.SetFor(btnID)
	Return Me
End Sub

'return menu
Sub Menu As ReactElement
	Return ULInt
End Sub

'add menu item
Sub AddMenuItem(itemID As String, itemLabel As String, itemDisabled As Boolean, itemHasDivider As Boolean) As MDLMenu
	Dim li As ReactElement = BanRe.li(itemID).AddClass("mdl-menu__item")
	li.AddClassOnCondition(itemHasDivider, "mdl-menu__item--full-bleed-divider")
	li.AddClassOnCondition(itemDisabled,"disabled").SetLabel(itemLabel)
	ULInt.AddElement(li)
	Return Me	
End Sub