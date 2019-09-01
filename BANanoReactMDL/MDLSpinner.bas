B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private SpinnerInt As ReactElement
End Sub


'initialize the checkbox
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSpinner
	ID = sid
	'
	SpinnerInt = BR.div(sid).AddClasses(Array("mdl-spinner", "mdl-js-spinner"))
	Return Me
End Sub

'get the spinner
Sub Spinner As ReactElement
	Return SpinnerInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Spinner)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLSpinner
	SpinnerInt.AddClass(clsList)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSpinner
	SpinnerInt.SetProps(m)
	Return Me
End Sub

'set is active
Sub SetIsActive(b As Boolean) As MDLSpinner
	If b Then
		SpinnerInt.AddClass("is-active")
	End If
	Return Me
End Sub

'set single color
Sub SetSingleColor(b As Boolean) As MDLSpinner
	If b Then
		SpinnerInt.AddClass("mdl-spinner--single-color")
	End If
	Return Me
End Sub
