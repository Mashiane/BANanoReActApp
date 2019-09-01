B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private GridInt As ReactElement
	Private BanReact As BANanoReact
	Private Columns As List
	Private BANano As BANano  'ignore
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLGrid
	ID = sid.tolowercase
	GridInt = BR.div(ID).AddClass("mdl-grid")
	BanReact = BR
	Columns.Initialize 
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Grid)
End Sub


'stretch
Sub SetStretch(b As Boolean) As MDLGrid
	GridInt.AddClass("mdl-cell--stretch")
	Return Me
End Sub

'align top
Sub SetAlignTop(b As Boolean) As MDLGrid
	GridInt.AddClass("mdl-cell--top")
	Return Me
End Sub

'align middle
Sub SetAlignMiddle(b As Boolean) As MDLGrid
	GridInt.AddClass("mdl-cell--middle")
	Return Me
End Sub

'align bottom
Sub SetAlignBottom(b As Boolean) As MDLGrid
	GridInt.addclass("mdl-cell--bottom")
	Return Me
End Sub

'set cell
Sub SetCell(b As Boolean) As MDLGrid
	GridInt.AddClass("mdl-cell")
	Return Me
End Sub

'set color
Sub SetColor(c As Object) As MDLGrid
	GridInt.SetColor(c)
	Return Me
End Sub

'set background
Sub SetBackgroundColor(bc As Object) As MDLGrid
	GridInt.SetBackgroundColor(bc)
	Return Me
End Sub

'set Style
Sub SetStyle(m As Map) As MDLGrid
	GridInt.SetStyles(m)
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLGrid
	GridInt.SetProps(m)
	Return Me
End Sub

'add a column
Sub AddColumns(cols As List) As MDLGrid
	For Each Col As MDLColumn In cols
		GridInt.AddElement(Col.Column)
	Next
	Return Me
End Sub

'add a class
Sub AddClass(clsList As String) As MDLGrid
	GridInt.AddClass(clsList)
	Return Me
End Sub

'set no spacing
Sub SetNoSpacing(b As Boolean) As MDLGrid
	GridInt.AddClass("mdl-grid--no-spacing")
	Return Me
End Sub


'set the shadow, 2,3,4,6,8,16
Sub SetShadow(b As String) As MDLGrid
	GridInt.AddClass($"mdl-shadow--${b}dp"$)
	Return Me
End Sub

'set sizes of the card per device
Sub SetDeviceSize(all As Int, phone As Int, tablet As Int, desktop As Int) As MDLGrid
	'size
	If all > 0 Then GridInt.AddClass($"mdl-cell--${all}-col"$)
	If phone > 0 Then GridInt.AddClass($"mdl-cell--${phone}-col-phone"$)
	If tablet > 0 Then GridInt.AddClass($"mdl-cell--${tablet}-col-tablet"$)
	If desktop > 0 Then GridInt.AddClass($"mdl-cell--${desktop}-col-desktop"$)
	Return Me
End Sub

'set the visibility for the card per device
Sub SetDeviceHidden(phone As Boolean, tablet As Boolean, desktop As Boolean) As MDLGrid
	'hide on devices
	GridInt.AddClassoncondition(phone, $"mdl-cell--hide-phone"$)
	GridInt.AddClassoncondition(tablet, $"mdl-cell--hide-tablet"$)
	GridInt.AddClassoncondition(desktop, $"mdl-cell--hide-desktop"$)
	Return Me
End Sub

Sub AddCells(numcells As Int, SizeAll As Int, SizePhone As Int, SizeTablet As Int, SizeDesktop As Int) As MDLGrid
	Dim cntRows As Int = 0
	For cntRows = 1 To numcells
		Dim numCell As Int = BANano.parseInt(Columns.Size) + 1
		Dim lastKey As String = $"${ID}C${numCell}"$
		lastKey = lastKey.ToLowerCase
		
		'
		Dim cell As MDLColumn
		cell.Initialize(BanReact, lastKey)
		cell.SetDeviceSize(SizeAll, SizePhone, SizeTablet, SizeDesktop)
		'
		Columns.Add(cell.Column)
	Next
	Return Me
End Sub


Sub AddCellsOS(numcells As Int, OffsetPhone As Int, OffSetTablet As Int, OffSetDesktop As Int, SizeAll As Int, SizePhone As Int, SizeTablet As Int, SizeDesktop As Int) As MDLGrid
	Dim cntRows As Int = 0
	For cntRows = 1 To numcells
		Dim numCell As Int = BANano.parseInt(Columns.Size) + 1
		Dim lastKey As String = $"${ID}C${numCell}"$
		lastKey = lastKey.ToLowerCase
		
		'
		Dim cell As MDLColumn
		cell.Initialize(BanReact, lastKey)
		cell.SetDeviceSize(SizeAll, SizePhone, SizeTablet, SizeDesktop)
		cell.SetDeviceOffset(OffsetPhone, OffSetTablet, OffSetDesktop)
		'
		Columns.Add(cell.Column)
	Next
	Return Me
End Sub


'add a column specifying sizes
Sub AddCellsOSV(numCells As Int, offsetPhone As Int, offsetTablet As Int, offsetDesktop As Int, _
	sizeAll As Int, sizePhone As Int, sizeTablet As Int, sizeDesktop As Int, _
	hideOnPhone As Boolean, hideOnTablet As Boolean, hideOnDesktop As Boolean) As MDLGrid
	Dim cntRows As Int = 0
	For cntRows = 1 To numCells
		Dim numCell As Int = BANano.parseInt(Columns.Size) + 1
		Dim lastKey As String = $"${ID}C${numCell}"$
		lastKey = lastKey.ToLowerCase
		'
		Dim cell As MDLColumn
		cell.Initialize(BanReact, lastKey)
		cell.SetDeviceSize(sizeAll, sizePhone, sizeTablet, sizeDesktop)
		cell.SetDeviceHidden(hideOnPhone, hideOnTablet, hideOnDesktop)
		cell.SetDeviceOffset(offsetPhone, offsetTablet, offsetDesktop)
		'
		Columns.Add(cell.Column)
	Next
	Return Me
End Sub

'return the grid
Sub Grid As ReactElement
	For Each re As ReactElement In Columns
		GridInt.AddElement(re)
	Next
	Return GridInt
End Sub