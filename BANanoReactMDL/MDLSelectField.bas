B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private banreact As BANanoReact
	Private selID As String
	Private sfInt As ReactElement
	Private BANano As BANano   'ignore
	Private sel As ReactElement
	Private lbl As ReactElement
	Private spn As ReactElement
End Sub


'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSelectField
	ID = sid.tolowercase
	banreact = BR
	sfInt = BR.div(ID).AddClass("mdl-selectfield mdl-js-selectfield mdl-selectfield--floating-label")
	sel = BR.combo($"${ID}-select"$).AddClass("mdl-selectfield__select")
	lbl = BR.label("").AddClass("mdl-selectfield__label").SetFor(ID)
	spn = BR.span("").AddClass("mdl-selectfield__error")
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLSelectField
	spn.SetLabel(msg)
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLSelectField
	sel.SetOnChange(module, methodName)
	Return Me
End Sub

'set selected item
Sub SetSelected(eID As String) As MDLSelectField
	selID = eID
	Return Me
End Sub

'set required
Sub SetRequired(b As Boolean) As MDLSelectField
	sel.SetRequired(b)
	Return Me
End Sub

'add an item
Sub AddItem(eID As String, eValue As String) As MDLSelectField
	Dim opt As ReactElement = banreact.option("")
	opt.SetValue(eID).SetLabel(eValue)
	sel.AddReactElement(opt)
	Return Me
End Sub

'get the button
Sub SelectField As ReactElement
	sfInt.AddReactElement(sel)
	sfInt.AddReactElement(lbl)
	sfInt.AddReactElement(spn)
	Return sfInt
End Sub

'set name
Sub SetName(n As String) As MDLSelectField
	sel.SetName(n)
	Return Me
End Sub


'set label
Sub SetLabel(l As String) As MDLSelectField
	lbl.SetLabel(l)
	Return Me
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLSelectField
	sfInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLSelectField
	sfInt.AddClass(cls)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSelectField
	sfInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLSelectField
	sfInt.SetDisabled(b)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(SelectField)
End Sub
