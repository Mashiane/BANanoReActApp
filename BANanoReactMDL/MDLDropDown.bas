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
	Private BanRe As BANanoReact
End Sub


#if css
.gj-textbox-md, .gj-dropdown-md [role=presenter] {
 	border-bottom: 1px solid rgba(0,0,0,.12) !important;
 }
 #End If

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLDropDown
	BanRe = BR
	ID = sid.tolowercase
	JQ = BR.jquery
	TextInt = BR.div($"${ID}-div"$).AddClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label")
	'
	Label = BR.label($"${ID}-label"$).SetFor(ID & "-input").AddClass("mdl-textfield__label")
	'
	Input = BR.combo($"${ID}"$)
	'
	span = BR.span("").AddClass("mdl-textfield__error")
	'
	SpanContent = False
	LabelContent = False
	Options.Initialize 
	SetFixFloatingLabel(True)
	SetWidth("100%")
	Return Me
End Sub

'dataSource
Sub SetDataSource(ds As Object) As MDLDropDown
	Options.Put("dataSource", ds)
	Return Me
End Sub

'valueField
Sub SetValueField(vf As Object) As MDLDropDown
	Options.Put("valueField", vf)
	Return Me
End Sub

'textField
Sub SetTextField(tf As Object) As MDLDropDown
	Options.Put("textField", tf)
	Return Me
End Sub

'placeholder
Sub SetPlaceholder(ph As Object) As MDLDropDown
	Options.Put("placeholder", ph)
	Return Me
End Sub

'selectedField
Sub SetSelectedField(sf As Object) As MDLDropDown
	Options.Put("selectedField", sf)
	Return Me
End Sub

'maxHeight
Sub SetMaxHeight(mh As Object) As MDLDropDown
	Options.put("maxHeight", mh)
	Return Me
End Sub

'add an item
Sub AddItem(eID As String, eValue As String) As MDLDropDown
	Dim opt As ReactElement = BanRe.option("")
	opt.SetValue(eID).SetLabel(eValue)
	Input.AddReactElement(opt)
	Return Me
End Sub

'render the page picker on page
Sub Render
	JQ.getItemByID($"#${ID}"$).RunMethod("dropdown", Array(Options))
End Sub

'set width
Sub SetWidth(w As Int) As MDLDropDown
	Options.Put("width", w)
	Return Me
End Sub

'set value
Sub SetValue(v As Object) As MDLDropDown
	Input.SetValue(v)
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As MDLDropDown
	Input.SetDefaultValue(dv)
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLDropDown
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	Options.put("change", cb)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(DropDown)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLDropDown
	TextInt.AddClass(clsList)
	Return Me
End Sub

'fix floating label
private Sub SetFixFloatingLabel(b As Boolean) As MDLDropDown
	TextInt.AddClass("has-placeholder")
	Return Me
End Sub

'set hint message
Sub SetHint(msg As String) As MDLDropDown
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'set error message
Sub SetErrorMessage(msg As String) As MDLDropDown
	span.SetLabel(msg)
	SpanContent = True
	Return Me
End Sub

'Set label
Sub SetLabel(l As String) As MDLDropDown
	Label.SetLabel(l)
	LabelContent = True
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLDropDown
	Input.SetName(n)
	Return Me
End Sub

'return element
Sub DropDown As ReactElement
	TextInt.AddElement(Input)
	If LabelContent Then TextInt.AddElement(Label)
	If SpanContent Then TextInt.AddElement(span)
	Return TextInt
End Sub