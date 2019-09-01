B4J=true
Group=Default Group\MDL
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
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLMegaFooterDDS
	ID = sid
	DDSInt = BR.div(ID).AddClass("mdl-mega-footer__drop-down-section")
	'
	DDSInt.AddElement(BR.CreateElement("input",CreateMap("type":"checkbox","checked":True),Null).AddClass("mdl-mega-footer__heading-checkbox"))
	BanReact = BR
	FLinks = BR.ul("").AddClass("mdl-mega-footer__link-list")
	Return Me
End Sub


'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(MegaFooterDDS)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLMegaFooterDDS
	DDSInt.AddClass(clsList)
	Return Me
End Sub


'set title
Sub SetTitle(t As String) As MDLMegaFooterDDS
	DDSInt.AddElement(BanReact.CreateElement("h1",Null,t).AddClass("mdl-mega-footer__heading"))
	Return Me
End Sub

'add a link
Sub AddLink(Label As String, href As String, target As String) As MDLMegaFooterDDS
	Dim li As ReactElement = BanReact.li("")
	Dim a As MDLAnchor
	a.Initialize(BanReact,"").SetHref(href).SetLabel(Label).SetTarget(target) 
	li.AddElement(a.Anchor)
	FLinks.AddElement(li)
	Return Me
End Sub

'ge the footer
Sub MegaFooterDDS As ReactElement
	DDSInt.AddElement(FLinks)
	Return DDSInt
End Sub