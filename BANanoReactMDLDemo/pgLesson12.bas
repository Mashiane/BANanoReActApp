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
	'
	'*** HEADER ***
	'fixed header
	lay.SetFixedHeader(True)
	'set the theme of the header
	lay.Header.AddClass("mdl-color--grey-100 mdl-color-text--grey-600")
	'set the header title
	lay.Header.TopRow.SetTitle("Home")
	'add a spacer so that everything is on the right
	lay.Header.TopRow.SetSpacer(True)
	'add a search input control
	lay.Header.TopRow.SetSearch("search")
	'add a menu button icon
	lay.Header.TopRow.SetButtonMenu("hdrMenu")
	'add menu and link it to the button icon
	Dim hdrMenu As MDLMenu
	hdrMenu.Initialize(BR, "hdrMenuChild")
	'specify the element id to link to
	hdrMenu.SetFor("hdrMenu")
	'indicate the location of the menu relative to the button
	hdrMenu.SetBottomRight(True)
	'add menu items
	hdrMenu.AddMenuItem("hdrAbout", "About",False,False)
	hdrMenu.AddMenuItem("hdrContact", "Contact", False, False)
	hdrMenu.AddMenuItem("hdrLegal", "Legal Information", False, False)
	'add menu to the header
	lay.Header.TopRow.SetMenu(hdrMenu)
	
	'**** DRAWER ****
	'fixed drawer
	lay.SetFixedDrawer(True)
	'lay.Drawer.AddClass("mdl-color--blue-grey-900 mdl-color-text--blue-grey-50")
	lay.Drawer.AddClass("mdl-color--grey-100 mdl-color-text--grey-600")
	lay.Drawer.SetProfile("./assets/mike.jpg","Anele Mbanga")
	lay.Drawer.ProfileMenu.AddMenuItem("","Send Email",False,False)
	
	'drawer navigation
	'lay.Drawer.Nav.AddClass("mdl-color--blue-grey-800")
	lay.Drawer.AddLink("","#","home","Home")
	lay.Drawer.AddLink("","#","inbox","Inbox")
	lay.Drawer.AddLink("","#","delete","Trash")
	lay.Drawer.AddLink("","#","report","Spam")
	lay.Drawer.AddLink("","#","forum","Forums")
	lay.Drawer.AddLink("","#","flag","Updates")
	lay.Drawer.AddLink("","#","local_offer","Promos")
	lay.Drawer.AddLink("","#","shopping_cart","Purchases")
	lay.Drawer.AddLink("","#","people","Social")
	lay.Drawer.AddSpacer(True)
	lay.Drawer.AddLink1("","#","help_outline","Help",True)
	'ensure drawer is added
	lay.Drawer.SetNavigation(True)
	
	'**** MAIN
	lay.Page.AddClass("mdl-color--grey-100")
	'add a grid
	Dim grid As MDLGrid
	grid.Initialize(BR, "grid")
	'add a row
	Dim r1 As MDLColumn
	r1.Initialize(BR, "R1")
	r1.AddClass("mdl-color--white")
	r1.SetShadow(2)
	r1.SetDeviceSize(12, 0, 0, 0)
	r1.SetGrid(True)
	'
	Dim r2 As MDLColumn
	r2.Initialize(BR, "R2")
	r2.AddClass("mdl-color--white")
	r2.SetShadow(2)
	r2.SetDeviceSize(8, 0, 0, 0)
	r2.SetGrid(True)
	'
	Dim r3 As MDLColumn
	r3.Initialize(BR, "R3")
	r3.SetNoSpacing(True)
	r3.SetDeviceSize(4, 0, 8, 0)
	'
	Dim card1 As MDLCard
	card1.Initialize(BR, "card1")
	card1.SetShadow(2)
	card1.SetDeviceSize(4, 0, 4, 12)
	'
	card1.SetTitle(2, "Updates")
	card1.SetTitleExpand(True)
	card1.SetTitleClass("mdl-color--teal-300")
	card1.Title.SetStyles(CreateMap("color": "white", "fontSize": "24px", "fontWeight": "400"))
	card1.Title.SetStyles(CreateMap("minHeight": "200px"))
	card1.Title.SetBackgroundImage("./assets/dog.png")
	card1.Title.SetBackgroundPosition("90% 100%")
	card1.Title.SetBackgroundRepeat("no-repeat")
	
	'
	card1.SetSupportText("Non dolore elit adipisicing ea reprehenderit consectetur culpa.")
	card1.SetSupportTextClass("mdl-color-text--grey-600")
	'
	card1.SetActionsBorder(True)
	'
	card1.AddAction1("btnReadMore", "#", "Read More")
	'separator
	Dim sep As MDLItem
	sep.Initialize(BR, "div").SetDeviceSize(1, 0, 0, 0).SetStyle(CreateMap("height": "32px"))
	'another card
	Dim card2 As MDLCard
	card2.Initialize(BR, "card2")
	card2.AddClass("mdl-color--deep-purple-500")
	card2.SetShadow(2)
	card2.SetDeviceSize(4, 0, 3, 12)
	card2.Title.SetStyles(CreateMap("color": "white", "fontSize": "24px", "fontWeight": "400"))
	'
	card2.SetSupportTextClass("mdl-color-text--blue-grey-50")
	card2.SupportTextAddElement(BR.CreateElement("h3",CreateMap("style.fontSize": "1em", "style.margin": "0"),"View Options"))
	'
	Dim ul As MDLList
	ul.Initialize(BR, "ul", "").SetSimple(True).SetMargin("0").SetPadding("0").SetListTypeNone(True)
	'
	ul.AddCheckBox("", "Clicks per Object")
	ul.AddCheckBox("", "Views per Object")
	ul.AddCheckBox("", "Objects Selected")
	ul.AddCheckBox("", "Objects Viewed")
	'
	'add ul to supporttext
	card2.SupportTextAddElement(ul.List)
	'
	card2.SetActionsBorder(True) 
	'
	card2.AddAction1("btnChange", "#", "Change Location").AddActionSpacer(True).AddActionIcon("", "location_on")
	'
	'add card to the row 
	r3.AddElements(Array(card1.card, sep.item, card2.card)) 
	'add row to grid
	grid.AddColumns(Array(r1, r2, r3))
	
	lay.Page.AddElement(grid.Grid)
	app.AddElement(lay.Layout)
	app.Render("app")
	'**** IMPORTANT
	MDL.Upgrade
End Sub