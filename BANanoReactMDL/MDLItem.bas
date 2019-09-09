B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Private ItemInt As ReactElement
End Sub

'initialize item
Public Sub Initialize(BR As BANanoReact, stype As String) As MDLItem
	ItemInt.Initialize(BR, stype)
	Return Me
End Sub

'set large screens only
Sub SetLargeScreensOnly(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-layout--large-screen-only")
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Item)
End Sub

'set layout title
Sub SetLayoutTitle(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-layout-title")
	Return Me
End Sub

'small screens only
Sub SetSmallScreensOnly(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-layout--small-screen-only")
	Return Me
End Sub


'set sizes of the card per device
Sub SetDeviceSize(all As Int, phone As Int, tablet As Int, desktop As Int) As MDLItem
	'size
	If all > 0 Then ItemInt.AddClass($"mdl-cell--${all}-col"$)
	If phone > 0 Then ItemInt.AddClass($"mdl-cell--${phone}-col-phone"$)
	If tablet > 0 Then ItemInt.AddClass($"mdl-cell--${tablet}-col-tablet"$)
	If desktop > 0 Then ItemInt.AddClass($"mdl-cell--${desktop}-col-desktop"$)
	Return Me
End Sub


'set the visibility for the card per device
Sub SetDeviceHidden(phone As Boolean, tablet As Boolean, desktop As Boolean) As MDLItem
	'hide on devices
	ItemInt.AddClassoncondition(phone, $"mdl-cell--hide-phone"$)
	ItemInt.AddClassoncondition(tablet, $"mdl-cell--hide-tablet"$)
	ItemInt.AddClassoncondition(desktop, $"mdl-cell--hide-desktop"$)
	Return Me
End Sub


'add class
Sub AddClass(cls As String) As MDLItem
	ItemInt.AddClass(cls)
	Return Me
End Sub

'set id
Sub SetID(sid As String) As MDLItem
	ItemInt.SetID(sid)
	Return Me
End Sub

'set style
Sub SetStyle(m As Map) As MDLItem
	ItemInt.SetStyles(m)
	Return Me
End Sub

'set type
Sub SetType(t As Object) As MDLItem
	ItemInt.SetType(t)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLItem
	ItemInt.SetProps(m)
	Return Me
End Sub

'set display 4
Sub SetDisplay(size As Int) As MDLItem
	ItemInt.AddClass($"mdl-typography--display-${size}"$)
	Return Me
End Sub

'set text left
Sub SetTextLeft(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-left")
	Return Me
End Sub

'set text right
Sub SetTextRight(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-right")
	Return Me
End Sub

'set text center
Sub SetTextCenter(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-center")
	Return Me
End Sub

'set text justify
Sub SetTextJustify(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-justify")
	Return Me
End Sub

'set no wrap
Sub SetTextNoWrap(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-nowrap")
	Return Me
End Sub

'set subhead
Sub SetSubHead(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--subhead")
	Return Me
End Sub

'set text lowercase
Sub SetTextLowerCase(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-lowercase")
	Return Me
End Sub

'set text lowercase
Sub SetTextUpperCase(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-uppercase")
	Return Me
End Sub

'set text capitalize
Sub SetTextCapitalize(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--text-capitalize")
	Return Me
End Sub

'set text red
Sub SetTextRed(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-color-text--red")
	Return Me
End Sub



'set subhead
Sub SetCaption(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--caption")
	Return Me
End Sub


'set headline
Sub SetHeadline(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--headline")
	Return Me
End Sub

'set title
Sub SetTitle(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-typography--title")
	Return Me
End Sub


'set spacer
Sub SetSpacer(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-layout-spacer")
	Return Me
End Sub

'set material icons
Sub SetMaterialIcons(icn As String) As MDLItem
	ItemInt.AddClass("material-icons")
	ItemInt.SetLabel(icn)
	Return Me
End Sub

'set badge
Sub SetBadge(badge As Object) As MDLItem
	ItemInt.AddClass("mdl-badge")
	ItemInt.SetProp("data-badge", badge)
	Return Me
End Sub

'set badge overlap
Sub SetBadgeOverlap(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-badge--overlap")
	Return Me
End Sub

'set badge no background
Sub SetBadgeNoBackground(b As Boolean) As MDLItem
	ItemInt.AddClass("mdl-badge--no-background")
	Return Me
End Sub

'set text
Sub SetLabel(txt As String) As MDLItem
	ItemInt.SetLabel(txt)
	Return Me
End Sub

'get item
Sub Item As ReactElement
	Return ItemInt
End Sub