B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
Sub Class_Globals
	Private BANano As BANano
	Public React As BANanoObject
	Public ReactDOM As BANanoObject
End Sub

'initialize the lib class
Public Sub Initialize As BANanoReact
	'initialize the react library
	React.Initialize("React")
	'initialize the react dom library
	ReactDOM.Initialize("ReactDOM")
	Return Me
End Sub

'create an element
Sub CreateElement(typeOf As String, props As Map, children As Object) As BANanoObject
	Dim obj As BANanoObject
	obj = React.RunMethod("createElement", Array(typeOf, props, children))
	Return obj
End Sub

'create an instance of the reactelement
Sub CreateReactElement(typeOf As String, props As Map, children As Object) As ReactElement
	Dim obj As ReactElement
	obj.Initialize(Me, typeOf)
	obj.SetProps(props)
	obj.AddChild(children)
	Return obj
End Sub

'render a child to the parent
Sub Render(child As ReactElement, parent As BANanoObject)
	child.CreateElement
	'render the element
	ReactDOM.RunMethod("render", Array(child.element, parent))
End Sub

'create a div
Sub div(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "div") 
	Return d
End Sub

'create a label item
Sub label(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "label")
	Return d
End Sub


'create a button item
Sub button(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "button")
	Return d
End Sub

'create an input item
Sub input(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "input")
	Return d
End Sub


'create a header item
Sub header(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "header")
	Return d
End Sub

'create a footer item
Sub footer(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "footer")
	Return d
End Sub

'create a list item
Sub li(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "li")
	Return d
End Sub

'create an unordered list
Sub ul(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "ul")
	Return d
End Sub

'create an anchor
Sub a(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "a")
	Return d
End Sub

'create a paragraph
Sub p(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "p")
	Return d
End Sub

'create a h1
Sub h1(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h1")
	Return d
End Sub

'create a h2
Sub h2(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h2")
	Return d
End Sub

'create a h3
Sub h3(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h3")
	Return d
End Sub

'create a h4
Sub h4(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h4")
	Return d
End Sub

'create a h5
Sub h5(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h5")
	Return d
End Sub

'create a h6
Sub h6(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h6")
	Return d
End Sub

'create an ol
Sub ol(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "ol")
	Return d
End Sub


'create a form
Sub form(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "form")
	Return d
End Sub