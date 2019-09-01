B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private ColumnInt As ReactElement
	Private BanReact As BANanoReact
End Sub

'initialize the column
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLColumn
	ID = sid
	ColumnInt = BR.div(sid).AddClass("mdl-cell")
	BanReact = BR
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Column)
End Sub


'stretch
Sub SetStretch(b As Boolean) As MDLColumn
	ColumnInt.AddClass("mdl-cell--stretch")
	Return Me
End Sub

'align top
Sub SetAlignTop(b As Boolean) As MDLColumn
	ColumnInt.AddClass("mdl-cell--top")
	Return Me
End Sub

'align middle
Sub SetAlignMiddle(b As Boolean) As MDLColumn
	ColumnInt.AddClass("mdl-cell--middle")
	Return Me
End Sub

'align bottom
Sub SetAlignBottom(b As Boolean) As MDLColumn
	ColumnInt.addclass("mdl-cell--bottom")
	Return Me
End Sub

'set color
Sub SetColor(c As Object) As MDLColumn
	ColumnInt.SetColor(c)
	Return Me
End Sub

'set background
Sub SetBackgroundColor(bc As Object) As MDLColumn
	ColumnInt.SetBackgroundColor(bc)
	Return Me
End Sub

'set Style
Sub SetStyle(m As Map) As MDLColumn
	ColumnInt.SetStyles(m)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLColumn
	ColumnInt.SetProps(m)
	Return Me
End Sub


'set no spacing
Sub SetNoSpacing(b As Boolean) As MDLColumn
	ColumnInt.AddClass("mdl-grid--no-spacing")
	Return Me
End Sub


'add elements
Sub AddElements(cols As List) As MDLColumn
	For Each col As ReactElement In cols
		ColumnInt.AddElement(col)
	Next
	Return Me
End Sub

'set grid
Sub SetGrid(b As Boolean) As MDLColumn
	ColumnInt.addclass("mdl-grid")
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLColumn
	ColumnInt.AddClass(clsList)
	Return Me
End Sub

'set the shadow, 2,3,4,6,8,16
Sub SetShadow(b As String) As MDLColumn
	ColumnInt.AddClass($"mdl-shadow--${b}dp"$)
	Return Me
End Sub

'set offsets of the card per device
Sub SetDeviceOffset(phone As Int, tablet As Int, desktop As Int) As MDLColumn
	'offsets
	If phone > 0 Then ColumnInt.AddClass($"mdl-cell--${phone}-offset-phone"$)
	If tablet > 0 Then ColumnInt.AddClass($"mdl-cell--${tablet}-offset-tablet"$)
	If desktop > 0 Then ColumnInt.AddClass($"mdl-cell--${desktop}-offset-desktop"$)
	Return Me
End Sub

'set sizes of the card per device
Sub SetDeviceSize(all As Int, phone As Int, tablet As Int, desktop As Int) As MDLColumn
	'size
	If all > 0 Then ColumnInt.AddClass($"mdl-cell--${all}-col"$)
	If phone > 0 Then ColumnInt.AddClass($"mdl-cell--${phone}-col-phone"$)
	If tablet > 0 Then ColumnInt.AddClass($"mdl-cell--${tablet}-col-tablet"$)
	If desktop > 0 Then ColumnInt.AddClass($"mdl-cell--${desktop}-col-desktop"$)
	Return Me
End Sub

'set the visibility for the card per device
Sub SetDeviceHidden(phone As Boolean, tablet As Boolean, desktop As Boolean) As MDLColumn
	'hide on devices
	ColumnInt.AddClassoncondition(phone, $"mdl-cell--hide-phone"$)
	ColumnInt.AddClassoncondition(tablet, $"mdl-cell--hide-tablet"$)
	ColumnInt.AddClassoncondition(desktop, $"mdl-cell--hide-desktop"$)
	Return Me
End Sub


'get the column
Sub Column As ReactElement
	Return ColumnInt
End Sub