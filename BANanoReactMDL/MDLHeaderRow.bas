B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private HR As ReactElement
	Private Nav As MDLNav
	Private banreact As BANanoReact
	Public HasContent As Boolean
End Sub

'set hidden
Sub SetHidden(b As Boolean) As MDLHeaderRow
	HR.SetHidden(b)
	HasContent = False
	Return Me
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLHeaderRow
	ID = sid
	banreact = BR
	HR = BR.div(sid).AddClass("mdl-layout__header-row")
	Nav.Initialize(BR,$"${sid}-nav"$)
	Nav.IsDrawer = False
	HasContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(HeaderRow)
End Sub


'sub add a link for navigation
Sub AddLink(linkID As String, linkHref As String, linkIcon As String, linkLabel As String) As MDLHeaderRow
	Nav.AddLink(linkID, linkHref, linkIcon, linkLabel)
	HasContent = True
	Return Me
End Sub
	
'add a layout spacer
Sub SetSpacer(b As Boolean) As MDLHeaderRow
	Dim sp As ReactElement = banreact.div("")
	sp.AddClass("mdl-layout-spacer")
	HR.AddElement(sp)
	HasContent = True
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLHeaderRow
	HR.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'add a button icon
Sub SetButtonIcon(btnID As String, btnIcon As String) As MDLHeaderRow
	Dim btn As MDLButton
	btn.Initialize(banreact, btnID).SetButtonIcon(True).SetIcon(btnIcon)
	HR.AddElement(btn.Button)
	HasContent = True
	Return Me
End Sub

'add a menu button
Sub SetButtonMenu(btnID As String) As MDLHeaderRow
	SetButtonIcon(btnID, "more_vert")
	HasContent = True
	Return Me
End Sub

'add a menu
Sub SetMenu(menu As MDLMenu) As MDLHeaderRow
	HR.AddElement(menu.Menu)
	HasContent = True
	Return Me
End Sub

'add a search
Sub SetSearch(searchID As String) As MDLHeaderRow
	Dim navSearch As MDLSearch
	navSearch.Initialize(banreact, searchID).SetTextAlignRight(True)
	HR.AddElement(navSearch.Search)
	HasContent = True
	Return Me
End Sub

'set style
Sub SetStyle(m As Map) As MDLHeaderRow
	HR.SetStyles(m)
	HasContent = True
	Return Me
End Sub

'set the title of the page drawer
Sub SetTitle(t As Object) As MDLHeaderRow
	Dim tt As ReactElement = banreact.span($"${ID}-title"$)
	tt.SetLabel(t)
	tt.AddClass("mdl-layout-title")
	HR.AddElement(tt)
	HasContent = True
	Return Me
End Sub

'return the nav
Sub HeaderRow As ReactElement
	Return HR
End Sub

'add navigation
Sub SetNavigation(b As Boolean) As MDLHeaderRow
	If Nav.HasContent Then 
		HR.AddElement(Nav.Nav)
		HasContent = True
	End If
	Return Me
End Sub