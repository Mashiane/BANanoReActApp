B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private HeaderInt As ReactElement
	Private banreact As BANanoReact
	Public TabBar As MDLTabBar
	Public TopRow As MDLHeaderRow
	Public BottomRow As MDLHeaderRow
	Public HasContent As Boolean
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLHeader
	ID = sid
	banreact = BR
	HeaderInt = BR.header(sid)
	HeaderInt.AddClass("mdl-layout__header")
	'
	TabBar.Initialize(BR, $"${ID}-tabbar"$) 
	TopRow.Initialize(BR, $"${ID}-toprow"$)
	BottomRow.Initialize(BR, $"${ID}-bottomrow"$)  
	HasContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Header)
End Sub

'set waterfall
Sub SetWaterFall(b As Boolean) As MDLHeader
	HeaderInt.AddClass("mdl-layout__header--waterfall")
	HasContent = True
	Return Me
End Sub

'set no shadow
Sub SetNoShadow(b As Boolean) As MDLHeader
	HeaderInt.AddClass("mdl-layout__header--seamed")
	HasContent = True
	Return Me
End Sub

'set hidden
Sub SetHidden(b As Boolean) As MDLHeader
	HeaderInt.SetHidden(b)
	HasContent = True
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLHeader
	HeaderInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'add a tab to the header
Sub AddTab(linkID As String, linkLabel As String, tabContent As Object) As MDLHeader
	TabBar.AddTab(linkID, linkLabel, tabContent)
	HasContent = True
	Return Me
End Sub

'set style
Sub SetStyle(m As Map) As MDLHeader
	HeaderInt.SetStyles(m)
	HasContent = True
	Return Me
End Sub

'set transparent header
Sub SetTransparent(b As Boolean) As MDLHeader
	HeaderInt.AddClass("mdl-layout__header--transparent")
	HasContent = True
	Return Me
End Sub

'return the nav
Sub Header As ReactElement
	If TopRow.HasContent Then HeaderInt.AddElement(TopRow.HeaderRow)
	If BottomRow.HasContent Then HeaderInt.AddElement(BottomRow.HeaderRow)
	If TabBar.HasContent Then HeaderInt.AddElement(TabBar.TabBar)
	Return HeaderInt
End Sub
	
'set header scroll
Sub SetScroll(b As Boolean) As MDLHeader
	HeaderInt.AddClass("mdl-layout__header--scroll")
	HasContent = True
	Return Me
End Sub