B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private FileInt As ReactElement
	Private banreact As BANanoReact
	Private lbl As ReactElement
	Private inp As ReactElement
	Private span As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLFileInput
	ID = sid.tolowercase
	banreact = BR
	FileInt = BR.div($"${ID}-div"$).AddClass("element file mdl-file mdl-js-file mdl-textfield--floating-label")
	inp = BR.input($"${ID}"$).SetType("file")
	lbl = BR.label($"${ID}-label"$).AddClass("mdl-file__label").SetFor($"${ID}-input"$)
	span = BR.span($"${ID}-span"$).AddClass("mdl-textfield__error")
	Return Me
End Sub


'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLFileInput
	inp.SetOnChange(module, methodName)
	Return Me
End Sub

'rest the file input
Sub ResetInput
	Try
		Dim componentRegister As BANanoObject
		componentRegister.Initialize("componentRegister")
		'
		Dim fi As BANanoObject = componentRegister.RunMethod("getComponentById", Array(ID))
		fi.RunMethod("resetInput_", Null)
	Catch
		Log(LastException)
	End Try
End Sub


'set error msg
Sub SetErrorMessage(emsg As String) As MDLFileInput
	span.SetLabel(emsg)
	Return Me
End Sub

'set name
Sub SetName(n As String) As MDLFileInput
	inp.SetName(n)
	Return Me
End Sub

'set multiple
Sub SetMultiple(b As Boolean) As MDLFileInput
	inp.SetProp("multiple", b)
	FileInt.SetProp("data-placeholder-multiple","files added to the list")
	Return Me
End Sub	

'set label
Sub SetLabel(l As String) As MDLFileInput
	lbl.SetLabel(l)
	Return Me
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLFileInput
	FileInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLFileInput
	FileInt.AddClass(cls)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLFileInput
	FileInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLFileInput
	FileInt.SetDisabled(b)
	Return Me
End Sub

'set accept
Sub SetAccept(a As String) As MDLFileInput
	inp.SetProp("accept", a)
	Return Me
End Sub

'get the button
Sub FileInput As ReactElement
	FileInt.AddReactElement(inp)
	FileInt.AddReactElement(lbl)
	FileInt.AddReactElement(span)
	Return FileInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(FileInput)
End Sub
