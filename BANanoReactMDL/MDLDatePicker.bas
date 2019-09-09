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
	Private BANano As BANano   'ignore
End Sub


#if css
.gj-textbox-md, .gj-dropdown-md [role=presenter] {
 	border-bottom: 1px solid rgba(0,0,0,.12) !important;
 }
 #End If
 
'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLDatePicker
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
	Return Me
End Sub

'render the page picker on page
Sub Render
	JQ.getItemByID($"#${ID}"$).RunMethod("datepicker", Array(Options))
End Sub

'set min date
Sub SetMinDate(m As Object) As MDLDatePicker
	Options.put("minDate", m)
	Return Me
End Sub

'set max date
Sub SetMaxDate(m As Object) As MDLDatePicker
	Options.Put("maxDate", m)
	Return Me
End Sub

' selectOtherMonths
Sub SetSelectOtherMonths(b As Boolean) As MDLDatePicker
	Options.Put("selectOtherMonths", b)
	Return Me
End Sub

'show other months
Sub SetShowOtherMonths(b As Boolean) As MDLDatePicker
	Options.Put("showOtherMonths", b)
	Return Me
End Sub

'set size
Sub SetSize(s As Object) As MDLDatePicker
	Options.Put("size", s)
	Return Me
End Sub

'set width
Sub SetWidth(w As Int) As MDLDatePicker
	Options.Put("width", w)
	Return Me
End Sub

'showRightIcon
Sub SetShowRightIcon(b As Boolean) As MDLDatePicker
	Options.Put("showRightIcon", b)
	Return Me
End Sub

'showOnFocus
Sub SetShowOnFocus(b As Boolean) As MDLDatePicker
	Options.Put("showOnFocus", b)
	Return Me
End Sub

'set locale spanish
Sub SetLocaleSpanish(b As Boolean) As MDLDatePicker
	Options.Put("locale", "es-es")
	Return Me
End Sub


'set keyboard navigation
Sub SetKeyboardNavigation(b As Boolean) As MDLDatePicker
	Options.Put("keyboardNavigation", b)
	Return Me
End Sub

'set header
Sub SetHeader(b As Boolean) As MDLDatePicker
	Options.Put("header", b)
	Return Me
End Sub

'set format
Sub SetFormat(f As Object) As MDLDatePicker
	Options.Put("format", f)
	Return Me
End Sub

'set calendar weeks
Sub SetCalendarWeeks(b As Boolean) As MDLDatePicker
	Options.Put("calendarWeeks", b)
	Return Me
End Sub

'set footer
Sub SetFooter(b As Boolean) As MDLDatePicker
	Options.Put("footer", b)
	Return Me
End Sub

'set modal
Sub SetModal(b As Boolean) As MDLDatePicker
	Options.Put("modal", b)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLDatePicker
	Input.SetValue(v)
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As MDLDatePicker
	Input.SetDefaultValue(dv)
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLDatePicker
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("change", cb)
	Return Me
End Sub


'on select event
Sub SetOnSelect(module As Object, methodName As String) As MDLDatePicker
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("select", cb)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(DatePicker)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLDatePicker
	TextInt.AddClass(clsList)
	Return Me
End Sub

'fix floating label
private Sub SetFixFloatingLabel(b As Boolean) As MDLDatePicker
	TextInt.AddClass("has-placeholder")
	Return Me
End Sub

'set hint message
Sub SetHint(msg As String) As MDLDatePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLDatePicker
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'Set label
Sub SetLabel(l As String) As MDLDatePicker
	Label.SetLabel(l)
	LabelContent = True
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLDatePicker
	Input.SetName(n)
	Return Me
End Sub

'return element
Sub DatePicker As ReactElement
	TextInt.AddElement(Input)
	If LabelContent Then TextInt.AddElement(Label)
	If SpanContent Then TextInt.AddElement(span)
	Return TextInt
End Sub