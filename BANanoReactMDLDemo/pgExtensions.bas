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
	Private BR As BANanoReact
End Sub

Sub Show
	'initialize banano react
	Dim app As ReactElement = BR.Initialize
	
	'create a layout
	Dim lay As MDLLayout
	lay.Initialize(BR, "lay1")
	'set the header title
	lay.Header.SetTitle("Extensions")
	'
	Dim sd As MDLSpeedDial
	sd.Initialize(BR, "sd1")
	'show on bottom right
	sd.SetBottomRight(True)
	'show tooltips on hover 
	sd.SetTooltipsOnHover(True)
	'rotate button on hover
	sd.SetRotateOnHover(True)
	'set the primary icon
	sd.SetPrimaryIcon("add")
	'set secondary icon
	sd.SetSecondaryIcon("create")
	'add child buttons
	sd.AddButton("folder1", "#", "folder", "Option 3")
	sd.AddButton("attach1", "#", "attach_file", "Option 2")
	sd.AddButton("email1", "#", "email", "Option 1")
	'
	'lay.Header.AddSpeedDial(sd)
	
	' add speed dial to the page content
	lay.Page.AddReactElement(sd.SpeedDial)
	
	'
	Dim fi As MDLFileInput
	fi.Initialize(BR, "fi1").SetLabel("Select File").SetMultiple(True).SetName("fi1")
	lay.Page.AddReactElement(fi.FileInput)
	lay.Page.AddBR
	lay.Page.AddBR
	'
'	Dim avatar As MDLAvatar
'	avatar.Initialize(BR, "avatar1").SetValue("./assets/mike.jpg").SetName("avatar1")
'	lay.Page.AddReactElement(avatar.Avatar)
'	 

	'**** MAIN
	'add a grid
	'Dim grid As MDLGrid
	'grid.Initialize(BR, "grid").SetDeviceSize(12,0,0,0)
	
	'lay.Page.AddElement(grid.Grid)
	'
	app.AddElement(lay.Layout)
	'
	app.Render("app")
	'**** IMPORTANT
	MDL.Upgrade
		
End Sub