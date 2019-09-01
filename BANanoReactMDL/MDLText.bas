B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private TextInt As ReactElement
	Private Label As ReactElement
	Private Input As ReactElement
	Private span As ReactElement
	Private TextArea As ReactElement
	Private bTextArea As Boolean
	Private SpanContent As Boolean
	Private LabelContent As Boolean
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLText
	ID = sid
	TextInt = BR.div(sid)
	TextInt.AddClass("mdl-textfield mdl-js-textfield")
	'
	Label = BR.label($"${ID}-label"$).SetFor(ID & "-input").AddClass("mdl-textfield__label")
	'
	Input = BR.input($"${ID}-input"$).AddClass("mdl-textfield__input").SetType("text")
	'
	TextArea = BR.textarea($"${ID}-input"$).AddClass("mdl-textfield__input").SetType("text")
	'
	span = BR.span("").AddClass("mdl-textfield__error")
	'
	bTextArea = False
	SpanContent = False
	LabelContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Text)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLText
	TextInt.AddClass(clsList)
	Return Me
End Sub

'fix floating label
Sub SetFixFloatingLabel(b As Boolean) As MDLText
	TextInt.AddClass("has-placeholder")
	Return Me
End Sub

'set floating label
Sub SetFloatingLabel(b As Boolean) As MDLText
	TextInt.AddClass("mdl-textfield--floating-label")
	Return Me
End Sub

'set max rows
Sub SetMaxRows(r As Int) As MDLText
	TextArea.SetProp("maxrows", r)
	Return Me
End Sub


'set rows
Sub SetRows(r As Int) As MDLText
	TextArea.SetRows(r)
	Return Me
End Sub

'set text area
Sub SetTextArea(b As Boolean) As MDLText
	bTextArea = b
	Return Me
End Sub


'set hint message
Sub SetHint(msg As String) As MDLText
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLText
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub


'set alpha
Sub SetAlpha(b As Boolean) As MDLText
	Input.SetPattern("[A-Z,a-z, ]")
	Return Me
End Sub

'set numeric
Sub SetNumeric(b As Boolean) As MDLText
	Input.SetPattern("-?[0-9]*(\.[0-9]+)?")
	Return Me
End Sub

'Set label
Sub SetLabel(l As String) As MDLText
	Label.SetLabel(l)
	LabelContent = True
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLText
	Input.SetName(n)
	Return Me
End Sub

'return element
Sub Text As ReactElement
	If bTextArea = False Then
		TextInt.AddElement(Input)
	Else
		TextInt.AddElement(TextArea)
	End If
	If LabelContent Then TextInt.AddElement(Label)
	If SpanContent Then TextInt.AddElement(span)
	Return TextInt
End Sub