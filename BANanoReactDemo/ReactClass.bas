B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.78
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Private propTypes As Map
	Private internal As Map
	Private BANano As BANano  'ignore
	Public Element As BANanoObject
	Private BanRe As BANanoReact
End Sub

Public Sub Initialize(BR As BANanoReact) As ReactClass
	BanRe = BR
	propTypes.Initialize 
	internal.Initialize
	Return Me 
End Sub

Sub SetRender(module As Object, methodName As String, params As List)
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, params)
	internal.Put("render", cb)
	CreateClass
End Sub

private Sub CreateClass
	If propTypes.Size > 0 Then
		internal.Put("propTypes", propTypes)
	End If
	Element = BanRe.React.RunMethod("createClass", Array(internal))
End Sub