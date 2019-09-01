B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private DDSInt As ReactElement
	Private BanReact As BANanoReact
	Private FLinks As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLMiniFooterSection
	ID = sid
	DDSInt = BR.div(ID)
	BanReact = BR
	FLinks = BR.ul("").AddClass("mdl-mini-footer__link-list")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(MiniFooterSection)
End Sub


'set position
Sub SetLeftSection(b As Boolean) As MDLMiniFooterSection
	DDSInt.AddClass("mdl-mini-footer__left-section")
	Return Me
End Sub


'set position
Sub SetBottomSection(b As Boolean) As MDLMiniFooterSection
	DDSInt.AddClass("mdl-mini-footer__bottom-section")
	Return Me
End Sub

'set position
Sub SetTopSection(b As Boolean) As MDLMiniFooterSection
	DDSInt.AddClass("mdl-mini-footer__top-section")
	Return Me
End Sub

'set position
Sub SetRightSection(b As Boolean) As MDLMiniFooterSection
	DDSInt.AddClass("mdl-mini-footer__right-section")
	Return Me
End Sub


'set position
Sub SetMiddleSection(b As Boolean) As MDLMiniFooterSection
	DDSInt.AddClass("mdl-mini-footer__middle-section")
	Return Me
End Sub

'set logo
Sub SetLogo(t As String) As MDLMiniFooterSection
	DDSInt.AddElement(BanReact.CreateElement("div",Null,t).AddClass("mdl-logo"))
	Return Me
End Sub

'add a link
Sub AddLink(sLabel As String, href As String, target As String) As MDLMiniFooterSection
	Dim li As ReactElement = BanReact.li("")
	Dim a As MDLAnchor
	a.Initialize(BanReact,"").SetHref(href).SetLabel(sLabel).SetTarget(target)
	li.AddElement(a.Anchor)
	FLinks.AddElement(li)
	Return Me
End Sub

'ge the footer
Sub MiniFooterSection As ReactElement
	DDSInt.AddElement(FLinks)
	Return DDSInt
End Sub