B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public Element As BANanoObject
	Public ID As String
	Private props As Map
	Private elTag As String
	Private R As BANanoObject
	Private children As List
	Private style As Map
	Private classList As Map
	Private className As String
End Sub

Public Sub Initialize(BR As BANanoReact, sTag As String) As ReactElement
	elTag = sTag.tolowercase
	props.Initialize 
	r = BR.React
	children.Initialize 
	style.Initialize 
	classList.Initialize 
	className = ""
	Return Me
End Sub

'set the id of the element
Sub SetID(t As String) As ReactElement
	ID = t
	Return Me
End Sub

'set class name
Sub SetClassName(c As String) As ReactElement
	className = c
	Return Me
End Sub

'add a class
Sub AddClass(c As String) As ReactElement
	classList.Put(c,c)
	Return Me
End Sub

'set the property
Sub SetProp(k As String, v As String) As ReactElement
	props.Put(k,v)
	Return Me	
End Sub

'set the style
Sub SetStyle(k As String, v As String) As ReactElement
	style.Put(k,v)
	Return Me	
End Sub


'add a child
Sub AddChild(child As Object) As ReactElement
	children.Add(child)
	Return Me
End Sub

'add a react element child
Sub AddReactElement(child As ReactElement) As ReactElement
	child.CreateElement
	children.Add(child.element)
	Return Me
End Sub

'add to parent
Sub AddToParent(parent As ReactElement)
	CreateElement
	parent.AddChild(Element)
End Sub

Sub CreateElement
	If classList.Size > 0 Then
		className = Join(" ", classList)
		props.Put("className", className)
	End If
	If style.Size > 0 Then
		props.Put("style", style)
	End If
	Element = r.RunMethod("createElement", Array(elTag, props, children))
End Sub

private Sub Join(delimiter As String, lst As List) As String
	Dim i As Int
	Dim sb As StringBuilder
	sb.Initialize
	sb.Append(lst.get(0))
	For i = 1 To lst.size - 1
		sb.Append(delimiter).Append(lst.get(i))
	Next
	Return sb.ToString
End Sub
