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

'initialize the lib
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