B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
Sub Class_Globals
	Private BANano As BANano
	Public React As BANanoObject
	Private ReactDOM As BANanoObject
End Sub

'initialize the lib class
Public Sub Initialize As BANanoReact
	'initialize the react library
	React.Initialize("React")
	'initialize the react dom library
	ReactDOM.Initialize("ReactDOM")
	Return Me
End Sub

'render a child to the parent
Sub Render(child As ReactElement, parent As BANanoObject)
	child.CreateElement
	'render the element
	ReactDOM.RunMethod("render", Array(child.element, parent))
End Sub

'create a div
Sub div As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "div") 
	Return d
End Sub

'create a list item
Sub li As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "li")
	Return d
End Sub

'create an unordered list
Sub ul As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "ul")
	Return d
End Sub

'create an anchor
Sub a As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "a")
	Return d
End Sub

'create a paragraph
Sub p As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "p")
	Return d
End Sub

'create a h1
Sub h1 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h1")
	Return d
End Sub

'create a h2
Sub h2 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h2")
	Return d
End Sub

'create a h3
Sub h3 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h3")
	Return d
End Sub

'create a h4
Sub h4 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h4")
	Return d
End Sub

'create a h5
Sub h5 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h5")
	Return d
End Sub

'create a h6
Sub h6 As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h6")
	Return d
End Sub
