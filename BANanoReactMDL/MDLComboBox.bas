B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private ComboInt As ReactElement
	Private banreact As BANanoReact
	Private lbl As ReactElement
	Private inp1 As ReactElement
	Private ul As ReactElement
	Private inp2 As ReactElement
	Private icon As ReactElement
	Private selID As String
	Private BANano As BANano   'ignore
End Sub


'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLComboBox
	ID = sid.tolowercase
	banreact = BR
	ComboInt = BR.div($"${ID}-div"$).AddClass("mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select")
	inp1 = BR.input(ID).SetType("text").SetDefaultValue("").AddClass("mdl-textfield__input").SetReadOnly(True)
	inp2 = BR.input("").SetType("hidden").setDefaultvalue("").SetName(ID)
	lbl = BR.label("").SetFor(ID).AddClass("mdl-textfield__label")
	ul = BR.ul($"${ID}Ul"$).SetFor(ID).AddClass("mdl-menu mdl-menu--bottom-left mdl-js-menu")
	'
	icon = BR.i("").AddClass("mdl-icon-toggle__label material-icons").SetLabel("keyboard_arrow_down")
	selID = ""
	Return Me
End Sub

'on change event
Sub SetOnChange(module As Object, methodName As String) As MDLComboBox
	inp1.SetOnChange(module, methodName)
	Return Me
End Sub

'set selected item
Sub SetSelected(eID As String) As MDLComboBox
	selID = eID
	Return Me
End Sub

'set fixed height
Sub SetFixedHeight(b As Boolean) As MDLComboBox
	ComboInt.AddClass("getmdl-select__fix-height")
	Return Me
End Sub

'add an item
Sub AddItem(eID As String, eValue As String) As MDLComboBox
	Dim li As ReactElement = banreact.li("")
	li.AddClass("mdl-menu__item")
	li.SetProp("data-val", eID)
	li.SetLabel(eValue)
	If eID = selID Then
		li.SetProp("data-selected", "true")
	End If
	ul.AddReactElement(li)
	Return Me
End Sub

'get the button
Sub ComboBox As ReactElement
	ComboInt.AddReactElement(inp1)
	ComboInt.AddReactElement(inp2)
	ComboInt.AddReactElement(icon)
	ComboInt.AddReactElement(lbl)
	ComboInt.AddReactElement(ul)
	Return ComboInt
End Sub


'set name
Sub SetName(n As String) As MDLComboBox
	inp2.SetName(n)
	Return Me
End Sub


'set label
Sub SetLabel(l As String) As MDLComboBox
	lbl.SetLabel(l)
	Return Me
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLComboBox
	ComboInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLComboBox
	ComboInt.AddClass(cls)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLComboBox
	ComboInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLComboBox
	ComboInt.SetDisabled(b)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(ComboBox)
End Sub
