B4J=true
Group=Default Group
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
	Private TopRow As MDLHeaderRow
	Public BottomRow As MDLHeaderRow
	Public HasContent As Boolean
	Private hasSpeedDial As Boolean
	Private msd As MDLSpeedDial
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
	hasSpeedDial = False
	Return Me
End Sub

'add event to an existing event
Sub OnItemClick(module As Object, methodName As String)
	banreact.OnItemClick($"#${ID}-toprow-nav"$, module, methodName)
End Sub

'add event to an existing event
Sub OnItemClickBottom(module As Object, methodName As String)
	banreact.OnItemClick($"#${ID}-bottomrow-nav"$, module, methodName)
End Sub

Sub SetOnClick(module As Object, methodName As String)
	HeaderInt.SetOnClick(module, methodName)
End Sub

'show nav only on large screens
Sub SetNavLargeScreensOnly(b As Boolean) As MDLHeader
	TopRow.SetNavLargeScreensOnly(b)
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

'sub add a link for navigation
Sub AddLink(linkID As String, linkHref As String, linkIcon As String, linkLabel As String) As MDLHeader
	TopRow.AddLink(linkID, linkHref, linkIcon, linkLabel)
	HasContent = True
	Return Me
End Sub

'sub add a link, label visibility
Sub AddLink1(linkID As String, linkHref As String, linkIcon As String, linkLabel As String, labelHidden As Boolean) As MDLHeader
	TopRow.AddLink1(linkID, linkHref, linkIcon, linkLabel, labelHidden)
	HasContent = True
	Return Me
End Sub

'add a layout spacer
Sub SetSpacer(b As Boolean) As MDLHeader
	TopRow.SetSpacer(b)
	HasContent = True
	Return Me
End Sub

'add a button icon
Sub SetButtonIcon(btnID As String, btnIcon As String) As MDLHeader
	TopRow.SetButtonIcon(btnID, btnIcon)
	HasContent = True
	Return Me
End Sub

'add a menu button
Sub SetButtonMenu(btnID As String) As MDLHeader
	TopRow.SetButtonMenu(btnID)
	HasContent = True
	Return Me
End Sub

'add a menu
Sub SetMenu(menu As MDLMenu) As MDLHeader
	TopRow.SetMenu(menu)
	HasContent = True
	Return Me
End Sub

'add a search
Sub SetSearch(searchID As String) As MDLHeader
	TopRow.SetSearch(searchID)
	HasContent = True
	Return Me
End Sub

'set the title of the page drawer
Sub SetTitle(t As Object) As MDLHeader
	TopRow.SetTitle(t)
	HasContent = True
	Return Me
End Sub

'add navigation
Sub SetNavigation(b As Boolean) As MDLHeader
	TopRow.SetNavigation(b)
	HasContent = True
	Return Me
End Sub

'add a react element
Sub AddReactElement(el As ReactElement) As MDLHeader
	TopRow.AddReactElement(el)
	HasContent = True
	Return Me
End Sub

'add a speed dial
Sub AddSpeedDial(sd As MDLSpeedDial) As MDLHeader
	sd.SetHeaderRight(True)
	msd = sd
	hasSpeedDial = True
	Return Me
End Sub

'return the nav
Sub Header As ReactElement
	If TopRow.HasContent Then 
		HeaderInt.AddElement(TopRow.HeaderRow)
		HasContent = True
	End If
	If BottomRow.HasContent Then 
		HeaderInt.AddElement(BottomRow.HeaderRow)
		HasContent = True
	End If
	If hasSpeedDial Then
		HeaderInt.AddElement(msd.SpeedDial)
		HasContent = True
	End If
	If TabBar.HasContent Then 
		HeaderInt.AddElement(TabBar.TabBar)
		HasContent = True
	End If
	Return HeaderInt
End Sub
	
'set header scroll
Sub SetScroll(b As Boolean) As MDLHeader
	HeaderInt.AddClass("mdl-layout__header--scroll")
	HasContent = True
	Return Me
End Sub