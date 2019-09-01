B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private DDSInt As ReactElement
	Private BanReact As BANanoReact
	Private FLinks As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLMiniFooterLS
	ID = sid
	DDSInt = BR.div(ID).AddClass("mdl-mini-footer__left-section")
	BanReact = BR
	FLinks = BR.ul("").AddClass("mdl-mega-footer__link-list")
	Return Me
End Sub

'set logo
Sub SetLogo(t As String) As MDLMiniFooterLS
	DDSInt.AddReactElement(BanReact.CreateReactElement("div",Null,t).AddClass("mdl-logo"))
End Sub

'add a link
Sub AddLink(Label As String, href As String, target As String) As MDLMiniFooterLS
	Dim li As ReactElement = BanReact.li("")
	Dim a As MDLAnchor
	a.Initialize(BanReact,"").SetHref(href).SetLabel(Label).SetTarget(target)
	li.AddReactElement(a.Anchor)
	FLinks.AddReactElement(li)
	Return Me
End Sub

'ge the footer
Sub MiniFooterLS As ReactElement
	DDSInt.AddReactElement(FLinks)
	Return DDSInt
End Sub