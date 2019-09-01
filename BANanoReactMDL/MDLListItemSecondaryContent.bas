B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private BanRe As BANanoReact
	Public SecondaryContent As ReactElement
End Sub

'initialize the secondary item
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLListItemSecondaryContent
	ID = sid
	BanRe = BR
	SecondaryContent = BR.span(sid).AddClass("mdl-list__item-secondary-content")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(SecondaryContent)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLListItemSecondaryContent
	SecondaryContent.AddClass(clsList)
	Return Me
End Sub

'set the action icon
Sub SetActionIcon(iconName As String) As MDLListItemSecondaryContent
	Dim a As ReactElement = BanRe.a($"${ID}-action-icon"$).AddClass("mdl-list__item-secondary-action").SetHREF("#")
	a.AddElement(BanRe.CreateElement("i",CreateMap("role":"presentation"),iconName).AddClass("material-icons"))
	SecondaryContent.AddElement(a)
	Return Me
End Sub

'set secondary info
Sub SetInfo(info As String) As MDLListItemSecondaryContent
	Dim span As ReactElement = BanRe.span($"${ID}-info"$).AddClass("mdl-list__item-secondary-info").SetLabel(info)
	SecondaryContent.AddElement(span)
	Return Me
End Sub

'set radio option
Sub SetRadio(rid As String, rName As String, rValue As String, rChecked As Boolean) As MDLListItemSecondaryContent
	Dim span As ReactElement = BanRe.span(rid).AddClass("mdl-list__item-secondary-action")
	Dim label As ReactElement = BanRe.label("").AddClass("mdl-radio mdl-js-radio mdl-js-ripple-effect")
	label.SetStyle("display", "inline").SetFor($"${rid}-option"$)
	Dim inp As ReactElement = BanRe.input($"${rid}-option"$).SetType("radio").AddClass("mdl-radio__button")
	inp.SetName(rName).SetValue(rValue).SetChecked(rChecked)
	label.AddElement(inp)
	span.AddElement(label)
	SecondaryContent.AddElement(span)
	Return Me
End Sub

'set checkbox
Sub SetCheckBox(rid As String, rName As String, rValue As String, rChecked As Boolean) As MDLListItemSecondaryContent
	Dim span As ReactElement = BanRe.span(rid).AddClass("mdl-list__item-secondary-action")
	Dim label As ReactElement = BanRe.label("").AddClass("mdl-checkbox mdl-js-checkbox mdl-js-ripple-effect")
	label.SetFor($"${rid}-checkbox"$)
	Dim inp As ReactElement = BanRe.input($"${rid}-checkbox"$).SetType("checkbox").AddClass("mdl-checkbox__input")
	inp.SetName(rName).SetValue(rValue).SetChecked(rChecked)
	label.AddElement(inp)
	span.AddElement(label)
	SecondaryContent.AddElement(span)
	Return Me
End Sub

'set switch
Sub SetSwitch(rid As String, rName As String, rValue As String, rChecked As Boolean) As MDLListItemSecondaryContent
	Dim span As ReactElement = BanRe.span(rid).AddClass("mdl-list__item-secondary-action")
	Dim label As ReactElement = BanRe.label("").AddClass("mdl-switch mdl-js-switch mdl-js-ripple-effect")
	label.SetFor($"${rid}-switch"$)
	Dim inp As ReactElement = BanRe.input($"${rid}-switch"$).SetType("checkbox").AddClass("mdl-switch__input")
	inp.SetName(rName).SetValue(rValue).SetChecked(rChecked)
	label.AddElement(inp)
	span.AddElement(label)
	SecondaryContent.AddElement(span)
	Return Me
End Sub
