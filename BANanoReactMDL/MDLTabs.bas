B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private TabsInt As ReactElement
	Private strActive As String
	Private BanReact As BANanoReact
	Private tabsdiv As ReactElement
	Private children As List
	Public HasContent As Boolean
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLTabs
	ID = sid
	TabsInt = BR.div(sid)
	TabsInt.AddClass("mdl-tabs mdl-js-tabs mdl-js-ripple-effect")
	tabsdiv = BR.div($"${ID}-bar"$).AddClass("mdl-tabs__tab-bar")
	strActive = ""
	BanReact = BR
	children.Initialize 
	HasContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Tabs)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLTabs
	TabsInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'set active tab
Sub SetActive(tabID As String) As MDLTabs
	strActive = tabID
	HasContent = True
	Return Me
End Sub

'return the tabs
Sub Tabs As ReactElement
	TabsInt.AddElement(tabsdiv)
	For Each el As ReactElement In children
		TabsInt.AddElement(el)
	Next
	Return TabsInt
End Sub

'sub add a tab
Sub AddTab(linkID As String, linkLabel As String, tabContent As List)
	Dim lnk As MDLAnchor
	lnk.Initialize(BanReact, $"${ID}-${linkID}"$)
	lnk.addclass("mdl-tabs__tab")
	If strActive = linkID Then
		lnk.AddClass("is-active")
	End If
	lnk.SetHref($"#${linkID}"$)
	lnk.setlabel(linkLabel)
	tabsdiv.AddElement(lnk.Anchor)
	'
	'add section
	Dim sect As ReactElement = BanReact.div(linkID)
	sect.AddClass("mdl-tabs__panel")
	If strActive = linkID Then
		sect.AddClass("is-active")
	End If
	'
	For Each el As ReactElement In tabContent
		sect.AddElement(el)
	Next
	children.Add(sect)
	HasContent = True
End Sub