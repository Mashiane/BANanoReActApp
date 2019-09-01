﻿B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private InputDiv As ReactElement
	Private eh As ReactElement
	Private bFLoat As Boolean
	Private lbl As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSearch
	ID = sid
	bFLoat = False
	InputDiv = BR.div(sid).AddClass("mdl-textfield mdl-js-textfield mdl-textfield--expandable")
	'
	Dim label As ReactElement
	label = BR.label($"${ID}-label"$).AddClass("mdl-button mdl-js-button mdl-button--icon").SetFor($"${ID}-input"$)
	'
	Dim i As ReactElement
	i = BR.i($"${ID}-icon"$).AddClass("material-icons").SetLabel("search").SetProp("role","presentation")
	label.AddElement(i)
	'
	InputDiv.AddElement(label)
	'
	eh = BR.div($"${ID}-eh"$).AddClass("mdl-textfield__expandable-holder")
	'
	Dim inp As ReactElement = BR.input($"${ID}-input"$).SetType("text").AddClass("mdl-textfield__input")
	lbl = BR.label("").AddClass("mdl-textfield__label").SetFor($"${ID}-lblx"$)
	'
	eh.AddElement(inp)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Search)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLSearch
	InputDiv.AddClass(clsList)
	Return Me
End Sub

'add a class
Sub SetTextAlignRight(b As Boolean) As MDLSearch
	InputDiv.AddClass("mdl-textfield--align-right")
	Return Me
End Sub

'return the search stuff
Sub Search As ReactElement
	If bFLoat Then
		lbl.SetFor($"${ID}-input"$)
	End If
	eh.AddElement(lbl)
	InputDiv.AddElement(eh)
	Return InputDiv
End Sub

'set label
Sub SetLabel(txt As String) As MDLSearch
	lbl.SetLabel(txt)
	Return Me
End Sub


'set floating label
Sub SetFloatingLabel(b As Boolean) As MDLSearch
	bFLoat = True
	InputDiv.AddClass("mdl-textfield--floating-label")
	Return Me
End Sub