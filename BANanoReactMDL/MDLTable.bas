B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
Sub Class_Globals
	Public ID As String
	Private TableInt As ReactElement
	Private BanReact As BANanoReact
	Private primaryKey As String
	Private thead As ReactElement
	Private tbody As ReactElement
	Private theadtr As ReactElement
	Private columns As Map
	Private rows As List
End Sub

'initialize the table
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLTable
	ID = sid.tolowercase
	TableInt = BR.table(sid).AddClass("mdl-data-table mdl-js-data-table")
	BanReact = BR
	thead = BR.thead($"${ID}-thead"$)
	tbody = BR.tbody($"${ID}-tbody"$)
	theadtr = BR.tr($"${ID}-theadtr"$)
	columns.Initialize 
	Return Me
End Sub

Sub CStr(o As Object) As String
	Dim sout As String = "" & o
	Return sout
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Table)
End Sub


'set data
Sub SetData(data As List)
	rows = data
	'build the table data
	Dim rowTot As Int = rows.Size - 1
	Dim rowCnt As Int
	
	'process each row
	For rowCnt = 0 To rowTot
		'define the row pos
		Dim rowPos As String = CStr(rowCnt)
		Dim rowkey As String = $"${ID}_${rowPos}"$
		'get the current row
		Dim tRow As Map = rows.Get(rowCnt)
		'we now have a new row with correct data
		Dim tr As ReactElement = BanReact.tr(rowkey)
		'loop through each column
		Dim colPos As Int = 0
		For Each colKey As String In columns.Keys
			Dim colValue As String = ""
			colPos = colPos + 1
			'define cell key
			Dim cellKey As String = $"${rowkey}_${colPos}"$
			'get the data of the row
			If tRow.ContainsKey(colKey) Then
				colValue = tRow.Get(colKey)
			End If
			'read details of column
			Dim colDet As ReactElement = columns.Get(colKey)
			Dim sname As String = colDet.GetProp("name")
			Dim bnumeric As Boolean = colDet.GetProp("numeric")
			Dim td As ReactElement = BanReact.td(cellKey)
			If bnumeric = False Then 
				td.AddClass("mdl-data-table__cell--non-numeric")
			End If
			td.SetProp("name", sname)
			td.SetLabel(colValue)
			'add to row
			tr.AddElement(td)
		Next
		'add row to the body
		tbody.AddElement(tr)
	Next
End Sub

'add a column
Sub AddColumn(colID As String, colLabel As String, colNumeric As Boolean, colSortDesc As Boolean)
	Dim th As ReactElement = BanReact.th($"${ID}.${colID}"$)
	th.SetLabel(colLabel)
	If colNumeric = False Then th.AddClass("mdl-data-table__cell--non-numeric")
	If colSortDesc Then
		th.AddClass("mdl-data-table__header--sorted-descending")
	Else
		th.AddClass("mdl-data-table__header--sorted-ascending")
	End If
	'store properties
	th.SetProp("numeric", colNumeric)
	th.SetProp("name", colID)
	'store the column for later use
	columns.Put(colID, th)
	theadtr.AddElement(th)
End Sub

'set primary key
Sub SetPrimaryKey(pk As String) As MDLTable
	primaryKey = pk
	Return Me
End Sub

'set selectable
Sub SetSelectable(b As Boolean) As MDLTable
	TableInt.AddClass("mdl-data-table--selectable")
	Return Me
End Sub

'set the shadow, 2,3,4,6,8,16
Sub SetShadow(b As String) As MDLTable
	TableInt.AddClass($"mdl-shadow--${b}dp"$)
	Return Me
End Sub

'get the table
Sub Table As ReactElement
	'add headings row
	thead.AddElement(theadtr)
	'add heading and body to table
	TableInt.AddElements(Array(thead,tbody))
	Return TableInt
End Sub