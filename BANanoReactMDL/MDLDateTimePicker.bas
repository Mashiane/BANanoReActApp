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
	Private opt As Map
	Private BANano As BANano  'ignore
End Sub


#if css
.gj-textbox-md, .gj-dropdown-md [role=presenter] {
 	border-bottom: 1px solid rgba(0,0,0,.12) !important;
 }
 #End If

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLDateTimePicker
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
	SetShowOtherMonths(True)
	SetSelectOtherMonths(True)
	SetFooter(True)
	opt.Initialize 
	Return Me
End Sub

'render the page picker on page
Sub Render
	If opt.Size > 0 Then 
		Options.Put("datepicker", opt)
	End If
	JQ.getItemByID($"#${ID}"$).RunMethod("datetimepicker", Array(Options))
End Sub

'set min date
Sub SetMinDate(m As Object) As MDLDateTimePicker
	Options.put("minDate", m)
	Return Me
End Sub

'set max date
Sub SetMaxDate(m As Object) As MDLDateTimePicker
	Options.Put("maxDate", m)
	Return Me
End Sub

' selectOtherMonths
Sub SetSelectOtherMonths(b As Boolean) As MDLDateTimePicker
	Options.Put("selectOtherMonths", b)
	Return Me
End Sub

'show other months
Sub SetShowOtherMonths(b As Boolean) As MDLDateTimePicker
	opt.Put("showOtherMonths", b)
	Return Me
End Sub

'set size
Sub SetSize(s As Object) As MDLDateTimePicker
	Options.Put("size", s)
	Return Me
End Sub

'set width
Sub SetWidth(w As Int) As MDLDateTimePicker
	Options.Put("width", w)
	Return Me
End Sub

'set locale spanish
Sub SetLocaleSpanish(b As Boolean) As MDLDateTimePicker
	Options.Put("locale", "es-es")
	Return Me
End Sub

'set format
Sub SetFormat(f As Object) As MDLDateTimePicker
	Options.Put("format", f)
	Return Me
End Sub

'set calendar weeks
Sub SetCalendarWeeks(b As Boolean) As MDLDateTimePicker
	opt.Put("calendarWeeks", b)
	Return Me
End Sub

'set footer
Sub SetFooter(b As Boolean) As MDLDateTimePicker
	Options.Put("footer", b)
	Return Me
End Sub

'set modal
Sub SetModal(b As Boolean) As MDLDateTimePicker
	Options.Put("modal", b)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLDateTimePicker
	Input.SetValue(v)
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As MDLDateTimePicker
	Input.SetDefaultValue(dv)
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLDateTimePicker
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("change", cb)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(DateTimePicker)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLDateTimePicker
	TextInt.AddClass(clsList)
	Return Me
End Sub

'fix floating label
private Sub SetFixFloatingLabel(b As Boolean) As MDLDateTimePicker
	TextInt.AddClass("has-placeholder")
	Return Me
End Sub

'set hint message
Sub SetHint(msg As String) As MDLDateTimePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLDateTimePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'Set label
Sub SetLabel(l As String) As MDLDateTimePicker
	Label.SetLabel(l)
	LabelContent = True
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLDateTimePicker
	Input.SetName(n)
	Return Me
End Sub

'return element
Sub DateTimePicker As ReactElement
	TextInt.AddElement(Input)
	If LabelContent Then TextInt.AddElement(Label)
	If SpanContent Then TextInt.AddElement(span)
	Return TextInt
End Sub