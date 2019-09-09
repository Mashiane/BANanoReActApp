B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private DrawerInt As ReactElement
	Private Nav As MDLNav
	Private banreact As BANanoReact
	Public Header As ReactElement
	Private hasLogo As Boolean
	Private DropDown As ReactElement
	Public ProfileMenu As MDLMenu
	Public HasContent As Boolean
	Private BANano As BANano   'ignore
	Public isFixed As Boolean
End Sub

#if javascript
	function closeDrawer() {
  		var d = document.querySelector('.mdl-layout');
		d.MaterialLayout.toggleDrawer();
		var obfuscator = document.querySelector('.mdl-layout__obfuscator');
  		if (obfuscator.classList.contains('is-visible')) {
    		obfuscator.classList.remove('is-visible');
 		}
	}
#End If


#if css
/* END iOS Safari specific workaround */
.demo-drawer .mdl-menu .mdl-menu__item {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
}
.demo-drawer-header {
  box-sizing: border-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column;
  -webkit-justify-content: flex-end;
      -ms-flex-pack: end;
          justify-content: flex-end;
  padding: 16px;
  height: 151px;
}
.demo-avatar-dropdown {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  position: relative;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
  width: 100%;
}
#End If

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Drawer)
End Sub


'set hidden
Sub SetHidden(b As Boolean) As MDLDrawer
	DrawerInt.SetHidden(b)
	HasContent = True
	Return Me
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLDrawer
	ID = sid
	banreact = BR
	DrawerInt = BR.div(sid)
	DrawerInt.AddClass("mdl-layout__drawer").AddClass("demo-drawer")
	Nav.Initialize(BR,$"${sid}-nav"$)
	Nav.IsDrawer = True
	Header = BR.header($"${sid}-header"$).AddClass("demo-drawer-header")
	hasLogo = False
	DropDown = BR.div($"${sid}-dd"$).AddClass("demo-avatar-dropdown")
	ProfileMenu.Initialize(BR, $"${sid}-usermenu"$).SetBottomRight(True).SetFor("myaccount")
	HasContent = False
	DrawerInt.SetOnClick(Me, "CloseDrawer")
	Return Me
End Sub

'add event to existing element
Sub OnItemClick(module As Object, methodName As String)
	banreact.OnItemClick($"#${ID}-nav"$, module, methodName)
End Sub

'close the drawer
Sub CloseDrawer
	BANano.RunJavascriptMethod("closeDrawer", Null)
End Sub

Sub SetOnClick(module As Object, methodName As String)
	DrawerInt.SetOnClick(module, methodName)
End Sub

'sub add a link for navigation
Sub AddLink(linkID As String, linkHref As String, linkIcon As String, linkLabel As String) As MDLDrawer
	Nav.AddLink(linkID, linkHref, linkIcon, linkLabel)
	HasContent = True
	Return Me
End Sub

'set logo image and url
Sub SetProfile(imgURL As String, imgLabel As String) As MDLDrawer
	Dim img As MDLImage
	img.Initialize(banreact,$"${ID}-logo"$)
	img.SetSrc(imgURL)
	img.SetStyle(CreateMap("width": "48px", "height": "48px", "border-radius": "24px"))
	Header.AddElement(img.Image)
	hasLogo = True
	SetProfileLabel(imgLabel)
	HasContent = True
	Return Me 
End Sub

'set profile email
private Sub SetProfileLabel(label As String) As MDLDrawer
	Dim it As ReactElement = banreact.span("").SetLabel(label)
	DropDown.AddElement(it)
	'
	Dim sp As ReactElement = banreact.div("")
	sp.AddClass("mdl-layout-spacer")
	DropDown.AddElement(sp)
	'
	Dim btn As MDLButton
	btn.Initialize(banreact, "myaccount").SetButtonIcon(True).SetIcon("arrow_drop_down")
	DropDown.AddElement(btn.Button)
	HasContent = True
	Return Me
End Sub

'sub add a link, label visibility
Sub AddLink1(linkID As String, linkHref As String, linkIcon As String, linkLabel As String, labelHidden As Boolean)
	Nav.AddLink1(linkID, linkHref, linkIcon, linkLabel, labelHidden)
	HasContent = True
End Sub

'add a layout spacer for navigation
Sub AddSpacer(b As Boolean) As MDLDrawer
	Nav.AddSpacer(True)
	HasContent = True
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLDrawer
	DrawerInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'add a search
Sub SetSearch(searchID As String) As MDLDrawer
	If hasLogo Then
		DropDown.AddElement(ProfileMenu.Menu)
		Header.AddElement(DropDown)
		DrawerInt.AddElement(Header)
		hasLogo = False
	End If
	Dim navSearch As MDLSearch
	navSearch.Initialize(banreact, searchID)
	DrawerInt.AddElement(navSearch.Search)
	HasContent = True
	Return Me
End Sub


'set style
Sub SetStyle(m As Map) As MDLDrawer
	DrawerInt.SetStyles(m)
	HasContent = True
	Return Me
End Sub

'set the title of the page drawer
Sub SetTitle(t As Object) As MDLDrawer
	Dim tt As ReactElement = banreact.span($"${ID}-title"$)
	tt.SetLabel(t)
	tt.AddClass("mdl-layout-title")
	DrawerInt.AddElement(tt)
	HasContent = True
	Return Me
End Sub

'return the nav
Sub Drawer As ReactElement
	If isFixed = False Then
		
	End If
	Return DrawerInt
End Sub

'add navigation
Sub SetNavigation(b As Boolean) As MDLDrawer
	If hasLogo Then
		DropDown.AddElement(ProfileMenu.Menu)
		Header.AddElement(DropDown)
		DrawerInt.AddElement(Header)
		hasLogo = False
		HasContent = True
	End If
	If Nav.HasContent Then 
		DrawerInt.AddElement(Nav.Nav)
		HasContent = True
	End If
	Return Me
End Sub