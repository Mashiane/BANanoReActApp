B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private LayoutInt As ReactElement
	Public Header As MDLHeader
	Public Drawer As MDLDrawer
	Private Content As ReactElement
	Public Page As ReactElement
	Public Footer As MDLFooter
	Private BANano As BANano 'ignore
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLLayout
	ID = sid
	LayoutInt = BR.div(sid)
	LayoutInt.AddClass("mdl-layout mdl-js-layout")
	'
	Header.Initialize(BR, $"${ID}-header"$)
	Drawer.Initialize(BR, $"${ID}-drawer"$)
	'
	Content = BR.mainElement($"${ID}-main"$)
	Page = BR.div($"${ID}-page"$)
	'
	Content.AddClass("mdl-layout__content")
	Page.AddClass("page-content")
	'
	Footer.Initialize(BR, $"${ID}-footer"$)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Layout)
End Sub


'get selected nav drawe item that was clicked
Sub GetDrawerItemID(e As BANanoEvent) As String
	'get the target
	Dim aid As String = ""
	Dim target As BANanoElement = BANano.ToElement(e.OtherField("target"))
	Dim tagName As String = target.GetField("tagName").Result
	Select Case tagName
	Case "A"
		aid = target.GetField("id").result
	Case "I", "SPAN"
		Dim parentNode As BANanoElement = BANano.ToElement(target.GetField("parentNode"))
		aid = parentNode.GetField("id").result
	End Select
	Return aid
End Sub

'add on item click
Sub OnItemClick(cb As BANanoObject)
	Dim els() As BANanoElement = BANano.GetElements($"#${ID}-drawer-nav a"$)
	For Each el As BANanoElement In els
		el.AddEventListener("click", cb, False)
	Next
End Sub

'set fixed tabs'
Sub SetFixedTabs(b As Boolean) As MDLLayout
	LayoutInt.AddClass("mdl-layout--fixed-tabs")
	Return Me
End Sub

'set a fixed drawer
Sub SetFixedDrawer(b As Boolean) As MDLLayout
	LayoutInt.AddClass("mdl-layout--fixed-drawer")
	Return Me
End Sub

'set a fixed header
Sub SetFixedHeader(b As Boolean) As MDLLayout
	LayoutInt.AddClass("mdl-layout--fixed-header")
	Return Me
End Sub

'set cover image
Sub SetCoverImage(imgURL As String) As MDLLayout
	LayoutInt.SetBackgroundimage(imgURL)
	LayoutInt.SetBackgroundRepeat("no-repeat")
	LayoutInt.SetBackgroundSize("cover")
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLLayout
	LayoutInt.AddClass(cls)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLLayout
	LayoutInt.SetProps(m)
	Return Me
End Sub

'return the layout
Sub Layout As ReactElement
	If Header.HasContent Then LayoutInt.AddElement(Header.Header)
	If Drawer.HasContent Then LayoutInt.AddElement(Drawer.drawer)
	'add tab children
	If Header.TabBar.HasContent Then
		 For Each re As ReactElement In Header.TabBar.Sections
		 	Page.AddElement(re)
		Next
	End If
	Content.AddElement(Page)
	LayoutInt.AddElement(Content)
	If Footer.HasContent Then LayoutInt.AddElement(Footer.Footer) 
	Return LayoutInt
End Sub