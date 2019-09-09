B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private SpeedInt As ReactElement
	Private banreact As BANanoReact
	Private BANano As BANano 'ignore
	Private sdOptions As ReactElement
	Private bOnBottom As Boolean
	Private button As ReactElement
	Private buttons As List
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLSpeedDial
	ID = sid.tolowercase
	banreact = BR
	SpeedInt = BR.div(sid)
	SpeedInt.AddClass("mdl-speed-dial")
	sdOptions = BR.div($"${ID}-options"$)
	sdOptions.AddClass("mdl-speed-dial__options")
	bOnBottom = False
	button = BR.button($"${ID}-button"$)
	button.AddClass("mdl-speed-dial__main-fab mdl-speed-dial__main-fab--spin mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp")
	buttons.Initialize
	Return Me
End Sub

'set primary button
Sub SetPrimaryIcon(priIcon As String) As MDLSpeedDial
	Dim i As ReactElement = banreact.i($"${ID}-primary"$).SetLabel(priIcon)
	i.AddClass("material-icons mdl-speed-dial_main-fab-icon mdl-speed-dial_main-fab-icon--primary")
	button.AddReactElement(i)
	Return Me
End Sub
	
'set secondary button
Sub SetSecondaryIcon(secIcon As String) As MDLSpeedDial
	Dim i As ReactElement = banreact.i($"${ID}-secondary"$).SetLabel(secIcon)
	i.AddClass("material-icons mdl-speed-dial_main-fab-icon mdl-speed-dial_main-fab-icon--secondary")
	button.AddReactElement(i)
	Return Me
End Sub

'add a button
Sub AddButton(btnID As String, btnHref As String, btnIcon As String, btnTooltip As String)
	Dim btnOpt As ReactElement = banreact.div(btnID)
	btnOpt.AddClass("mdl-speed-dial__option")
	btnOpt.AddReactElement(banreact.CreateElement("p",CreateMap("className":"mdl-speed-dial__tooltip"), btnTooltip))
	'
	Dim a As MDLAnchor
	a.Initialize(banreact, $"${btnID}-a"$).SetHref(btnHref).AddClass("mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab")
	a.SetIcon(btnIcon)
	'
	btnOpt.AddElement(a.Anchor)
	'
	buttons.Add(btnOpt)
End Sub

'set at the bottom right
Sub SetBottomRight(b As Boolean) As MDLSpeedDial
	SpeedInt.AddClass("mdl-speed-dial--bottom-fixed")
	SpeedInt.RemoveClass(Array("mdl-speed-dial--header-edge"))
	bOnBottom = True
	Return Me
End Sub

'set on header
Sub SetHeaderRight(b As Boolean) As MDLSpeedDial
	SpeedInt.AddClass("mdl-speed-dial--header-edge")
	SpeedInt.RemoveClass(Array("mdl-speed-dial--bottom-fixed"))
	bOnBottom = False
	Return Me
End Sub

'show tooltip on hover
Sub SetTooltipsOnHover(b As Boolean) As MDLSpeedDial
	SpeedInt.AddClass("mdl-speed-dial__tooltip--hidden")
	Return Me
End Sub

'set rotate on spin
Sub SetRotateOnHover(b As Boolean) As MDLSpeedDial
	SpeedInt.AddClass("mdl-speed-dial__main-fab--spin")
	Return Me
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLSpeedDial
	SpeedInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'on click event
Sub SetOnClick(module As Object, methodName As String) As MDLSpeedDial
	SpeedInt.SetOnClick(module, methodName)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLSpeedDial
	SpeedInt.AddClass(cls)
	Return Me
End Sub

'set type
Sub SetType(t As Object) As MDLSpeedDial
	SpeedInt.SetType(t)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLSpeedDial
	SpeedInt.SetProps(m)
	Return Me
End Sub


'disable the button
Sub SetDisabled(b As Boolean) As MDLSpeedDial
	SpeedInt.SetDisabled(b)
	Return Me
End Sub

'set hidden
Sub SetHidden(b As Boolean) As MDLSpeedDial
	SpeedInt.SetHidden(b)
	Return Me
End Sub

'get the button
Sub SpeedDial As ReactElement
	'build options
	Dim optTot As Int = buttons.size - 1
	Dim optCnt As Int
	For optCnt = optTot To 0 Step - 1 
		Dim btn As ReactElement = buttons.Get(optCnt)
		sdOptions.AddElement(btn)
	Next
	If bOnBottom Then
		'add options
		SpeedInt.AddReactElement(sdOptions)
		'add button
		SpeedInt.AddReactElement(button)
	Else
		SpeedInt.AddReactElement(button)
		SpeedInt.AddReactElement(sdOptions)
	End If
	Return SpeedInt
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(SpeedDial)
End Sub
