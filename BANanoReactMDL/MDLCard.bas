B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private CardInt As ReactElement
	Private banreact As BANanoReact
	Public Title As ReactElement
	Public Media As ReactElement
	Public SupportText As ReactElement
	Public Actions As ReactElement
	Public Image As MDLImage
	Public Menu As ReactElement
	Private TitleContent As Boolean
	Private MediaContent As Boolean
	Private SupportTextContent As Boolean
	Private ActionsContent As Boolean
	Private MenuContent As Boolean
End Sub

#if css
.mdl-card__actions {
  height: 64px;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  box-sizing: border-box;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center;
}

#End If


'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Card)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLCard
	CardInt.AddClass(clsList)
	Return Me
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLCard
	ID = sid
	banreact = BR
	CardInt = BR.div(sid)
	CardInt.AddClass("mdl-card")
	
	'
	Title = BR.div(sid & "-title")
	Title.addclass("mdl-card__title")
	'
	Media = BR.div(sid & "-media")
	Media.AddClass("mdl-card__media")
	'
	SupportText = BR.div(sid & "-text")
	SupportText.AddClass("mdl-card__supporting-text")
	'
	Actions = BR.div(sid & "-actions")
	Actions.AddClass("mdl-card__actions")
	'
	Image.Initialize(BR, sid & "-image")
	'
	Menu = BR.div(sid & "-menu")
	Menu.AddClass("mdl-card__menu")
	'
	TitleContent = False
	MediaContent = False
	SupportTextContent = False
	ActionsContent = False
	MenuContent = False
	Return Me
End Sub

'set sizes of the card per device
Sub SetDeviceSize(all As Int, phone As Int, tablet As Int, desktop As Int) As MDLCard
	'size
	CardInt.AddClass("mdl-cell")
	If all > 0 Then CardInt.AddClass($"mdl-cell--${all}-col"$)
	If phone > 0 Then CardInt.AddClass($"mdl-cell--${phone}-col-phone"$)
	If tablet > 0 Then CardInt.AddClass($"mdl-cell--${tablet}-col-tablet"$)
	If desktop > 0 Then CardInt.AddClass($"mdl-cell--${desktop}-col-desktop"$)
	Return Me
End Sub

'set the visibility for the card per device
Sub SetDeviceHidden(phone As Boolean, tablet As Boolean, desktop As Boolean) As MDLCard
	'hide on devices
	CardInt.AddClassoncondition(phone, $"mdl-cell--hide-phone"$)
	CardInt.AddClassoncondition(tablet, $"mdl-cell--hide-tablet"$)
	CardInt.AddClassoncondition(desktop, $"mdl-cell--hide-desktop"$)
	Return Me
End Sub

'set title expand
Sub SetTitleExpand(b As Boolean) As MDLCard
	Title.AddClass("mdl-card--expand")
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'set the menu icon
Sub SetMenuIcon(micon As String) As MDLCard
	Dim btn As MDLButton
	btn.Initialize(banreact, ID & "-menu")
	btn.SetButtonIcon(True)
	btn.SetIcon(micon)
	Menu.AddElement(btn.button)
	Menu.SetHidden(False)
	MenuContent = True
	Return Me 
End Sub

'set title color
Sub SetTitleColor(c As Object) As MDLCard
	Title.SetStyle("color", c)
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'set color
Sub SetColor(c As Object) As MDLCard
	CardInt.SetStyle("color", c)
	Return Me
End Sub

'set actions color
Sub SetActionsColor(c As Object) As MDLCard
	Actions.SetStyle("color", c)
	Actions.SetHidden(False)
	ActionsContent = True
	Return Me
End Sub


'set menu color
Sub SetMenuColor(c As Object) As MDLCard
	Menu.SetStyle("color", c)
	Menu.SetHidden(False)
	MenuContent = True
	Return Me
End Sub

'set title height
Sub SetTitleHeight(hh As Object) As MDLCard
	Title.SetStyle("height", hh)
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'set title background
Sub SetTitleCoverImage(i As Object) As MDLCard
	Title.SetBackgroundimage(i)
	Title.SetBackgroundRepeat("no-repeat")
	Title.SetBackgroundSize("cover")
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'set width of the card
Sub SetWidth(w As Object) As MDLCard
	CardInt.SetWidth(w)
	Return Me
End Sub

'set height of the card
Sub SetHeight(w As Object) As MDLCard
	CardInt.SetHeight(w)
	Return Me
End Sub


'set image
Sub SetBackgroundImage(url As String) As MDLCard
	CardInt.SetBackgroundimage(url)
	CardInt.SetBackgroundRepeat("no-repeat")
	CardInt.SetBackgroundSize("cover")
	Return Me
End Sub


'set backgroundColor
Sub SetBackgroundColor(rpt As Object) As MDLCard
	CardInt.SetStyle("backgroundColor", rpt)
	Return Me
End Sub

'set media image
Sub SetMediaImage(url As String) As MDLCard
	Image.SetSrc(url)
	Image.SetWidth("100%")
	Media.SetHidden(False)
	MediaContent = True
	Return Me
End Sub

'set the shadow, 2,3,4,6,8,16
Sub SetShadow(b As String) As MDLCard
	CardInt.AddClass($"mdl-shadow--${b}dp"$)
	Return Me
End Sub

'set border to title
Sub SetTitleBorder(b As Boolean) As MDLCard
	Title.AddClass("mdl-card--border")
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'set border to media
Sub SetMediaBorder(b As Boolean) As MDLCard
	Media.AddClass("mdl-card--border")
	Media.SetHidden(False)
	MediaContent = True
	Return Me
End Sub

'set border to supported text
Sub SetSupportedTextBorder(b As Boolean) As MDLCard
	SupportText.AddClass("mdl-card--border")
	SupportText.SetHidden(False)
	SupportTextContent = True
	Return Me
End Sub

'set border to actions text
Sub SetActionsBorder(b As Boolean) As MDLCard
	SupportText.AddClass("mdl-card--border")
	SupportText.SetHidden(False)
	SupportTextContent = True
	Return Me
End Sub

'add supporting text class
Sub SetSupportTextClass(cls As String) As MDLCard
	SupportText.AddClass(cls)
	SupportText.SetHidden(False)
	SupportTextContent = True
	Return Me
End Sub

'add support text
Sub AddSupportText(st As String) As MDLCard
	SupportText.AddChild(st)
	SupportText.SetHidden(False)
	SupportTextContent = True
	Return Me
End Sub


'add support text
Sub SetSupportText(st As String) As MDLCard
	SupportText.AddChild(st)
	SupportText.SetHidden(False)
	SupportTextContent = True
	Return Me
End Sub

'add an action
Sub AddAction(act As ReactElement) As MDLCard
	Actions.AddElement(act)
	Actions.SetHidden(False)
	ActionsContent = True
	Return Me
End Sub

'add action button
Sub AddAction1(btnID As String, btnHref As String, btnCaption As String) As MDLCard
	''<a href="#" class="mdl-button mdl-js-button mdl-js-ripple-effect">Read More</a>
	Dim act1 As MDLAnchor
	act1.Initialize(banreact, btnID).SetButton(True).SetLabel(btnCaption).SetHref(btnHref)
	act1.RemoveClass(Array("mdl-button--colored"))
	AddAction(act1.Anchor)
	ActionsContent = True
	Return Me
End Sub

'add actions spacer
Sub AddActionSpacer(b As Boolean) As MDLCard
	AddAction(banreact.CreateElement("div", Null,"").AddClass("mdl-layout-spacer"))
	ActionsContent = True
	Return Me
End Sub

'add an icon
Sub AddActionIcon(iconID As String, iconName As String) As MDLCard
	AddAction(banreact.CreateElement("i",CreateMap("id":iconID,"role":"presentation"),iconName).AddClass("material-icons"))
	ActionsContent = True
	Return Me
End Sub

'return the card
Sub Card As ReactElement
	Media.AddElement(Image.Image)
	If TitleContent Then CardInt.AddElement(Title)
	If MediaContent Then CardInt.AddElement(Media)
	If SupportTextContent Then CardInt.AddElement(SupportText)
	If ActionsContent Then CardInt.AddElement(Actions)
	If MenuContent Then CardInt.AddElement(Menu)
	Return CardInt
End Sub

'add a title
Sub SetTitle(tSize As Int, t As Object) As MDLCard
	Dim h As ReactElement
	h.Initialize(banreact, $"h${tSize}"$).SetID(ID & "-title-text")
	h.AddChild(t)
	h.AddClass("mdl-card__title-text")
	Title.AddElement(h)
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub


'add a class to the title
Sub SetTitleClass(cls As String) As MDLCard
	Title.AddClass(cls)
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'add a sub title
Sub SetSubTitle(tSize As Int, t As Object) As MDLCard
	Dim h As ReactElement
	h.Initialize(banreact, $"h${tSize}"$)
	h.AddChild(t)
	h.AddClass("mdl-card__subtitle-text")
	Title.AddElement(h)
	Title.SetHidden(False)
	TitleContent = True
	Return Me
End Sub

'add content to the supporting text
Sub SupportTextAddElement(el As ReactElement) As MDLCard
	SupportText.AddElement(el)
	Return Me
End Sub