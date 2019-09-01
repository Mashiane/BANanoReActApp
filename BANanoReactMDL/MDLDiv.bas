B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
Sub Class_Globals
	Private fx As JFX
	Public Div As ReactElement
End Sub

Public Sub Initialize(BR As BANanoReact, sID As String) As MDLDiv
	Div = BR.div(sID)
	Return Me
End Sub

Sub SetMaterialIcons(b As Boolean) As MDLDiv
	If b Then
		Div.AddClass("material-icons")
	End If
	Return Me
End Sub

Sub SetBadge(badge As Object) As MDLDiv
	Div.AddClass("mdl-badge")
	Div.SetProp("data-badge", badge)
	Return Me
End Sub

Sub SetBadgeOverlap(b As Boolean) As MDLDiv
	Div.AddClass("mdl-badge--overlap")
	Return Me
End Sub


Sub SetBadgeNoBackground(b As Boolean) As MDLDiv
	Div.AddClass("mdl-badge--no-background")
	Return Me
End Sub


Sub SetText(txt As String) As MDLDiv
	Div.AddChild(txt)
	Return Me
End Sub