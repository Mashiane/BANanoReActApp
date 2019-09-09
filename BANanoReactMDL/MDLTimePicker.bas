B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.78
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private TextInt As ReactElement
	Private Label As ReactElement
	Private Input As ReactElement
	Private span As ReactElement
	Private SpanContent As Boolean
	Private LabelContent As Boolean
	Private Options As Map
	Private JQ As BANanoJQuery
	Private BANano As BANano  'ignore
End Sub


#if css
.gj-textbox-md, .gj-dropdown-md [role=presenter] {
 	border-bottom: 1px solid rgba(0,0,0,.12) !important;
 }
 #End If

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLTimePicker
	ID = sid.tolowercase
	JQ = BR.JQuery
	TextInt = BR.div($"${ID}-div"$).AddClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label")
	'
	Label = BR.label($"${ID}-label"$).SetFor(ID & "-input").AddClass("mdl-textfield__label")
	'
	Input = BR.input($"${ID}"$).AddClass("mdl-textfield__input").SetType("text")
	'
	span = BR.span("").AddClass("mdl-textfield__error")
	'
	SpanContent = False
	LabelContent = False
	Options.Initialize
	SetFixFloatingLabel(True)
	SetFooter(True)
	Return Me
End Sub

'render the page picker on page
Sub Render
	JQ.getItemByID($"#${ID}"$).RunMethod("timepicker", Array(Options))
End Sub

'set size
Sub SetSize(s As Object) As MDLTimePicker
	Options.Put("size", s)
	Return Me
End Sub

'set width
Sub SetWidth(w As Int) As MDLTimePicker
	Options.Put("width", w)
	Return Me
End Sub

'set locale spanish
Sub SetLocaleSpanish(b As Boolean) As MDLTimePicker
	Options.Put("locale", "es-es")
	Return Me
End Sub

'set header
Sub SetHeader(b As Boolean) As MDLTimePicker
	Options.Put("header", b)
	Return Me
End Sub

'set format
Sub SetFormat(f As Object) As MDLTimePicker
	Options.Put("format", f)
	Return Me
End Sub

'set footer
Sub SetFooter(b As Boolean) As MDLTimePicker
	Options.Put("footer", b)
	Return Me
End Sub

'set modal
Sub SetModal(b As Boolean) As MDLTimePicker
	Options.Put("modal", b)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLTimePicker
	Input.SetValue(v)
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As MDLTimePicker
	Input.SetDefaultValue(dv)
	Return Me
End Sub
'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLTimePicker
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("change", cb)
	Return Me
End Sub


'on select event
Sub SetOnSelect(module As Object, methodName As String) As MDLTimePicker
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("select", cb)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(TimePicker)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLTimePicker
	TextInt.AddClass(clsList)
	Return Me
End Sub

'fix floating label
private Sub SetFixFloatingLabel(b As Boolean) As MDLTimePicker
	TextInt.AddClass("has-placeholder")
	Return Me
End Sub

'set hint message
Sub SetHint(msg As String) As MDLTimePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLTimePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'Set label
Sub SetLabel(l As String) As MDLTimePicker
	Label.SetLabel(l)
	LabelContent = True
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLTimePicker
	Input.SetName(n)
	Return Me
End Sub

'return element
Sub TimePicker As ReactElement
	TextInt.AddElement(Input)
	If LabelContent Then TextInt.AddElement(Label)
	If SpanContent Then TextInt.AddElement(span)
	Return TextInt
End Sub