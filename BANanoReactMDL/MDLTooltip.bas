B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private TooltipInt As ReactElement
End Sub

'initialize the tooltip
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLTooltip
	TooltipInt = BR.div(sid).AddClass("mdl-tooltip")
	Return Me
End Sub


'add a class
Sub AddClass(clsList As String) As MDLTooltip
	TooltipInt.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLTooltip
	TooltipInt.SetProps(m)
	Return Me
End Sub

'set large
Sub SetLarge(b As Boolean) As MDLTooltip
	TooltipInt.AddClass("mdl-tooltip--large")
	Return Me
End Sub

'set top
Sub SetTop(b As Boolean) As MDLTooltip
	TooltipInt.AddClass("mdl-tooltip--top")
	Return Me
End Sub

'set left
Sub SetLeft(b As Boolean) As MDLTooltip
	TooltipInt.AddClass("mdl-tooltip--left")
	Return Me
End Sub

'set bottom
Sub SetBottom(b As Boolean) As MDLTooltip
	TooltipInt.AddClass("mdl-tooltip--bottom")
	Return Me
End Sub

'set right
Sub SetRight(b As Boolean) As MDLTooltip
	TooltipInt.AddClass("mdl-tooltip--right")
	Return Me
End Sub


'set text
Sub SetLabel(txt As String) As MDLTooltip
	TooltipInt.SetLabel(txt)
	Return Me
End Sub

'set for
Sub SetFor(elFor As String) As MDLTooltip
	TooltipInt.setprop("data-mdl-for", elFor)
	Return Me
End Sub

'get tooltip
Sub Tooltip As ReactElement
	Return TooltipInt
End Sub