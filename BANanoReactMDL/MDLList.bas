B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private ListInt As ReactElement
	Private BanRe As BANanoReact
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, typeOf As String, sid As String) As MDLList
	ID = sid
	Select Case typeOf
	Case "ol"
		ListInt = BR.ol(sid)
	Case Else
		ListInt = BR.ul(sid).AddClass("mdl-list")
	End Select
	BanRe = BR
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(List)
End Sub


'set it as a simple list
Sub SetSimple(b As Boolean) As MDLList
	ListInt.RemoveClass(Array("mdl-list"))
	Return Me
End Sub

'set margin
Sub SetMargin(m As String) As MDLList
	ListInt.SetMargin(m)
	Return Me
End Sub

'set padding
Sub SetPadding(p As String) As MDLList
	ListInt.SetPadding(p)
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLList
	ListInt.AddClass(clsList)
	Return Me
End Sub

'add list item
Sub AddListItem(li As MDLListItem)
	ListInt.AddElement(li.ListItem)
End Sub


'add a react element
Sub AddElement(rel As ReactElement)
	ListInt.AddElement(rel)
End Sub

'set width
Sub SetWidth(w As Object) As MDLList
	ListInt.SetWidth(w)
	Return Me
End Sub

'return the list
Sub List As ReactElement
	Return ListInt
End Sub

''set list style circle
Sub SetListTypeCircle(b As Boolean) As MDLList
	ListInt.SetListTypeCircle(True)
	Return Me
End Sub

'set list style disk
Sub SetListTypeDisk(b As Boolean) As MDLList
	ListInt.SetlistTypeDisk(True)
	Return Me
End Sub

'set list style none
Sub SetListTypeNone(b As Boolean) As MDLList
	ListInt.SetlistTypeNone(True)
	Return Me
End Sub

'set list style squre
Sub SetListTypeSquare(b As Boolean) As MDLList
	ListInt.SetlistTypeSquare(True)
	Return Me
End Sub

'add checkbox
Sub AddCheckBox(chkBoxID As String, chkBoxLabel As String)
	Dim li As ReactElement = BanRe.li($"${chkBoxID}-li"$)
	Dim chk As MDLCheckBox
	chk.Initialize(BanRe,chkBoxID).SetLabel(chkBoxLabel)
	li.AddElement(chk.CheckBox)
	ListInt.AddElement(li)
End Sub