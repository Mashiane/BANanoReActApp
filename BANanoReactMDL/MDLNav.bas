B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private NavInt As ReactElement
	Private banreact As BANanoReact
	Public IsDrawer As Boolean
	Public HasContent As Boolean
	Private BANano As BANano  'ignore
End Sub

#if css
.mdl-navigation__link1 {
  display: -webkit-flex !important;
  display: -ms-flexbox !important;
  display: flex !important;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  color: rgba(255, 255, 255, 0.56);
  font-weight: 500;
}
#End If

'set hidden
Sub SetHidden(b As Boolean) As MDLNav
	NavInt.SetHidden(b)
	HasContent = True
	Return Me
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLNav
	ID = sid
	banreact = BR
	NavInt = BR.nav(sid).AddClass("mdl-navigation")
	IsDrawer = False
	HasContent = False
	Return Me
End Sub

'return the nav
Sub Nav As ReactElement
	If IsDrawer Then
		NavInt.SetStyles(CreateMap("-webkitFlexGrow": "1", "-msFlexPositive": "1", "flexGrow": "1", "zIndex": "-2"))
	End If
	Return NavInt	
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Nav)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLNav
	NavInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'sub add a link, label visibility
Sub AddLink1(linkID As String, linkHref As String, linkIcon As String, linkLabel As String, labelHidden As Boolean) As MDLNav
	Dim lnk As MDLAnchor
	lnk.Initialize(banreact, linkID)
	lnk.addclass("mdl-navigation__link")
	lnk.Addclassoncondition(IsDrawer,"mdl-navigation__link1")
	lnk.SetHref(linkHref)
	'do we have an icon
	If linkIcon <> "" Then
		Dim icn As MDLIcon
		icn.Initialize(banreact, $"${linkID}-icon"$).SetIcon(linkIcon)
		icn.SetRole("presentation")
		If IsDrawer Then
			icn.SetStyle(CreateMap("fontSize": "24px","marginRight": "32px"))
		End If
		lnk.AddElement(icn.Icon)
	End If
	Dim span As ReactElement = banreact.span($"${linkID}-label"$).SetLabel(linkLabel)
	span.AddClassOnCondition(labelHidden, "visuallyhidden")
	lnk.AddElement(span)
	NavInt.AddElement(lnk.Anchor)
	HasContent = True
	Return Me
End Sub

'sub add a link
Sub AddLink(linkID As String, linkHref As String, linkIcon As String, linkLabel As String) As MDLNav
	AddLink1(linkID, linkHref, linkIcon, linkLabel,False)
	Return Me
End Sub
	
'add a layout spacer
Sub AddSpacer(b As Boolean) As MDLNav
	Dim sp As ReactElement = banreact.div("")
	sp.AddClass("mdl-layout-spacer")
	NavInt.AddElement(sp)
	HasContent = True
	Return Me
End Sub

'set large screens only
Sub SetLargeScreensOnly(b As Boolean) As MDLNav
	NavInt.AddClass("mdl-layout--large-screen-only")
	Return Me
End Sub