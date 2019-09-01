B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private SnackDiv As ReactElement
	Private BANano As BANano 'ignore
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSnackBar
	ID = sid
	SnackDiv = BR.div(sid).AddClass("mdl-js-snackbar mdl-snackbar")
	SnackDiv.AddElement(BR.CreateElement("div",CreateMap(),Null).AddClass("mdl-snackbar__text"))
	SnackDiv.AddElement(BR.CreateElement("button",CreateMap("type":"button"),Null).AddClass("mdl-snackbar__action"))
	Return Me
End Sub

'return snack bar
Sub SnackBar As ReactElement
	Return SnackDiv
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(SnackBar)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLSnackBar
	SnackDiv.AddClass(clsList)
	Return Me
End Sub

'show snackbar
Sub Show(Message As String, TimeOut As String, ActionText As String)
	Dim snackid As String = $"#${ID}"$
	
	Dim data As Map = CreateMap("message": Message, "timeout": TimeOut, "actionText": ActionText)
	'
	Dim snack As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(snackid))
	'
	snack.GetField("MaterialSnackbar").RunMethod("showSnackbar", Array(data))
End Sub

'show toast
Sub Toast(Message As String)
	Dim data As Map = CreateMap("message": Message)
	Dim snackid As String = $"#${ID}"$
	'
	Dim snack As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(snackid))
	'
	snack.GetField("MaterialSnackbar").RunMethod("showSnackbar", Array(data))
End Sub
