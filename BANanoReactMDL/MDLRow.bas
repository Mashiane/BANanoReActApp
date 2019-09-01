B4J=true
Group=Default Group\MDL
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private GridInt As ReactElement
	Private BanReact As BANanoReact
End Sub

'initialize the button
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLRow
	ID = sid
	GridInt = BR.div(sid)
	GridInt.AddClass("mdl-grid")
	BanReact = BR
	Return Me
End Sub

'add a column
Sub AddColumns(cols As List) As MDLRow
	For Each col As MDLColumn In cols
		GridInt.AddReactElement(col.Column)
	Next
End Sub

'add a class
Sub AddClass(clsList As String) As MDLRow
	GridInt.AddClass(clsList)
	Return Me
End Sub

'set no spacing
Sub SetNoSpacing(b As Boolean) As MDLRow
	GridInt.AddClass("mdl-grid--no-spacing")
	Return Me
End Sub


'set the shadow, 2,3,4,6,8,16
Sub SetShadow(b As String) As MDLRow
	GridInt.AddClass($"mdl-shadow--${b}dp"$)
	Return Me
End Sub

'set sizes of the card per device
Sub SetDeviceSize(all As Int, phone As Int, tablet As Int, desktop As Int) As MDLRow
	'size
	If all > 0 Then GridInt.AddClass($"mdl-cell--${all}-col"$)
	If phone > 0 Then GridInt.AddClass($"mdl-cell--${phone}-col-phone"$)
	If tablet > 0 Then GridInt.AddClass($"mdl-cell--${tablet}-col-tablet"$)
	If desktop > 0 Then GridInt.AddClass($"mdl-cell--${desktop}-col-desktop"$)
	Return Me
End Sub

'set the visibility for the card per device
Sub SetDeviceHidden(phone As Boolean, tablet As Boolean, desktop As Boolean) As MDLRow
	'hide on devices
	GridInt.AddClassoncondition(phone, $"mdl-cell--hide-phone"$)
	GridInt.AddClassoncondition(tablet, $"mdl-cell--hide-tablet"$)
	GridInt.AddClassoncondition(desktop, $"mdl-cell--hide-desktop"$)
	Return Me
End Sub


'add a column specifying sizes
Sub AddCells(numCells As Int, sizeAll As Int, sizePhone As Int, sizeTablet As Int, sizeDesktop As Int, offsetPhone As Int, offsetTablet As Int, offsetDesktop As Int,hideOnPhone As Boolean, hideOnTablet As Boolean, hideOnDesktop As Boolean) As MDLRow
	Dim cntRows As Int = 0
	For cntRows = 1 To numCells
		Dim lastKey As String = $"${ID}C${cntRows}"$
		'
		Dim cell As ReactElement = BanReact.div(lastKey)
		cell.AddClass("mdl-cell")
		'size
		cell.AddClass($"mdl-cell--${sizeAll}-col"$)
		cell.AddClass($"mdl-cell--${sizePhone}-col-phone"$)
		cell.AddClass($"mdl-cell--${sizeTablet}-col-tablet"$)
		cell.AddClass($"mdl-cell--${sizeDesktop}-col-desktop"$)
		'offsets
		cell.AddClass($"mdl-cell--${offsetPhone}-offset-phone"$)
		cell.AddClass($"mdl-cell--${offsetTablet}-offset-tablet"$)
		cell.AddClass($"mdl-cell--${offsetDesktop}-offset-desktop"$)
		'hide on devices
		cell.AddClassoncondition(hideOnPhone, $"mdl-cell--hide-phone"$)
		cell.AddClassoncondition(hideOnTablet, $"mdl-cell--hide-tablet"$)
		cell.AddClassoncondition(hideOnDesktop, $"mdl-cell--hide-desktop"$)
		GridInt.AddReactElement(cell)
	Next
	Return Me
End Sub

'return the grid
Sub Grid As ReactElement
	Return GridInt
End Sub