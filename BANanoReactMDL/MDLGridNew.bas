B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
'Create a grid
'the default bottom margin on the materializecss.com website is 20.
'for columns, one change change the left and right padding as the top & bottom are zero
Sub Class_Globals
	Public BANano As BANano	'ignore
	'this will hold all our rows
	Private Rows As Map
	'this will hold temporal columns
	Private Columns As Map
	'this will hold each row definition
	'hold our last row
	Private LastRow As Int
	'padding def
	Private padClass As Map = CreateMap("pt":"paddingTop:","pb":"paddingBottom:","pl":"paddingLeft:","pr":"paddingRight:")
	'margin class
	Private marClass As Map = CreateMap("mt":"marginTop:","mb":"marginBottom:","ml":"marginLeft:","mr":"marginRight:")
	'temporal holder
	Private RC As Map
	Private rowClass As String = "mdl-grid"
	Private cellClass As String = "mdl-cell"
	'show the RC on the column text
	Public ShowID As Boolean
	Private parentID As String
	Private Components As Map
	Private rowClasses As Map
	Private columnClasses As Map
	Public rowPadding As Map
	Public rowMargins As Map
	Private columnStyles As Map
	Private rowStyles As Map
End Sub


'right align column
Sub RightAlignColumn(row As Int, col As Int) As MDLGridNew
	SetColumnClass(row,col, "right-align")
	Return Me
End Sub

'right align column
Sub CenterAlignColumn(row As Int, col As Int) As MDLGridNew
	SetColumnClass(row,col, "center-align")
	Return Me
End Sub


private Sub CStr(o As Object) As String
	Return "" & o
End Sub

'add rows specifying top and bottom margin and visibility   
Sub AddRowsMV(Rows2Add As Int, marginTopPx As Int, marginBottomPx As Int, rVisibility As String, themeName As String , className As String) As MDLGridNew
	AddRowsMPV(Rows2Add, marginTopPx , marginBottomPx , 0,0,0,0,0,0, themeName , rVisibility, className )
	Return Me
End Sub

'add rows specifying all margins and visivility
Sub AddRowsMV2(Rows2Add As Int, marginTopPx As Int, marginBottomPx As Int, marginLeftPx As Int, marginRightPx As Int, rVisibility As String, themeName As String, className As String) As MDLGridNew
	AddRowsMPV(Rows2Add, marginTopPx , marginBottomPx , marginLeftPx, marginRightPx , 0,0,0,0,themeName, rVisibility, className)
	Return Me
End Sub


'add rows specifying all margins
Sub AddRowsM2(Rows2Add As Int, marginTopPx As Int, marginBottomPx As Int, marginLeftPx As Int, marginRightPx As Int, themeName As String, className As String) As MDLGridNew
	AddRowsMPV(Rows2Add, marginTopPx, marginBottomPx, marginLeftPx, marginRightPx, 0,0,0,0, themeName,"", className)
	Return Me
End Sub

'add rows specifying topn and bottom margin
Sub AddRowsM(Rows2Add As Int, marginTopPx As Int, marginBottomPx As Int, themeName As String, className As String) As MDLGridNew
	AddRowsMPV(Rows2Add, marginTopPx, marginBottomPx, 0,0,0,0,0,0,themeName ,"", className)
	Return Me
End Sub

'add a number of rows with visibility
Sub AddRowsV(Rows2Add As Int, rVisibility As String, themeName As String, className As String)  As MDLGridNew
	AddRowsMPV(Rows2Add, 0,20,0,0,0,0,0,0,themeName,rVisibility, className)
	Return Me
End Sub

'Add a specic number of rows, the following method should be AddColumns
Sub AddRows(Rows2Add As Int, themeName As String,className As String) As MDLGridNew
	AddRowsMPV(Rows2Add, 0,20,0,0,0,0,0,0,themeName,"",className)
	Return Me
End Sub


'add a class to a row
Sub SetRowClass(rowPos As Int, className As String)
	'class names should be unique for the row
	Dim rowc As Map
	Dim rowKey As String = $"r${rowPos}"$
	If rowClasses.ContainsKey(rowKey) Then
		rowc = rowClasses.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(className,className)
	rowClasses.Put(rowKey,rowc)
End Sub

'set col margins
Sub SetColumnMargins(rowPos As Int, colPos As Int, marginTop As Int, marginBottom As Int, marginLeft As Int, marginRight As Int)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim sCol As String = CStr(colPos)
	Dim rowKey As String = $"r${sRow}c${sCol}"$
	Dim rowcy As Map = CreateMap("mt": CStr(marginTop), "mb": CStr(marginBottom), "ml": CStr(marginLeft), "mr": CStr(marginRight))
	rowMargins.Put(rowKey,rowcy)
End Sub

'set row margins
Sub SetRowMargins(rowPos As Int, marginTop As Int, marginBottom As Int, marginLeft As Int, marginRight As Int)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim rowKey As String = $"r${sRow}"$
	Dim rowcb As Map = CreateMap("mt": CStr(marginTop), "mb": CStr(marginBottom), "ml": CStr(marginLeft), "mr": CStr(marginRight))
	rowMargins.Put(rowKey,rowcb)
End Sub

'set col padding
Sub SetColumnPadding(rowPos As Int, colPos As Int, paddingTop As Int, paddingBottom As Int, paddingLeft As Int, paddingRight As Int)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim sCol As String = CStr(colPos)
	Dim rowKey As String = $"r${sRow}c${sCol}"$
	Dim rowcx As Map = CreateMap("pt": CStr(paddingTop), "pb": CStr(paddingBottom), "pl": CStr(paddingLeft), "pr": CStr(paddingRight))
	rowPadding.Put(rowKey,rowcx)
End Sub

'set row margins
Sub SetRowPadding(rowPos As Int, paddingTop As Int, paddingBottom As Int, paddingLeft As Int, paddingRight As Int)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim rowKey As String = $"r${sRow}"$
	Dim rowca As Map = CreateMap("pt": CStr(paddingTop), "pb": CStr(paddingBottom), "pl": CStr(paddingLeft), "pr": CStr(paddingRight))
	rowPadding.Put(rowKey,rowca)
End Sub

'add a class to a column
Sub SetColumnClass(rowPos As Int, columnPos As Int, className As String)
	'class names should be unique for the row
	Dim rowc As Map
	Dim rowKey As String = $"r${rowPos}c${columnPos}"$
	If columnClasses.ContainsKey(rowKey) Then
		rowc = columnClasses.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(className,className)
	columnClasses.Put(rowKey,rowc)
End Sub

'add a style to a column
Sub SetColumnStyle(rowPos As Int, columnPos As Int, prop As String, value As String)
	Dim rowc As Map
	Dim rowKey As String = $"r${rowPos}c${columnPos}"$
	If columnStyles.ContainsKey(rowKey) Then
		rowc = columnStyles.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(prop,value)
	columnStyles.Put(rowKey,rowc)
End Sub

'add a style to a column
Sub SetRowStyle(rowPos As Int, prop As String, value As String)
	Dim rowc As Map
	Dim rowKey As String = $"r${rowPos}"$
	If rowStyles.ContainsKey(rowKey) Then
		rowc = rowStyles.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(prop,value)
	rowStyles.Put(rowKey,rowc)
End Sub

'add a class to a row/column
Sub SetClass(rowPos As Int, colPos As Int, className As String)
	'class names should be unique for the row
	Dim rowc As Map
	Dim rowKey As String = $"r${CStr(rowPos)}c${CStr(colPos)}"$
	If colPos = 0 Then
		rowKey = $"r${CStr(rowPos)}"$
	End If
	If rowClasses.ContainsKey(rowKey) Then
		rowc = rowClasses.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(className,className)
	rowClasses.Put(rowKey,rowc)
End Sub
 
'set margins for row/column
Sub SetMargins(rowPos As Int, colPos As Int, marginTop As String, marginBottom As String, marginLeft As String, marginRight As String)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim sCol As String = CStr(colPos)
	Dim rowKey As String = $"r${sRow}c${sCol}"$
	If colPos = "" Then
		rowKey = $"r${sRow}"$
	End If
	Dim rowcy As Map = CreateMap("mt": CStr(marginTop), _
	"mb": CStr(marginBottom), _
	"ml": CStr(marginLeft), _
	"mr": CStr(marginRight))
	rowMargins.Put(rowKey,rowcy)
End Sub

'set row margins
Sub SetPadding(rowPos As Int, colPos As Int, paddingTop As String, paddingBottom As String, paddingLeft As String, paddingRight As String)
	'class names should be unique for the row
	Dim sRow As String = CStr(rowPos)
	Dim rowKey As String = $"r${sRow}c${CStr(colPos)}"$
	If colPos = 0 Then
		rowKey = $"r${sRow}"$
	End If
	Dim rowca As Map = CreateMap("pt": CStr(paddingTop), _
	"pb": CStr(paddingBottom), _
	"pl": CStr(paddingLeft), _
	"pr": CStr(paddingRight))
	rowPadding.Put(rowKey,rowca)
End Sub

'add a style to a column
Sub SetStyle(rowPos As Int, colPos As Int, prop As String, value As String)
	Dim rowc As Map
	Dim rowKey As String = $"r${CStr(rowPos)}c${CStr(colPos)}"$
	If colPos = 0 Then
		rowKey = $"r${CStr(rowPos)}"$
	End If
	If rowStyles.ContainsKey(rowKey) Then
		rowc = rowStyles.Get(rowKey)
	Else
		rowc.Initialize
		rowc.clear
	End If
	rowc.Put(prop,value)
	rowStyles.Put(rowKey,rowc)
End Sub


'internal
private Sub CreateRow(Rows2Add As Int, MarginTop As Int, MarginBottom As Int, MarginLeft As Int, MarginRight As Int, PaddingTop As Int, PaddingBottom As Int, PaddingLeft As Int, PaddingRight As Int, Visibility As String, ThemeName As String,CenterInPage As Boolean,ClassName As String) As MDLRowNew
	Dim nr As MDLRowNew
	nr.Initialize
	nr.MarginBottom = MarginBottom
	nr.MarginLeft = MarginLeft
	nr.MarginRight = MarginRight
	nr.MarginTop = MarginTop
	nr.PaddingBottom = PaddingBottom
	nr.PaddingLeft = PaddingLeft
	nr.PaddingRight = PaddingRight
	nr.PaddingTop = PaddingTop
	nr.ThemeName = ThemeName
	nr.Visibility = Visibility
	nr.ClassName = ClassName
	nr.Rows = Rows2Add
	Return nr
End Sub

'internal
private Sub CreateColumn(Columns2Add As Int,  OffsetSmall As Int, OffsetMedium As Int, OffsetLarge As Int, OffsetXLarge As Int, SpanSmall As Int, SpanMedium As Int, SpanLarge As Int, SpanXLarge As String, MarginTop As Int, _
	MarginBottom As Int, MarginLeft As Int, MarginRight As Int, PaddingTop As Int, PaddingBottom As Int, PaddingLeft As Int, PaddingRight As Int, Theme As String,Visibility As String,ClassName As String) As MDLColumnNew
	Dim nCell As MDLColumnNew
	nCell.Initialize
	nCell.Columns = Columns2Add
	nCell.OffsetSmall = OffsetSmall
	nCell.OffsetMedium = OffsetMedium
	nCell.OffsetLarge = OffsetLarge
	nCell.SpanSmall = SpanSmall
	nCell.SpanMedium = SpanMedium
	nCell.SpanLarge = SpanLarge
	nCell.MarginTop = MarginTop
	nCell.MarginBottom = MarginBottom
	nCell.MarginLeft = MarginLeft
	nCell.MarginRight = MarginRight
	nCell.PaddingBottom = PaddingBottom
	nCell.PaddingLeft = PaddingLeft
	nCell.PaddingTop = PaddingTop
	nCell.PaddingRight = PaddingRight
	nCell.Visibility = Visibility
	nCell.ClassName = ClassName
	nCell.Theme = Theme
	Return nCell
End Sub

'Initializes the grid for use
Public Sub Initialize(parent As String)
	Rows.Initialize
	Rows.clear
	LastRow = 0
	RC.Initialize
	RC.clear
	Columns.Initialize
	Columns.clear
	ShowID = False
	parentID = parent.tolowercase
	Components.Initialize
	Components.clear
	rowClasses.Initialize
	rowClasses.clear
	columnClasses.Initialize
	columnClasses.clear
	rowPadding.Initialize
	rowPadding.clear
	rowMargins.Initialize
	rowMargins.clear
	columnStyles.Initialize
	columnStyles.clear
	rowStyles.Initialize
	rowStyles.clear
End Sub

'Add a specic number of rows, the following method should be AddColumns
Sub AddRowsMPV(iRows As Int, iMarginTop As Int, iMarginBottom As Int, iMarginLeft As Int, iMarginRight As Int, iPaddingTop As Int, iPaddingBottom As Int, iPaddingLeft As Int, iPaddingRight As Int, sThemeName As String, _
sVisibility As String, sClassName As String) As MDLGridNew
	'if there is no existing row, then initialize the map
	'lets store the last row
	LastRow = Rows.size
	'create a new type
	Dim nRow As MDLRowNew
	nRow.Initialize
	nRow  = CreateRow(iRows,iMarginTop,iMarginBottom,iMarginLeft,iMarginRight,iPaddingTop,iPaddingBottom,iPaddingLeft,iPaddingRight,sVisibility,sThemeName,False,sClassName)
	'lets store this new row in rows
	Dim rowKey As String = $"r${LastRow}"$
	'lets save the row on the map
	Rows.Put(rowKey,nRow)
	Return Me
End Sub

'add colums specifying offsets,sizes,margins,padding, theme
Sub AddColumnOSMPV(iColumns As Int,iOffsetSmall As Int, iOffsetMedium As Int, iOffsetLarge As Int, iSizeSmall As Int, iSizeMedium As Int, iSizeLarge As Int, iMarginTop As Int, _
iMarginBottom As Int, iMarginLeft As Int, iMarginRight As Int, iPaddingTop As Int, iPaddingBottom As Int, iPaddingLeft As Int, iPaddingRight As Int, sThemeName As String, _
sVisibility As String, sClassName As String) As MDLGridNew
	'add a column to the last row added
	Dim nCell As MDLColumnNew
	nCell.Initialize
	nCell = CreateColumn(iColumns,iOffsetSmall,iOffsetMedium,iOffsetLarge,0,iSizeSmall,iSizeMedium,iSizeLarge,0, _
	iMarginTop,iMarginBottom,iMarginLeft,iMarginRight,iPaddingTop,iPaddingBottom,iPaddingLeft,iPaddingRight,sThemeName,sVisibility,sClassName)
	'get the existing columns for this row
	Dim rowkey As String = $"r${LastRow}"$
	'get the row from existing rows
	If Rows.ContainsKey(rowkey) Then
		'get the row from existing rows
		Dim oldRow As MDLRowNew
		oldRow.Initialize
		oldRow = Rows.Get(rowkey)
		'get the existing columns from the row
		Dim cols As List = oldRow.Columns
		cols.add(nCell)
		Rows.Put(rowkey,oldRow)
	Else
		Log("MDLGridNew - AddColumnOSMPV: A row has not been added yet to the grid!")
	End If
	Return Me
End Sub

'add columns specifying offsets and sizes
Sub AddColumnsOS(Columns2Add As Int, iOffsetSmall As Int, iOffsetMedium As Int, iOffsetLarge As Int, iSizeSmall As Int, iSizeMedium As Int, iSizeLarge As Int, sThemeName As String, className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add, iOffsetSmall, iOffsetMedium, iOffsetLarge , iSizeSmall, iSizeMedium, iSizeLarge,0,0,0,0,0,0,0,0, sThemeName,"", className )
	Return Me
End Sub

'add columns spanning 12 spaces specifying marging, padding and visibility
Sub AddColumns12MPV(Columns2Add As Int, iMarginTopPx As Int, iMarginBottomPx As Int, iPaddingLeftPx As Int, iPaddingRightPx As Int, sVisibility As String, sThemeName As String, className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add ,0,0,0,12,12,12, iMarginTopPx , iMarginBottomPx ,0,0, 0,0,iPaddingLeftPx , iPaddingRightPx, sThemeName, sVisibility, className)
	Return Me
End Sub


'add columns spanning 12 spaces specifying margins and padding
Sub AddColumns12MP(Columns2Add As Int, iMarginTopPx As Int, iMarginBottomPx As Int, iPaddingLeftPx As Int, iPaddingRightPx As Int, sThemeName As String, className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add, 0,0,0,12,12,12, iMarginTopPx , iMarginBottomPx, iPaddingLeftPx , iPaddingRightPx, 0,0,0,0,sThemeName,"", className)
	Return Me
End Sub

'add columns specifying offsets, sizes, marging, padding and visibility
Sub AddColumnsOSMPV(Columns2Add As Int, OffsetSmall As Int, OffsetMedium As Int, OffsetLarge As Int, SizeSmall As Int, SizeMedium As Int, SizeLarge As Int, _
	MarginTopPx As Int, MarginBottomPx As Int, PaddingLeftPx As Int, PaddingRightPx As Int, sVisibility As String, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add, OffsetSmall, OffsetMedium, OffsetLarge, SizeSmall, SizeMedium, SizeLarge, _
	MarginTopPx, MarginBottomPx,0,0,0,0, PaddingLeftPx, PaddingRightPx, sThemeName,sVisibility, className) 
	Return Me
End Sub


'add columns with size and padding
Sub AddColumnsSP(Columns2Add As Int, SizeSmall As Int, SizeMedium As Int, SizeLarge As Int, rPaddingLeft As Int, rPaddingRight As Int, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add, 0,0,0,SizeSmall, SizeMedium, SizeLarge ,0,0,0,0,0,0, rPaddingLeft, rPaddingRight, sThemeName,"",className)
	Return Me
End Sub

'add columns specifying offsets, sizes, margins and padding
Sub AddColumnsOSMP(Columns2Add As Int, OffsetSmall As Int, OffsetMedium As Int, OffsetLarge As Int, SizeSmall As Int, SizeMedium As Int, SizeLarge As Int, rMarginTop As Int, rMarginBottom As Int, rPaddingLeft As Int, rPaddingRight As Int, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add,OffsetSmall, OffsetMedium , OffsetLarge, SizeSmall, SizeMedium, SizeLarge, rMarginTop, rMarginBottom, 0,0,0,0,rPaddingLeft, rPaddingRight, sThemeName ,"",className)
	Return Me
End Sub


'add columns spanning 12 spaces specifying visibility
Sub AddColumns12V(Columns2Add As Int, sVisibility As String, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add,0,0,0,12,12,12,0,0,0,0,0,0,0,0, sThemeName,sVisibility,className)
	Return Me
End Sub

'add a column that spans 12 spaces
Sub AddColumns12(Columns2Add As Int, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add,0,0,0,12,12,12,0,0,0,0,0,0,0,0, sThemeName,"",className)
	Return Me
End Sub

'add a number of columns specifying their spans, use with AddRows
Sub AddColumns(Columns2Add As Int, SpanSmall As Int, SpanMedium As Int, SpanLarge As Int,themeName As String, className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add, 0,0,0,SpanSmall, SpanMedium, SpanLarge,0,0,0,0,0,0,0,0,themeName,"", className)
	Return Me
End Sub


'add columns specifying offsets, sizes and visibility
Sub AddColumnsOSV(Columns2Add As Int, iOffsetSmall As Int, iOffsetMedium As Int, iOffsetLarge As Int, iSizeSmall As Int, iSizeMedium As Int, iSizeLarge As Int, sVisibility As String, sThemeName As String,className As String) As MDLGridNew
	AddColumnOSMPV(Columns2Add , iOffsetSmall , iOffsetMedium, iOffsetLarge, iSizeSmall, iSizeMedium , iSizeLarge, 0,0,0,0,0,0,0,0,sThemeName,sVisibility, className)
	Return Me
End Sub

'returns the grid definition
Sub ToString() As String
	'hold row counter
	LastRow = 0
	Dim sb As StringBuilder
	sb.Initialize
	'for each defined row, for each defined column
	Dim rowCnt As Int = 0
	Dim rowTot As Int = Rows.Size - 1
	For rowCnt = 0 To rowTot
		Dim rowKey As String = Rows.GetKeyAt(rowCnt)
		Dim currentRow As MDLRowNew
		currentRow.Initialize
		currentRow = Rows.Get(rowKey)
		Dim strRow As String = BuildRow(currentRow)
		sb.Append(strRow)
		sb.append(CRLF)
	Next
	Return sb.tostring
End Sub

'overwrite contents at rc
Sub ReplaceRC(rowPos As Int, colPos As Int, elHTML As String)
	Dim cellKey As String = $"#${parentID}r${rowPos}c${colPos}"$
	Dim elBody As BANanoElement
	elBody = BANano.GetElement(cellKey)
	If elBody <> Null Then
		elBody.Empty
		elBody.SetHTML(elHTML)
	End If
End Sub


'add a component to the grid
Sub AddComponent(rowPos As Int, colPos As Int, elHTML As String)
	Dim cellKey As String = $"${parentID}r${rowPos}c${colPos}"$
	Dim lst As List
	If Components.ContainsKey(cellKey) Then
		lst = Components.Get(cellKey)
	Else
		lst.Initialize
		lst.clear
	End If
	lst.Add(elHTML)
	Components.Put(cellKey,lst)
End Sub

private Sub MapKeys2Delim(m As Map, delim As String) As String
	Dim sb As StringBuilder
	sb.Initialize
	Dim kTot As Int = m.Size - 1
	Dim kCnt As Int
	Dim strKey As String = m.getkeyat(0)
	sb.Append(strKey)
	For kCnt = 1 To kTot
		Dim strKey As String = m.getkeyat(kCnt)
		sb.Append(delim).append(strKey)
	Next
	Return sb.ToString
End Sub

'build a single row
private Sub BuildRow(row As MDLRowNew) As String
	'how many rows do we have to render
	Dim rowTot As Int = row.Rows
	Dim rowCnt As Int
	Dim sb As StringBuilder
	sb.Initialize
	'for each row
	For rowCnt = 1 To rowTot
		LastRow = LastRow + 1
		row.Row = LastRow
		Dim rowKey As String = $"${parentID}r${LastRow}"$
		Dim tRow As BANanoHTML
		tRow.Initialize(rowKey).SetTag("div")
		Dim strRowClass As String = BuildRowClass
		Dim strRowStyle As String = BuildRowStyle(row)
		tRow.AddClass(strRowClass)
		tRow.AddAttribute("style",strRowStyle)
		tRow.AddClass(row.ClassName)
		'apply the theme
		'App.MaterialUseTheme(row.ThemeName,tRow)
		'find if the row has a class
		Dim classKey As String = $"r${LastRow}"$
		If rowClasses.ContainsKey(classKey) Then
			'get keys and add them
			Dim cm As Map = rowClasses.Get(classKey)
			tRow.AddClass(MapKeys2Delim(cm," "))
		End If
		If rowStyles.ContainsKey(classKey) Then
			Dim cm As Map = rowStyles.Get(classKey)
			For Each strkey As String In cm.Keys
				Dim strVal As String = cm.Get(strkey)
				tRow.AddStyleAttribute(strkey,strVal)
			Next
		End If
				
		'*****sb.Append($"<div class="${BuildRowClass(row)}" style="${BuildRowStyle(row)}" id="${rowKey}">"$).Append(CRLF)
		'get the columns to add
		Dim cols As List = row.Columns
		'how many columns to add here
		Dim colCnt As Int = 0
		Dim colTot As Int = cols.Size - 1
		'this will store the column count
		Dim LastColumn As Int = 0
		For colCnt = 0 To colTot
			'get this column
			Dim column As MDLColumnNew
			column.Initialize
			column = cols.Get(colCnt)
			Dim colCnt1 As Int = 0
			Dim colTot1 As Int = column.Columns
			For colCnt1 = 1 To colTot1
				'increment the column to add for this row
				LastColumn = LastColumn + 1
				column.Row = LastRow
				column.Col = LastColumn
				Dim cellKey As String = $"${rowKey}c${LastColumn}"$
				'add to RC map, this is used to check if Matrix Position Exist
				RC.Put(cellKey,cellKey)
				'if showid
				'Dim strShow As String = ""
				'If ShowID = True Then strShow = cellKey
				'define the column structure
				'Dim sbCol As String = $"<div class="${BuildColumnClass(column)}" style="${BuildColumnStyle(column)}" id="${cellKey}">${strShow}</div>"$
				
				Dim tColumn As BANanoHTML
				tColumn.Initialize(cellKey).SetTag("div")
				Dim strColumnClass As String = BuildColumnClass(column)
				Dim strColumnStyle As String = BuildColumnStyle(column)
				tColumn.AddClass(strColumnClass)
				tColumn.AddAttribute("style",strColumnStyle)
				tColumn.AddClass(column.ClassName)
				'apply the theme
				'App.MaterialUseTheme(column.Theme,tColumn)
				'find if the ceolumn has a class
				Dim classKey As String = $"r${LastRow}c${LastColumn}"$
				If columnClasses.ContainsKey(classKey) Then
					'get keys and add them
					Dim cm As Map = columnClasses.Get(classKey)
					tColumn.AddClass(MapKeys2Delim(cm," "))
				End If
				If columnStyles.ContainsKey(classKey) Then
					Dim cm As Map = columnStyles.Get(classKey)
					For Each strkey As String In cm.Keys
						Dim strVal As String = cm.Get(strkey)
						tColumn.AddStyleAttribute(strkey,strVal)
					Next
				End If
				If Components.ContainsKey(cellKey) Then
					Dim lst As List = Components.Get(cellKey)
					tColumn.AddContentList(lst)
				End If
				tRow.AddElement(tColumn)
				'*****sb.Append(sbCol).Append(CRLF)
			Next
		Next
		Dim strRow As String = tRow.tostring
		sb.Append(strRow).Append(CRLF)
		'*****sb.Append("</div>").append(CRLF)
	Next
	Return sb.tostring
End Sub

'build the column class for current column
private Sub BuildColumnClass(col As MDLColumnNew) As String
	Dim strSpans As String = BuildSpans(col.SpanSmall,col.SpanMedium,col.SpanLarge)
	Dim strOffSets As String = BuildOffsets(col.offsetsmall,col.offsetmedium,col.Offsetlarge)
	'add the spans
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append($"${cellClass} "$)
	sb.Append(strSpans)
	'add offsets
	sb.Append(strOffSets)
	Return sb.tostring.trim
End Sub

private Sub BuildRowStyle(row As MDLRowNew) As String
	Dim rowc As Map
	rowc.Initialize
	rowc.clear
	Dim rowKey As String = $"r${row.Row}"$
	Dim hasrow As Boolean = rowPadding.ContainsKey(rowKey)
	If hasrow Then
		rowc = rowPadding.Get(rowKey)
		row.PaddingTop = rowc.get("pt")
		row.PaddingBottom = rowc.get("pb")
		row.PaddingLeft = rowc.get("pl")
		row.PaddingRight = rowc.get("pr")
	End If
	Dim hasrow As Boolean = rowMargins.ContainsKey(rowKey)
	If hasrow Then
		rowc = rowMargins.Get(rowKey)
		row.MarginTop = rowc.get("mt")
		row.MarginBottom = rowc.get("mb")
		row.MarginLeft = rowc.get("ml")
		row.MarginRight = rowc.get("mr")
	End If
	
	Dim strMargins As String = BuildMargins(row.MarginTop,row.MarginBottom,row.MarginLeft,row.MarginRight)
	Dim strPadding As String = BuildPadding(row.PaddingTop,row.PaddingBottom,row.PaddingLeft,row.PaddingRight)
	Dim sb As StringBuilder
	sb.Initialize
	'add the margins
	sb.Append(strMargins)
	'add the padding
	sb.Append(strPadding)
	Return sb.tostring.trim
End Sub

private Sub BuildColumnStyle(col As MDLColumnNew) As String
	Dim rowc As Map
	rowc.Initialize
	rowc.clear
	Dim rowKey As String = $"r${col.Row}c${col.Col}"$
	Dim hascolumn As Boolean = rowPadding.ContainsKey(rowKey)
	If hascolumn Then
		rowc = rowPadding.Get(rowKey)
		col.PaddingTop = rowc.get("pt")
		col.PaddingBottom = rowc.get("pb")
		col.PaddingLeft = rowc.get("pl")
		col.PaddingRight = rowc.get("pr")
	End If
	Dim hascolumn As Boolean = rowMargins.ContainsKey(rowKey)
	If hascolumn Then
		rowc = rowMargins.Get(rowKey)
		col.MarginTop = rowc.get("mt")
		col.MarginBottom = rowc.get("mb")
		col.MarginLeft = rowc.get("ml")
		col.MarginRight = rowc.get("mr")
	End If
		
	Dim strMargins As String = BuildMargins(col.MarginTop,col.MarginBottom,col.MarginLeft,col.MarginRight)
	Dim strPadding As String = BuildPadding(col.PaddingTop,col.PaddingBottom,col.PaddingLeft,col.PaddingRight)
	Dim sb As StringBuilder
	sb.Initialize
	'add the margins
	sb.Append(strMargins)
	'add the padding
	sb.Append(strPadding)
	Return sb.tostring.trim
End Sub

'build the row class for current row
private Sub BuildRowClass() As String
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append($"${rowClass} "$)
	Return sb.tostring.trim
End Sub

'build the spans class
Private Sub BuildSpans(SS As Int, SM As Int, SL As Int) As String
	Dim sb As StringBuilder
	sb.Initialize
	If SS > 0 Then sb.Append($"mdl-cell--${SS}-col-phone "$)
	If SM > 0 Then sb.append($"mdl-cell--${SM}-col-tablet "$)
	If SL > 0 Then sb.append($"mdl-cell--${SL}-col-desktop "$)
	Return sb.ToString
End Sub

'build the offset class
Private Sub BuildOffsets(OS As Int, OM As Int, OL As Int) As String
	Dim sb As StringBuilder
	sb.Initialize
	'offsets
	If OS > 0 Then sb.Append($"mdl-cell--${OS}-offset-phone "$)
	If OM > 0 Then sb.Append($"mdl-cell--${OM}-offset-tablet "$)
	If OL > 0 Then sb.Append($"mdl-cell--${OL}-offset-desktop "$)
	Return sb.ToString
End Sub

'build the padding class
Private Sub BuildPadding(PT As Int, PB As Int, PL As Int, PR As Int) As String
	Dim pvalue As String = "0"
	Dim sb As StringBuilder
	sb.Initialize
	'loop through each padding class
	Dim kTot As Int = padClass.Size - 1
	Dim kCnt As Int
	For kCnt = 0 To kTot
		Dim colKey As String = padClass.GetKeyAt(kCnt)
		Dim colC As String = padClass.Get(colKey)
		Select Case colKey
			Case "pt"
				pvalue = CStr(PT)
			Case "pb"
				pvalue = CStr(PB)
			Case "pl"
				pvalue = CStr(PL)
			Case "pr"
				pvalue = CStr(PR)
		End Select
		sb.Append(colC)
		sb.Append(pvalue)
		sb.Append("px; ")
	Next
	Return sb.tostring
End Sub

'build the margins class
Private Sub BuildMargins(MT As Int, MB As Int, ML As Int, MR As Int) As String
	Dim pvalue As String = "0"
	Dim sb As StringBuilder
	sb.Initialize
	'loop through each margin class
	Dim kTot As Int = marClass.Size - 1
	Dim kCnt As Int
	For kCnt = 0 To kTot
		Dim colKey As String = marClass.GetKeyAt(kCnt)
		Dim colC As String = marClass.Get(colKey)
		Select Case colKey
			Case "mt"
				pvalue = CStr(MT)
			Case "mb"
				pvalue = CStr(MB)
			Case "ml"
				pvalue = CStr(ML)
			Case "mr"
				pvalue = CStr(MR)
		End Select
		sb.Append(colC)
		sb.Append(pvalue)
		sb.Append("px; ")
	Next
	Return sb.tostring
End Sub

'check if the row exists
Sub RowExists(rowPos As Int) As Boolean
	Dim rowcol As String = $"r${rowPos}"$
	Return Rows.ContainsKey(rowcol)
End Sub

'check if the column exist
Sub ColumnExists(rowPos As Int, colPos As Int) As Boolean
	Dim rowcol As String = $"r${rowPos}c${colPos}"$
	Return RC.ContainsKey(rowcol)
End Sub

'how many rows do we have
Sub HowManyRows() As Int
	Return LastRow
End Sub