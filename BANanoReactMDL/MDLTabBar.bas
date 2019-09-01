B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private TabBarInt As ReactElement
	Private strActive As String
	Private BanReact As BANanoReact
	Public HasContent As Boolean
	Public Sections As List
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLTabBar
	ID = sid
	TabBarInt = BR.div(sid).AddClass("mdl-layout__tab-bar mdl-js-ripple-effect")
	strActive = ""
	BanReact = BR
	HasContent = False
	Sections.Initialize 
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(TabBar)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLTabBar
	TabBarInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'set active tab
Sub SetActive(tabID As String) As MDLTabBar
	strActive = tabID
	HasContent = True
	Return Me
End Sub

'return the nav
Sub TabBar As ReactElement
	Return TabBarInt
End Sub

'sub add a tab
Sub AddTab(linkID As String, linkLabel As String, tabContent As ReactElement)
	Dim lnk As MDLAnchor
	lnk.Initialize(BanReact, "").addclass("mdl-layout__tab")
	If strActive = linkID Then
		lnk.AddClass("is-active")
	End If
	lnk.SetHref($"#${linkID}"$).setlabel(linkLabel)
	TabBarInt.AddElement(lnk.Anchor)
	'
	'add section
	Dim sect As ReactElement = BanReact.section(linkID).AddClass("mdl-layout__tab-panel")
	If strActive = linkID Then
		sect.AddClass("is-active")
	End If
	'
	Dim tc As ReactElement = BanReact.div("").AddClass("page-content")
	If tabContent <> Null Then tc.AddElement(tabContent)
	'
	sect.AddElement(tc)
	'
	Sections.Add(sect)
	HasContent = True
End Sub