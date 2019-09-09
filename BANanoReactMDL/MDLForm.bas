B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private FormInt As ReactElement
	Private BanReact As BANanoReact
End Sub

'initialize the column
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLForm
	ID = sid
	FormInt = BR.form(sid)
	BanReact = BR
	Return Me
End Sub

'add a child element
Sub AddRectElement(re As ReactElement) As MDLForm
	FormInt.AddReactElement(re)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(FormInt)
End Sub

'return the form
Sub Form As ReactElement
	Return FormInt
End Sub

'set action
Sub SetAction(a As String) As MDLForm
	FormInt.SetProp("action", a)
	Return Me
End Sub

'set method
Sub SetMethod(m As String) As MDLForm
	FormInt.SetProp("method", m)
	Return Me
End Sub

'set enctype
Sub SetEncType(ety As String) As MDLForm
	FormInt.SetProp("enctype", ety)
	Return Me
End Sub

'set multi form data
Sub SetMultiFormData(b As Boolean) As MDLForm
	SetEncType("multipart/form-data")
	Return Me
End Sub