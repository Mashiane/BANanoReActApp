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
	Private state As Map
End Sub

'initialize the react element
Public Sub Initialize(BR As BANanoReact, sTag As String) As ReactElement
	elTag = sTag.tolowercase
	props.Initialize 
	r = BR.React
	children.Initialize 
	style.Initialize 
	classList.Initialize 
	className = ""
	state.Initialize 
	Return Me
End Sub

'set the id of the element
Sub SetID(t As String) As ReactElement
	ID = t
	SetProp("id", ID)
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
Sub SetProp(k As String, v As Object) As ReactElement
	props.Put(k,v)
	Return Me	
End Sub

'set the state
Sub SetState(k As String, v As Object) As ReactElement
	state.Put(k, v)
	Return Me	
End Sub

'set for / set htmlfor
Sub SetFor(k As String) As ReactElement
	SetProp("htmlFor",k)
	Return Me
End Sub

'set placeholder
Sub SetPlaceholder(k As String) As ReactElement
	SetProp("placeholder",k)
	Return Me
End Sub


'set the name
Sub SetName(k As String) As ReactElement
	SetProp("name", k)
	Return Me
End Sub


'set the action
Sub SetAction(k As String) As ReactElement
	SetProp("action", k)
	Return Me
End Sub


'set the target
Sub SetTarget(k As String) As ReactElement
	SetProp("target", k)
	Return Me
End Sub

'set the label
Sub SetLabel(k As String) As ReactElement
	SetProp("label", k)
	Return Me
End Sub

'set the key
Sub SetKey(k As String) As ReactElement
	SetProp("key", k)
	Return Me
End Sub

'set the type
Sub SetType(k As String) As ReactElement
	SetProp("type", k)
	Return Me
End Sub

'set the data
Sub SetData(k As Object) As ReactElement
	SetProp("data", k)
	Return Me
End Sub

'set multiple properties
Sub SetProps(propsMap As Map) As ReactElement
	For Each k As String In propsMap.Keys
		Dim v As Object = propsMap.Get(k)
		SetProp(k,v)
	Next
	Return Me
End Sub

'set the style
Sub SetStyle(k As String, v As String) As ReactElement
	style.Put(k,v)
	Return Me	
End Sub

'set multiple styles
Sub SetStyles(m As Map) As ReactElement
	For Each k As String In m.Keys
		Dim v As String = m.Get(k)
		SetStyle(k,v)
	Next
	Return Me
End Sub

'set the value
Sub SetValue(h As String) As ReactElement
	SetProp("value", h)
	Return Me
End Sub

'set the href
Sub SetHREF(h As String) As ReactElement
	SetProp("href", h)
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

'add a react element child
Sub AddReactElements(childrenList As List) As ReactElement
	For Each re As ReactElement In childrenList
		AddReactElement(re)
	Next
	Return Me
End Sub


'add to parent
Sub AddToParent(parent As ReactElement)
	CreateElement
	parent.AddChild(Element)
End Sub

'create the element
Sub CreateElement
	If classList.Size > 0 Then
		Dim mk As List = MapKeys2List(classList)
		className = Join(" ", mk)
		className = className.trim
	End If
	If className <> "" Then
		props.Put("className", className)
	End If
	If style.Size > 0 Then
		props.Put("style", style)
	End If
	'get type
	Select Case elTag
	Case "input"
		Element = r.RunMethod("createElement", Array(elTag, props))
	Case Else
		Element = r.RunMethod("createElement", Array(elTag, props, children))
	End Select
End Sub

'convert map keys to a list
private Sub MapKeys2List(m As Map) As List
	Dim lst As List
	lst.Initialize 
	For Each k As String In m.Keys
		lst.Add(k)
	Next
	Return lst
End Sub


'convert map values to a list
private Sub MapValues2List(m As Map) As List
	Dim lst As List
	lst.Initialize
	For Each k As String In m.values
		lst.Add(k)
	Next
	Return lst
End Sub

'join a list
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

'on click event
Sub SetOnClick(cb As BANanoObject) As ReactElement
	SetProp("onClick", cb)
	Return Me
End Sub

