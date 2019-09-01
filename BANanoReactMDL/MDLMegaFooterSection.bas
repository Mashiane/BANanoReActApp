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
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLMegaFooterSection
	ID = sid
	DDSInt = BR.div(ID)
	BanReact = BR
	FLinks = BR.ul("").AddClass("mdl-mega-footer__link-list")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(MegaFooterSection)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLMegaFooterSection
	DDSInt.AddClass(clsList)
	Return Me
End Sub

'set position
Sub SetBottomSection(b As Boolean) As MDLMegaFooterSection
	DDSInt.AddClass("mdl-mega-footer__bottom-section")
	Return Me
End Sub

'set position
Sub SetTopSection(b As Boolean) As MDLMegaFooterSection
	DDSInt.AddClass("mdl-mega-footer__top-section")
	Return Me
End Sub

'set position
Sub SetLeftSection(b As Boolean) As MDLMegaFooterSection
	DDSInt.AddClass("mdl-mega-footer__left-section")
	Return Me
End Sub

'set position
Sub SetRightSection(b As Boolean) As MDLMegaFooterSection
	DDSInt.AddClass("mdl-mega-footer__right-section")
	Return Me
End Sub


'set position
Sub SetMiddleSection(b As Boolean) As MDLMegaFooterSection
	DDSInt.AddClass("mdl-mega-footer__middle-section")
	Return Me
End Sub

'set logo
Sub SetLogo(t As String) As MDLMegaFooterSection
	DDSInt.AddElement(BanReact.CreateElement("div",Null,t).AddClass("mdl-logo"))
	Return Me
End Sub

'add a link
Sub AddLink(Label As String, href As String, target As String) As MDLMegaFooterSection
	Dim li As ReactElement = BanReact.li("")
	Dim a As MDLAnchor
	a.Initialize(BanReact,"").SetHref(href).SetLabel(Label).SetTarget(target)
	li.AddElement(a.Anchor)
	FLinks.AddElement(li)
	Return Me
End Sub

'ge the footer
Sub MegaFooterSection As ReactElement
	DDSInt.AddElement(FLinks)
	Return DDSInt
End Sub