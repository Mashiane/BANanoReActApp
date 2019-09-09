B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
#IgnoreWarnings:12
Sub Process_Globals
	Private BANano As BANano  'ignore
End Sub


'show snackbar
Sub SnackBarShow(eID As String, Message As String, TimeOut As String, ActionText As String)
	Dim data As Map = CreateMap("message": Message, "timeout": TimeOut, "actionText": ActionText)
	Dim snackid As String = $"#${eID}"$
	'
	Dim snack As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(snackid))
	'
	snack.GetField("MaterialSnackbar").RunMethod("showSnackbar", Array(data))
End Sub

'show toast
Sub SnackBarToast(eID As String, Message As String)
	Dim data As Map = CreateMap("message": Message)
	Dim snackid As String = $"#${eID}"$
	'
	Dim snack As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(snackid))
	'
	snack.GetField("MaterialSnackbar").RunMethod("showSnackbar", Array(data))
End Sub

'set progress value
Sub SetValueProgress(prgID As String, prgVal As Int)
	Dim eid As String = $"#${prgID}"$
	'
	Dim bo As BANanoObject = BANano.Window.GetField("document").RunMethod("querySelector", Array(eid))
	bo.GetField("MaterialProgress").RunMethod("setProgress", Array(prgVal))
End Sub


'refresh all components created dynamically
Sub Upgrade
	Try
		Dim componentHandler As BANanoObject
		componentHandler.Initialize("componentHandler")
		componentHandler.RunMethod("upgradeDom", Null)
	Catch
		Log(LastException)
	End Try	
End Sub
