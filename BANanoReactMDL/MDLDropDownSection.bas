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
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact) As MDLDropDownSection
	ID = sid
	FootInt = BR.footer(sid)
	mdlFooter = BR.div("").AddClass("mdl-mega-footer__middle-section")
	BanReact = BR
	Return Me
End Sub

'set mega menu
Sub SetMegaFooter(b As Boolean) As MDLFooter
	FootInt.AddClass("mdl-mega-footer")
	Return Me
End Sub

'ge the footer
Sub Footer As ReactElement
	FootInt.AddReactElement(mdlFooter)
	Return FootInt
End Sub