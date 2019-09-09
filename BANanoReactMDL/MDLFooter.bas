B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private FootInt As ReactElement
	Private BanReact As BANanoReact
	Private mdlFooter1 As ReactElement
	Public HasContent As Boolean
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLFooter
	ID = sid
	FootInt = BR.footer(sid)
	mdlFooter1 = BR.div("")
	BanReact = BR
	HasContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Footer)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLFooter
	FootInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'set mini footer
Sub SetMiniFooter(b As Boolean) As MDLFooter
	FootInt.AddClass("mdl-mini-footer")
	HasContent = True
	Return Me
End Sub

'set mega menu
Sub SetMegaFooter(b As Boolean) As MDLFooter
	FootInt.AddClass("mdl-mega-footer")
	HasContent = True
	Return Me
End Sub

'ge the footer
Sub Footer As ReactElement
	FootInt.AddElement(mdlFooter1)
	HasContent = True
	Return FootInt
End Sub

'add mega footer dds
Sub AddMegaFooterDDS(mfdds As MDLMegaFooterDDS) As MDLFooter
	mdlFooter1.AddElement(mfdds.MegaFooterDDS)
	HasContent = True
	Return Me
End Sub


'add mega footer bs
Sub AddMegaFooterSection(mfdds As MDLMegaFooterSection) As MDLFooter
	mdlFooter1.AddElement(mfdds.MegaFooterSection)
	HasContent = True
	Return Me
End Sub