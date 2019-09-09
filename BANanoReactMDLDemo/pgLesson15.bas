B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
#IgnoreWarnings:12, 9
Sub Process_Globals
	Private BANano As BANano  'ignore
	Private BR As BANanoReact
	Private lay As MDLLayout
	Private snack As MDLSnackBar
	Private dp As MDLDatePicker
	Private tp As MDLTimePicker
	Private dtp As MDLDateTimePicker
	Private dd As MDLDropDown
End Sub

Sub Show
	'initialize banano react
	Dim app As ReactElement = BR.Initialize
	'create a layout
	lay.Initialize(BR, "lay1")
	'lay.Drawer.SetOnClick(Me, "drawer_click")
	'lay.Header.SetOnClick(Me, "header_click")
	'
	'*** HEADER ***
	'fixed header
	lay.SetFixedHeader(True)
	'lay.Header.SetWaterFall(True)
	lay.Header.SetNavLargeScreensOnly(True)
	'set the header title
	lay.Header.SetTitle("BANanoReactMDL")
	
	'add a spacer so that everything is on the right
	lay.Header.SetSpacer(True)
	'add some links
	lay.Header.AddLink("lnk1","#","","Link 1")
	lay.Header.AddLink("lnk2","#","","Link 2")
	lay.Header.AddLink("lnk3","#","","Link 3")
	lay.Header.SetNavigation(True)
	
	'add a search input control
	'lay.Header.SetSearch("search")
	'add a menu button icon
	'lay.Header.SetButtonMenu("hdrMenu")
	'add menu and link it to the button icon
	'Dim hdrMenu As MDLMenu
	'hdrMenu.Initialize(BR, "hdrMenuChild")
	'specify the element id to link to
	'hdrMenu.SetFor("hdrMenu")
	'indicate the location of the menu relative to the button
	'hdrMenu.SetBottomRight(True)
	'add menu items
	'hdrMenu.AddMenuItem("hdrAbout", "About",False,False)
	'hdrMenu.AddMenuItem("hdrContact", "Contact", False, False)
	'hdrMenu.AddMenuItem("hdrLegal", "Legal Information", False, False)
	'add menu to the header
	'lay.Header.SetMenu(hdrMenu)
	'
	'**** SECOND ROW
	'lay.Header.BottomRow.SetSpacer(True)
	'lay.Header.BottomRow.AddLink("aboutx","#","","About")
	'lay.Header.BottomRow.AddLink("homex","#","","Home")
	'lay.Header.BottomRow.SetNavigation(True)
	
	'**** TABS ON HEADER ****
	'lay.SetFixedTabs(True)
	'lay.Header.AddTab("tab1", "Tab 1", BR.CreateElement("div",Null,"This is my first tab!"))
	'lay.Header.AddTab("tab2", "Tab 2", Null)
	'lay.Header.AddTab("tab3", "Tab 3", Null)
	'lay.Header.AddTab("tab4", "Tab 4", Null)
	'lay.Header.AddTab("tab5", "Tab 5", Null)
	'lay.Header.AddTab("tab6", "Tab 6", BR.CreateElement("div",Null,"This is my sixth tab!"))
	
	
	'**** DRAWER ****
	'fixed drawer
	lay.SetFixedDrawer(True)
	lay.Drawer.SetTitle("Stranger Things")
	'lay.Drawer.AddClass("mdl-color--blue-grey-900 mdl-color-text--blue-grey-50")
	'lay.Drawer.AddClass("mdl-color--grey-100 mdl-color-text--grey-600")
	lay.Drawer.SetProfile("./assets/mike.jpg","Anele Mbanga")
	lay.Drawer.ProfileMenu.AddMenuItem("","Send Email",False,False)
	
	'drawer navigation
	'lay.Drawer.Nav.AddClass("mdl-color--blue-grey-800")
	lay.Drawer.AddLink("badges","#","home","Badges")
	lay.Drawer.AddLink("buttons","#","inbox","Buttons")
	lay.Drawer.AddLink("cards","#","delete","Cards")
	lay.Drawer.AddLink("chips","#","report","Chips")
	lay.Drawer.AddLink("grid2","#","people","Grid")
	lay.Drawer.AddLink("typography","#","people","Typography")
	lay.Drawer.AddLink("lists","#","flag","Lists")
	lay.Drawer.AddLink("loading","#","local_offer","Loading")
	lay.Drawer.AddLink("menus","#","shopping_cart","Menus")
	lay.Drawer.AddLink("sliders","#","people","Sliders")
	lay.Drawer.AddLink("snackbar","#","people","Snackbar")
	lay.Drawer.AddLink("toggles","#","people","Toggles")
	lay.Drawer.AddLink("tabs","#","people","Tabs")
	lay.Drawer.AddLink("tables","#","people","Tables")
	lay.Drawer.AddLink("textfields","#","people","Text Fields")
	lay.Drawer.AddLink("tooltips","#","people","Tooltips")
	
	lay.Drawer.AddSpacer(True)
	lay.Drawer.AddLink1("","#","help_outline","Help",True)
	'ensure drawer is added
	lay.Drawer.SetNavigation(True)
	
	'**** MAIN
	'lay.Content.AddClass("mdl-color--grey-100")
	'add a grid
	Dim grid As MDLGrid
	grid.Initialize(BR, "grid").SetStyle(CreateMap("width":"100%"))
	lay.Page.AddElement(grid.Grid)
	
	'**** FOOTER ****
	'DoFooter
	
	app.AddElement(lay.Layout)
	'
	app.Render("app")
	
	'
	Dim div As ReactElement = BR.div("")
	div.AddElement(BR.CreateElement("h1",CreateMap(),"Welcome to MDL"))
	div.Render("grid")
	'
	'add events after the body is rendered
	'
	'*** IMPORTANT
	MDL.upgrade
	
	'BR.OnItemClick("#lay1-drawer-nav", Me, "drawer_click")
	lay.Drawer.OnItemClick(Me, "drawer_click")
	lay.Header.OnItemClick(Me, "header_click")
	
	'DoTexts
End Sub

Sub header_click(e As BANanoEvent)
	Dim selID As String = lay.GetDrawerItemID(e)
	Log(selID)
End Sub

Sub DoLists
	Dim div As ReactElement = BR.div("mylists")
	
	Dim ml As MDLList
	ml.Initialize(BR, "ul", "mylist").SetWidth("650px")
	
	Dim li As MDLListItem
	li.Initialize(BR, "li1")
	li.PrimaryContent.SetLabel("Esona Mbanga")
	li.SecondaryContent.SetInfo("Actors")
	ml.AddListItem(li)
	'
	Dim li2 As MDLListItem
	li2.Initialize(BR, "li2")
	li2.PrimaryContent.SetIcon("person").SetLabel("Bang & Olufsen")
	ml.AddListItem(li2)
	
	Dim li3 As MDLListItem
	li3.Initialize(BR, "li3")
	li3.PrimaryContent.SetAvatar("person").SetLabel("Bang & Olufsen")
	ml.AddListItem(li3)
	'
	Dim li4 As MDLListItem
	li4.Initialize(BR, "li4")
	li4.PrimaryContent.SetAvatar("person").SetLabel("Bob Odinkrik")
	li4.PrimaryContent.SetTextBody($"Bob Odinkrik played the role of Saul in Breaking Bad. Due to public fondness for the character, Bob stars in his own Show now, called "Better Call Saul"$)
	li4.SecondaryContent.SetActionIcon("star")
	ml.AddListItem(li4)
	'
	Dim li5 As MDLListItem
	li5.Initialize(BR, "li5")
	li5.PrimaryContent.SetAvatar("person").SetLabel("Mashy Radio")
	li5.SecondaryContent.SetRadio("option1", "settings", Me, "changethings")
	ml.AddListItem(li5)
	'
	Dim li6 As MDLListItem
	li6.Initialize(BR, "li6")
	li6.PrimaryContent.SetAvatar("person").SetLabel("Mashy CheckBox")
	li6.SecondaryContent.SetCheckBox("chk1", "checkit", Me, "changethings")
	ml.AddListItem(li6)
	'
	Dim li7 As MDLListItem
	li7.Initialize(BR, "li7")
	li7.PrimaryContent.SetAvatar("person").SetLabel("Mashy Switch")
	li7.SecondaryContent.SetSwitch("swt1", "swt1", Me, "changethings")
	ml.AddListItem(li7)
	'
	div.AddElement(ml.List)
	div.Render("grid")
	MDL.upgrade
End Sub

Sub DoFooter
	lay.Footer.SetMegaFooter(True)
	Dim mfdds1 As MDLMegaFooterDDS
	mfdds1.Initialize(BR, "mfdds1").SetTitle("Features")
	mfdds1.AddLink("About","#","")
	mfdds1.AddLink("Terms","#","")
	mfdds1.AddLink("Partners","#","")
	mfdds1.AddLink("Updates","#","")
	'
	lay.Footer.AddMegaFooterDDS(mfdds1)
	'
	Dim mfdds2 As MDLMegaFooterDDS
	mfdds2.Initialize(BR, "mfdds2").SetTitle("Details")
	mfdds2.AddLink("Specs","#","")
	mfdds2.AddLink("Tools","#","")
	mfdds2.AddLink("Resources","#","")
	
	lay.Footer.AddMegaFooterDDS(mfdds2)
	'
	Dim mfdds3 As MDLMegaFooterDDS
	mfdds3.Initialize(BR, "mfdds3").SetTitle("Technology")
	mfdds3.Initialize(BR, "mfdds2").SetTitle("Details")
	mfdds3.AddLink("How it works","#","")
	mfdds3.AddLink("Patterns","#","")
	mfdds3.AddLink("Usage","#","")
	mfdds3.AddLink("Products","#","")
	mfdds3.AddLink("Contracts","#","")
	
	
	lay.Footer.AddMegaFooterDDS(mfdds3)
	 
	Dim mfdds4 As MDLMegaFooterDDS
	mfdds4.Initialize(BR, "mfdds4").SetTitle("FAQ")
	mfdds4.AddLink("Questions","#","")
	mfdds4.AddLink("Answers","#","")
	mfdds4.AddLink("Contact Us","#","")
	lay.Footer.AddMegaFooterDDS(mfdds4)
	
	'
	Dim mfbs1 As MDLMegaFooterSection
	mfbs1.Initialize(BR, "mfbs1").SetLogo("BANanoReactMDL").SetBottomSection(True)
	mfbs1.AddLink("Help","#","")
	mfbs1.AddLink("Privacy & Terms","#","")
	lay.Footer.AddMegaFooterSection(mfbs1)
End Sub


Sub drawer_Click(e As BANanoEvent)
	Dim selID As String = lay.GetDrawerItemID(e)
	Select Case selID
	Case "badges"
		Badges_Show
	Case "buttons"
		Buttons_Show
	Case "cards"
		Cards
	Case "chips"
		Chips
	Case "loading"
		Loading
	Case "tooltips"
		Tooltips
	Case "sliders"
		Sliders
	Case "toggles"
		Toggles
	Case "menus"
		DoMenus
	Case "snackbar"
		DoSnackBar
	Case "tables"
		DoTable
	Case "textfields"
		DoTexts
	Case "grid2"
		DoLayouts
	Case "grid1"
		DoCardsInGrid
	Case "lists"
		DoLists
	Case "tabs"
		DoTabs
	Case "typography"
		DoTypography		
	End Select
End Sub

Sub DoTypography
	Dim mdiv As ReactElement = BR.div("mytypo")
	'
	Dim div4 As MDLItem
	div4.Initialize(BR, "div4").SetLabel("Display 4").SetDisplay(4)
	'
	Dim div3 As MDLItem
	div3.Initialize(BR, "div3").SetLabel("Display 3").SetDisplay(3)
	'
	Dim div2 As MDLItem
	div2.Initialize(BR, "div2").SetLabel("Display 2").SetDisplay(2)
	'
	Dim div1 As MDLItem
	div1.Initialize(BR, "div1").SetLabel("Display 1").SetDisplay(1)
	'
	Dim hl As MDLItem
	hl.Initialize(BR, "hl").SetHeadline(True).SetLabel("Headline")
	'
	Dim tit As MDLItem
	tit.Initialize(BR, "tit").SetTitle(True).SetLabel("Title")
	
	mdiv.AddElements(Array(div4.Item,BR.br(True),div3.Item,BR.br(True),div2.Item,BR.br(True),div1.Item,BR.br(True),hl.item,BR.br(True),tit.item))
	
	Dim sh As MDLItem
	sh.Initialize(BR, "sh").SetLabel("Sub Head").SetSubHead(True)
	'
	Dim cap As MDLItem
	cap.Initialize(BR, "cap").SetLabel("Caption").SetCaption(True)
	
	'
	mdiv.AddElements(Array(sh.item, BR.br(True), cap.Item))
	mdiv.Render("grid")
	MDL.upgrade
End Sub


Sub DoMenus
	Dim div As ReactElement = BR.div("mymenu")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Menu"))
	div.AddBR
	
	Dim menuButton As MDLButton
	menuButton.Initialize(BR, "menuButton").SetMenu(True)
	div.AddElement(menuButton.Button)
	div.AddBR
	'
	Dim myMenu As MDLMenu
	myMenu.Initialize(BR, "myMenu").SetFor("menuButton")
	myMenu.AddMenuItem("", "Some Action", False, False)
	myMenu.AddMenuItem("", "Another Action", False, True)
	myMenu.AddMenuItem("", "Disabled Action", True, False)
	myMenu.AddMenuItem("", "Yet Another Action", False, False)
	div.AddElement(myMenu.Menu)
	
	div.Render("grid")
	MDL.upgrade
	
End Sub

Sub DoTexts
	Dim div As ReactElement = BR.div("mytexts")
	
	div.AddElement(BR.CreateElement("p",CreateMap(),"Text"))
	div.AddBR
	'
	Dim fi As MDLFileInput
	fi.Initialize(BR, "fi1").SetLabel("Select File").SetName("fi1")
	div.AddReactElement(fi.FileInput)
	div.AddBR
	'
	dp.Initialize(BR, "dp1").SetLabel("Date Picker")
	dp.SetFormat("yyyy-mm-dd")
	dp.SetHeader(True)
	'dp.SetFooter(True)
	dp.SetModal(True)
	dp.SetLocaleSpanish(True)
	div.AddReactElement(dp.DatePicker)
	div.AddBR
'
	tp.Initialize(BR, "tp1").SetLabel("Time Picker")
	tp.SetLocaleSpanish(True)
	tp.SetFormat("HH:MM")
	div.AddReactElement(tp.TimePicker)
	div.AddBR
	'
	dtp.Initialize(BR, "dtp1").SetLabel("Date Time Picker")
	dtp.SetLocaleSpanish(True)
	dtp.SetFormat("yyyy-dd-mm HH:MM")
	div.AddReactElement(dtp.DateTimePicker)
	div.AddBR
	 
	dd.Initialize(BR, "dd").SetLabel("Drop Down")
	dd.AddItem("opt1", "Option 1")
	dd.AddItem("opt2", "Option 2")
	dd.AddItem("opt3", "Option 3")
	dd.AddItem("opt4", "Option 4")
	div.AddReactElement(dd.DropDown)
	div.AddBR
	 
	
'	Dim cbo As MDLComboBox
'	cbo.Initialize(BR, "cbo1")
'	cbo.SetLabel("Country")
'	cbo.SetName("country")
'	'cbo.SetFixedHeight(True)
'	cbo.SetSelected("FR")
'	cbo.AddItem("DEU", "Germany")
'	cbo.AddItem("BLR", "Belarus")
'	cbo.AddItem("RUS", "Russia")
'	cbo.AddItem("BR", "Brazil")
'	cbo.AddItem("ES", "Estonia")
'	cbo.AddItem("FI", "Finland")
'	cbo.AddItem("FR", "France")
'	cbo.AddItem("DE", "Germany")
'	cbo.AddItem("PL", "Poland")
'	div.AddReactElement(cbo.ComboBox)
'	div.AddBR
'	'
	

	Dim sf As MDLSelectField
	sf.Initialize(BR, "sf1")
	sf.SetLabel("Country")
	sf.SetName("country")
	sf.AddItem("", "")
	sf.AddItem("DEU", "Germany")
	sf.AddItem("BLR", "Belarus")
	sf.AddItem("RUS", "Russia")
	sf.AddItem("BR", "Brazil")
	sf.AddItem("ES", "Estonia")
	sf.AddItem("FI", "Finland")
	sf.AddItem("FR", "France")
	sf.AddItem("DE", "Germany")
	sf.AddItem("PL", "Poland")
	div.AddReactElement(sf.SelectField)
	div.AddBR
		
	'
	Dim txt As MDLText
	txt.Initialize(BR, "txt1").SetLabel("First Name").SetHint("Enter the first name!")
	div.AddElement(txt.Text)
	'
	div.AddBR
	'
	Dim txtnum As MDLText
	txtnum.Initialize(BR, "txtn1").SetLabel("Numeric").SetNumeric(True).SetErrorMessage("You have not entered a number!")
	div.AddElement(txtnum.Text)
	div.AddBR
	'
	Dim ta As MDLText
	ta.Initialize(BR, "ta").SetLabel("Text Area").SetTextArea(True).SetRows(5)
	div.AddElement(ta.Text)
	div.AddBR
	'
	Dim search As MDLSearch
	search.Initialize(BR, "search1").SetLabel("Enter your search string here...")
	div.AddElement(search.Search)
	div.AddBR
	div.Render("grid")
	MDL.upgrade
	MDL.upgrade
	' render the date picker
	dp.Render
	tp.Render 
	dtp.Render
	dd.render
End Sub

#if javascript
	function comboRefresh() {
        getmdlSelect.init(".getmdl-select");
    }
#End If

Sub ComboRefresh
	BANano.RunJavascriptMethod("comboRefresh",Null)
End Sub

Sub showSnack1(e As BANanoEvent)
	snack.Toast("This is my toast!")
End Sub


Sub showSnack(e As BANanoEvent)
	snack.Show("This is my snack!", 2000, "Hide")
End Sub


Sub DoSnackBar
	Dim div As ReactElement = BR.div("mysnack")
			
	snack.Initialize(BR, "snack1")
	div.AddElement(snack.SnackBar)
	div.AddBR
	'
	Dim btnx As MDLButton
	btnx.Initialize(BR, "btnShow").SetLabel("Show SnackBar").SetRaised(True).SetOnClick(Me,"showSnack")
	div.AddElement(btnx.Button)
	div.AddBR
	
	Dim btnx1 As MDLButton
	btnx1.Initialize(BR, "btnShow").SetLabel("Show Toast").SetOnClick(Me,"showSnack1").SetRaised(True)
	div.AddElement(btnx1.Button)
	div.AddBR
	div.Render("grid")	
	MDL.upgrade
End Sub

Sub Tooltips
	Dim div As ReactElement = BR.div("tts")
	
	div.AddElement(BR.CreateElement("p",CreateMap(),"Tooltips"))
	'<!-- Simple Tooltip -->
	Dim divt As MDLItem
	divt.Initialize(BR, "div").SetMaterialIcons("add").setid("tt1")
	'
	Dim print As MDLItem
	print.Initialize(BR, "div").SetMaterialIcons("print").setid("print1")
	'
	Dim tt1 As MDLTooltip
	tt1.Initialize(BR, "").SetFor("tt1").SetLabel("Follow")
	'
	Dim tt2 As MDLTooltip
	tt2.Initialize(BR, "").SetFor("print1").SetLabel("Print").SetLarge(True).SetRight(True)
	'
	div.AddElements(Array(divt.item, print.Item, tt1.Tooltip, tt2.tooltip))
	div.Render("grid")
	MDL.upgrade
End Sub

Sub ChangeThings(e As BANanoEvent)
	Log(e)
End Sub


Sub Toggles
	Dim div As ReactElement = BR.div("mytog")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Toggles"))
	'checkbox
	Dim chkBox As MDLCheckBox
	chkBox.Initialize(BR, "chk1").SetLabel("My CheckBox").SetOnChange(Me, "changethings")
	div.AddElement(chkBox.CheckBox)
	div.AddBR
	div.addbr
	'radios
	
	Dim rad1 As MDLRadio
	rad1.Initialize(BR, "rad1").SetLabel("First").SetName("myoptions").SetOnChange(Me, "changethings")
	div.AddElement(rad1.Radio)
	div.AddBR
	div.addbr
	'
	Dim rad2 As MDLRadio
	rad2.Initialize(BR, "rad2").SetLabel("Second").SetName("myoptions").SetOnChange(Me, "changethings")
	div.AddElement(rad2.Radio)
	div.AddBR
	div.AddBR
	
	'icon toggle
	Dim it1 As MDLIconToggle
	it1.Initialize(BR, "it1").SetIcon("format_bold").SetOnChange(Me, "changethings")
	div.AddElement(it1.IconToggle)
	div.addbr
	div.addbr
	'
	Dim it2 As MDLIconToggle
	it2.Initialize(BR, "it2").SetIcon("format_italic").SetOnChange(Me, "changethings")
	div.AddElement(it2.IconToggle)
	div.AddBR
	div.AddBR
	
	'switch
	Dim sw1 As MDLSwitch
	sw1.Initialize(BR, "sw1").SetOnChange(Me, "changethings")
	div.AddElement(sw1.Switch)
	div.AddBR
	div.AddBR
	
	Dim sw2 As MDLSwitch
	sw2.Initialize(BR, "sw2").SetOnChange(Me, "changethings")
	div.AddElement(sw2.Switch)
	div.AddBR
	div.AddBR
	div.Render("grid")
	MDL.upgrade
End Sub

Sub Sliders
	Dim div As ReactElement = BR.div("myslider")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Sliders"))
	'
	Dim sl1 As MDLSlider
	sl1.Initialize(BR, "sl1").SetMin("0").SetMax("100").SetDefaultValue("0").SetOnChange(Me, "changethings")
	 	
	Dim sl2 As MDLSlider
	sl2.Initialize(BR, "sl2").SetMin("0").SetMax("100").SetDefaultValue("25").SetStep("5").SetWidth("300px").SetOnChange(Me, "changethings")
	 
	div.AddElements(Array(sl1.Slider, sl2.slider))
	div.AddHR
	div.Render("grid")
	MDL.upgrade
End Sub


Sub Loading
	Dim div As ReactElement = BR.div("myload")
	div.AddElement(BR.CreateElement("p",CreateMap("id":"load"),"Loading"))
	'
	Dim prg As MDLProgress
	prg.Initialize(BR, "prg1")
	'
	Dim indet As MDLProgress
	indet.Initialize(BR, "indet1").SetIndeterminate(True)
	'
	div.AddElement(prg.Progress)
	div.AddBR
	
	div.AddElement(indet.Progress)
	div.AddBR
		'
	Dim spn1 As MDLSpinner
	spn1.Initialize(BR, "spn1").SetIsActive(True)
	'
	Dim spn2 As MDLSpinner
	spn2.Initialize(BR, "spn2").SetSingleColor(True).SetIsActive(True)
	'
	div.AddElement(spn1.Spinner)
	div.addbr
	div.AddElement(spn2.Spinner)
	div.addbr
	div.Render("grid")
	MDL.upgrade
End Sub

Sub Chips
	Dim div As ReactElement = BR.div("mychips")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Chips"))
	'
	Dim chp As MDLChip
	chp.Initialize(BR, "chp1", False).SetLabel("Basic Chip")
	
	div.AddElement(chp.Chip)
	div.AddBR
	'
	'delete chip
	Dim dchip As MDLChip
	dchip.Initialize(BR, "dchip", False).SetLabel("Delete Chip").SetDeletable(True)
	
	div.AddElement(dchip.Chip)
	div.AddBR
	'
	Dim bchip As MDLChip
	bchip.Initialize(BR, "bchip", True).SetLabel("Button Chip")
	
	div.AddElement(bchip.Chip)
	div.AddBR
	'
	'contact chip
	Dim contact_chip As MDLChip
	BR.AddTheme("teal", "mdl-color--teal mdl-color-text--white")
	contact_chip.Initialize(BR, "contact_chip", False).SetLabel("Anele Mashy Mbanga").SetPrefix("A", "teal")
	
	div.AddElement(contact_chip.Chip)
	div.AddBR
	'
	'deletable contact chip
	Dim dcontact_chip As MDLChip
	dcontact_chip.Initialize(BR, "dcontact_chip", False).SetLabel("Deletable Contact Chip").SetDeletable(True).SetImage("./assets/mike.jpg")
	
	div.AddElement(dcontact_chip.Chip)
	div.AddBR
	div.Render("grid")
	MDL.upgrade
End Sub

Sub Cards
	Dim div As ReactElement = BR.div("mycards")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Cards"))
	'
	Dim card As MDLCard
	card.Initialize(BR, "card1")
	card.SetWidth("512px")
	card.SetShadow("4")
	card.SetActionsBorder(True)
	card.SetMediaImage("./assets/image005.jpg")
	card.SetTitle(2, "Mashy's Card")
	card.AddSupportText("This text might describe the photo and provide further information, such as where and when it was taken.")
	'
	Dim act1 As MDLAnchor
	act1.Initialize(BR, "act1").SetLabel("Action 1").SetButton(True)
	card.AddAction(act1.Anchor)
	div.AddElement(card.Card)
	div.AddBR
	'
	Dim card2 As MDLCard
	card2.Initialize(BR, "card2")
	card2.SetWidth("512px")
	card2.SetShadow("6")
	card2.SetActionsBorder(True)
	card2.SetTitleCoverImage("./assets/image005.jpg")
	card2.SetTitleHeight("176px")
	card2.SetTitle(2, "Mashy's Card")
	card2.SetTitleColor("#fff")
	card2.AddSupportText("This text might describe the photo and provide further information, such as where and when it was taken.")
	card2.SetMenuIcon("share")
	card2.SetMenuColor("#fff")
	'
	Dim act1 As MDLAnchor
	act1.Initialize(BR, "act1").SetLabel("Action 1").SetButton(True)
	card2.AddAction(act1.Anchor)
	'
	div.AddElement(card2.Card)
	div.AddBR
	'
	Dim card3 As MDLCard
	card3.Initialize(BR, "card3")
	card3.SetWidth("320px")
	card3.SetHeight("320px")
	card3.SetShadow("2")
	card3.SetTitleExpand(True)
	card3.SetActionsBorder(True)
	card3.SetMediaImage("./assets/image005.jpg")
	card3.SetTitle(2, "Update").SetTitleExpand(True)
	card3.AddSupportText("This text might describe the photo and provide further information, such as where and when it was taken.")
	card3.SetMenuIcon("share")
	'
	Dim act2 As MDLAnchor
	act2.Initialize(BR, "act2").SetLabel("View Details").SetButton(True)
	card3.AddAction(act2.Anchor)
	div.AddElement(card3.Card)
	div.AddBR
	
	'**** image card
	Dim card4 As MDLCard
	card4.Initialize(BR, "card4")
	card4.SetWidth("256px")
	card4.SetHeight("256px")
	card4.SetTitleExpand(True)
	card4.SetShadow(2)
	card4.SetBackgroundImage("./assets/typhon_pytheas.jpg")
	card4.Actions.SetStyles(CreateMap("height": "52px", "padding": "16px", "background": "rgba(0, 0, 0, 0.2)"))
	'
	Dim span As MDLItem
	span.Initialize(BR, "span").SetStyle(CreateMap("color": "#fff", "fontSize": "14px", "fontWeight": "500")).SetLabel("image.jpg")
	card4.AddAction(span.Item)
	div.AddElement(card4.Card)
	'
	div.AddBR
	'
	'event card
	Dim card5 As MDLCard
	card5.Initialize(BR, "card5")
	card5.SetWidth("256px")
	card5.SetHeight("256px")
	card5.SetBackgroundColor("#3E4EB8")
	card5.SetColor("white")
	card5.Actions.SetStyles(CreateMap("borderColor": "rgba(255, 255, 255, 0.2)"))
	card5.title.SetStyles(CreateMap("alignItems": "flex-start"))
	card5.SetTitleExpand(True)
	card5.SetShadow(2)
	card5.SetTitle(4,"Featured event:{BR}May 24, 2016{BR}7-11pm")
	card5.Actions.SetStyles(CreateMap("display": "flex","boxSizing":"border-box","alignItems": "center","color":"white"))
	'
	Dim act5 As MDLAnchor
	act5.Initialize(BR, "act5").SetLabel("Add to Calendar").SetButton(True).SetColor("white")
	card5.AddAction(act5.Anchor)
	card5.SetActionsBorder(True)
	card5.AddActionSpacer(True)
	card5.AddActionIcon("", "event")
	div.AddElement(card5.Card)
	'
	div.Render("grid")
	MDL.upgrade
End Sub

Sub Badges_Show
	Dim div As ReactElement = BR.div("mybadges")
	div.AddElement(BR.CreateElement("p",CreateMap(),"Badges"))
	
	Dim badge1 As MDLItem
	badge1.Initialize(BR, "div").SetMaterialIcons("account_box").SetBadge(1).SetBadgeOverlap(True)
	'
	div.AddElement(badge1.item)
	div.AddBR
	'
	div.AddElement(BR.CreateElement("span",CreateMap("data-badge":"4","className":"mdl-badge"),"Inbox"))
	div.AddBR
	'
	div.AddElement(BR.CreateElement("a", CreateMap("data-badge":"10","href":"#","className":"mdl-badge"),"This link has a badge."))
	div.AddBR
	'
	div.AddElement(BR.CreateElement("a", CreateMap("data-badge":"5","href":"#","className":"mdl-badge mdl-badge--no-background"),"This link has a badge."))
	div.Render("grid")
	MDL.upgrade
End Sub

Sub Buttons_Show
	Dim div As ReactElement = BR.div("mybuttons")
	
	Dim btn1 As MDLButton
	btn1.Initialize(BR, "btn1").SetLabel("Button1").SetAccent(True).SetRaised(True)
	'
	Dim fab As MDLButton
	fab.Initialize(BR, "fab1").SetColored(True).SetFab(True).SetIcon("add")
	'
	div.AddElement(BR.CreateElement("p",CreateMap(),"Buttons"))
	div.AddBR
	
	div.AddElement(btn1.Button)
	div.AddBR
	div.AddElement(fab.Button)
	div.AddBR
	'
	Dim fab1 As MDLButton
	fab1.Initialize(BR, "fab2").SetFab(True).SetIcon("add").SetDisabled(True)
	div.AddElement(fab1.Button)
	div.AddBR
	'
	Dim btn2 As MDLButton
	btn2.Initialize(BR, "btn2").SetLabel("Raised").SetRaised(True).SetColored(True).SetIcon("mood")
	div.AddElement(btn2.Button)
	div.AddBR
	'
	Dim btn3 As MDLButton
	btn3.Initialize(BR, "btn3").SetLabel("Flat")
	div.AddElement(btn3.Button)
	div.AddBR
	'
	Dim btn4 As MDLButton
	btn4.Initialize(BR, "btn4").SetPrimary(True).SetFab(True).SetIcon("add")
	div.AddElement(btn4.Button)
	div.AddBR
	'
	Dim btn5 As MDLButton
	btn5.Initialize(BR, "btn5").SetButtonIcon(True).SetIcon("mood")
	div.AddElement(btn5.Button)
	div.AddBR
	'
	Dim btn6 As MDLButton
	btn6.Initialize(BR, "btn6").SetMiniFab(True).SetIcon("mood")
	div.AddElement(btn6.Button)
	div.AddBR
	'
	div.Render("grid")
	MDL.upgrade
End Sub


Sub DoTabs
	Dim div As ReactElement = BR.div("mytabs")
	'
	Dim a As ReactElement = BR.p("")
	a.AddElement(BR.CreateElement("b",CreateMap(),"The Beatles"))
	a.AddChild($" were a four-piece musical group from Liverpool, England.
	Formed in 1960, their career spanned just over a decade, yet they are widely
	regarded As the most influential band in history"$)
	'
	Dim a1 As ReactElement = BR.p("").AddChild($"Their songs are among the best-loved music of all time. It Is said that every
	minute of every day, a radio station somewhere Is playing a Beatles song."$)

'	
	'2.
	Dim m As ReactElement = BR.p("").AddChild("The Beatles' members were:")
	Dim ul As ReactElement = BR.ul("")
	ul.AddElement(BR.CreateElement("li", CreateMap(), "John Lennon (1940-1980)"))
	ul.AddElement(BR.CreateElement("li", CreateMap(), "Paul McCartney (1942-)"))
	ul.AddElement(BR.CreateElement("li", CreateMap(), "George Harrison (1943-2001)"))
	ul.AddElement(BR.CreateElement("li", CreateMap(), "Ringo Starr (1940-)"))
	
	'3
	Dim alb As ReactElement = BR.p("").AddChild("The Beatles' original UK LPs, in order of release:")
	Dim ol As ReactElement = BR.ol("")
	'
	Dim songs As List
	songs.Initialize
	songs.AddAll(Array("Please Please Me","With the Beatles", "A Hard Day's Night (1964)", "Beatles For Sale (1964)"))
	songs.AddAll(Array("Help! (1965)", "Rubber Soul (1965)", "Revolver (1966)", "Sgt. Pepper's Lonely Hearts Club Band (1967)"))
	songs.AddAll(Array($"The Beatles ("The White Album", 1968)"$, "Yellow Submarine (1969)", "Abbey Road (1969)", "Let It Be (1970)"))
	'
	For Each song As String In songs
		ol.AddElement(BR.CreateElement("li", CreateMap(), song))
	Next
	
	
	Dim tabs As MDLTabs
	tabs.Initialize(BR, "tabs1").SetActive("about")
	tabs.AddTab("about", "About the Beatles", Array(a, a1))
	tabs.AddTab("members", "Members", Array(m, ul))
	tabs.AddTab("albums", "Discography", Array(alb, ol))
	div.AddElement(tabs.Tabs)
	'
	div.Render("grid")
	MDL.upgrade
End Sub


Sub DoLayouts
	Dim div As ReactElement = BR.div("mylayouts")
	'add a row with 12 cells
	Dim grd1 As MDLGrid
	grd1.Initialize(BR, "gR1")
	grd1.SetBackgroundColor("gray")
	grd1.SetDeviceSize(12,0,0,0)
	grd1.SetColor("white")
	grd1.AddCells(12, 1 ,0, 0, 0)
	grd1.SetShadow(4)
	
	'
	Dim grd2 As MDLGrid
	grd2.Initialize(BR, "gR2")
	grd2.SetBackgroundColor("red")
	grd2.AddCells(3, 4, 0, 0, 0)
	'
	Dim grd3 As MDLGrid
	grd3.Initialize(BR, "gR3")
	grd3.SetBackgroundColor("orange")
	'6,4,2
	grd3.AddCells(1,6,0,0,0).AddCells(1,4,0,0,0).AddCells(1,2,0,0,0)
	'
	Dim grd4 As MDLGrid
	grd4.Initialize(BR, "gR4")
	grd4.SetBackgroundColor("blue")
	grd4.SetColor("white")
	grd4.AddCells(2,6,0,0,0)
	'
	div.AddElements(Array(grd1.Grid, grd2.Grid, grd3.Grid, grd4.grid))
	div.Render("grid")
	'
	Dim r As Int = 0
	For r = 1 To 12
		Dim rk As String = $"gr1c${r}"$
		BR.Render(BR.CreateElement("p",Null,r), rk)
	Next
	'
	For r = 1 To 3
		Dim rk As String = $"gr2c${r}"$
		BR.Render(BR.CreateElement("p",Null,r), rk)
	Next
	
	For r = 1 To 3
		Dim rk As String = $"gr3c${r}"$
		BR.Render(BR.CreateElement("p",Null,r), rk)
	Next
	'
	For r = 1 To 2
		Dim rk As String = $"gr4c${r}"$
		BR.Render(BR.CreateElement("p",Null,r), rk)
	Next
	MDL.upgrade
End Sub

Sub DoTable
	Dim div As ReactElement = BR.div("mytable")
	
	Dim tbl As MDLTable
	tbl.Initialize(BR, "table1")
	tbl.SetShadow(2)
	tbl.SetSelectable(True)
	tbl.AddColumn("mat", "Material", False, False)
	tbl.AddColumn("qty", "Quantity", True, False)
	tbl.AddColumn("price", "Price", True, False)
	'
	'add data
	Dim rec1 As Map = CreateMap("mat":"Acrylic (Transparent)","qty":25,"price":"$2.90")
	Dim rec2 As Map = CreateMap("mat":"Plywood (Birch)","qty":50,"price":"$1.25")
	Dim rec3 As Map = CreateMap("mat":"Laminate (Gold on Blue)","qty":10,"price":"$2.35")
	
	Dim data As List
	data.Initialize
	data.AddAll(Array(rec1, rec2, rec3))
	tbl.SetData(data)
	'
	div.AddElement(tbl.Table)
	div.Render("grid")
	MDL.upgrade
End Sub

Sub DoCardsInGrid
	Dim div As ReactElement = BR.div("mycardsingrid")
	
	'add a grid
	Dim grid As MDLGrid
	grid.Initialize(BR, "gridx")
	'add a row
	Dim r1 As MDLColumn
	r1.Initialize(BR, "cR1")
	r1.AddClass("mdl-color--white")
	r1.SetShadow(2)
	r1.SetDeviceSize(12, 0, 0, 0)
	r1.SetGrid(True)
	'
	Dim r2 As MDLColumn
	r2.Initialize(BR, "cR2")
	r2.AddClass("mdl-color--white")
	r2.SetShadow(2)
	r2.SetDeviceSize(8, 0, 0, 0)
	r2.SetGrid(True)
	'
	Dim r3 As MDLColumn
	r3.Initialize(BR, "cR3")
	r3.SetNoSpacing(True)
	r3.SetDeviceSize(4, 0, 8, 0)
	'
	Dim card1 As MDLCard
	card1.Initialize(BR, "ccard1")
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
	
	div.AddElement(grid.Grid)
	'
	div.Render("grid")
	MDL.upgrade
End Sub