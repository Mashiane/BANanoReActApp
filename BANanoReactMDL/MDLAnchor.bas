B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Public AnchorInt As ReactElement
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLAnchor
	AnchorInt = BR.a(sid)
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Anchor)
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As MDLAnchor
	AnchorInt.AddClassOnCondition(b, cls)
	Return Me
End Sub

'add another element
Sub AddElement(el As ReactElement) As MDLAnchor
	AnchorInt.AddElement(el)
	Return Me
End Sub

'add class
Sub AddClass(cls As String) As MDLAnchor
	AnchorInt.AddClass(cls)
	Return Me
End Sub

'set mailto
Sub SetMailTo(email As String) As MDLAnchor
	SetHref($"mailto:${email}"$)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLAnchor
	AnchorInt.SetProps(m)
	Return Me
End Sub

'set href
Sub SetHref(h As Object) As MDLAnchor
	AnchorInt.SetHREF(h)
	Return Me
End Sub

'set target
Sub SetTarget(t As String) As MDLAnchor   'ignore
	AnchorInt.SetTarget(t)
	Return Me
End Sub

'set target blank
Sub SetTargetBlank(b As Boolean) As MDLAnchor   'ignore
	AnchorInt.SetTarget("_blank")
	Return Me
End Sub

'set target self
Sub SetTargetSelf(b As Boolean) As MDLAnchor    'ignore
	AnchorInt.SetTarget("_self")
	Return Me
End Sub
	
'set target parent	
Sub SetTargetParent(b As Boolean) As MDLAnchor   'ignore
	AnchorInt.SetTarget("_parent")
	Return Me
End Sub

'set target top	
Sub SetTargetTop(b As Boolean) As MDLAnchor    'ignore
	AnchorInt.SetTarget("_top")
	Return Me
End Sub

'set color
Sub SetColor(c As Object) As MDLAnchor
	SetStyle(CreateMap("color":c))
	Return Me
End Sub

'set Style
Sub SetStyle(m As Map) As MDLAnchor
	AnchorInt.SetStyles(m)
	Return Me
End Sub

'set badge
Sub SetBadge(badge As Object) As MDLAnchor
	AnchorInt.AddClass("mdl-badge")
	AnchorInt.SetProp("data-badge", badge)
	Return Me
End Sub

'set badge overlap
Sub SetBadgeOverlap(b As Boolean) As MDLAnchor
	AnchorInt.AddClass("mdl-badge--overlap")
	Return Me
End Sub

Sub RemoveClass(classList As List) As MDLAnchor
	AnchorInt.RemoveClass(classList)
	Return Me
End Sub

'set badge no background
Sub SetBadgeNoBackground(b As Boolean) As MDLAnchor
	AnchorInt.AddClass("mdl-badge--no-background")
	Return Me
End Sub

'set text
Sub SetLabel(txt As String) As MDLAnchor
	AnchorInt.SetLabel(txt)
	Return Me
End Sub

'set button
Sub SetButton(b As Boolean) As MDLAnchor
	AnchorInt.RemoveProp("href")
	AnchorInt.AddClasses(Array("mdl-button", "mdl-button--colored", "mdl-js-button", "mdl-js-ripple-effect"))
	Return Me
End Sub

'get the anchor
Sub Anchor As ReactElement
	Return AnchorInt
End Sub