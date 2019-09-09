B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private ProgressInt As ReactElement
	Private BANano As BANano 'ignore
End Sub


'initialize the checkbox
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLProgress
	ID = sid
	'
	ProgressInt = BR.div(sid).AddClasses(Array("mdl-progress", "mdl-js-progress"))
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Progress)
End Sub

'get progress
Sub Progress As ReactElement
	Return ProgressInt
End Sub

'add a class
Sub AddClass(clsList As String) As MDLProgress
	ProgressInt.AddClass(clsList)
	Return Me
End Sub

Sub SetIndeterminate(b As Boolean) As MDLProgress
	If b Then
		ProgressInt.AddClass("mdl-progress__indeterminate")
	End If
	Return Me
End Sub

'set progress value
Sub SetProgress(prgVal As Int) As MDLProgress
	Dim prgid As String = $"#${ID}"$
	'
	Dim bo As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(prgid))
	bo.GetField("MaterialProgress").RunMethod("setProgress", Array(prgVal))
	Return Me
End Sub

'set buffer
Sub SetBuffer(prgVal As Int) As MDLProgress
	Dim prgid As String = $"#${ID}"$
	'
	Dim bo As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(prgid))
	bo.GetField("MaterialProgress").RunMethod("setBuffer", Array(prgVal))
	Return Me
End Sub


'set properties
Sub SetProps(m As Map) As MDLProgress
	ProgressInt.SetProps(m)
	Return Me
End Sub

Sub SetWidth(w As Object) As MDLProgress
	ProgressInt.SetWidth(w)
	Return Me
End Sub
