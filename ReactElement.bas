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
End Sub

Public Sub Initialize(BR As BANanoReact, sTag As String) As ReactElement
	elTag = sTag.tolowercase
	props.Initialize 
	r = BR.React
	children.Initialize 
	Return Me
End Sub

'set the id of the element
Sub SetID(t As String) As ReactElement
	ID = t
	Return Me
End Sub

'set class name
Sub SetClassName(c As String) As ReactElement
	Return Me
End Sub

'set the property
Sub SetProp(k As String, v As String) As ReactElement
	props.Put(k,v)
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
	Element = r.RunMethod("createElement", Array(elTag, props, children))
End Sub	