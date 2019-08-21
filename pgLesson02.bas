﻿B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
Sub Process_Globals
	Private BANano As BANano
	Private body As BANanoElement
	Private BR As BANanoReact
End Sub

Sub Show
	'get the body of the page
	body = BANano.GetElement("#body")
	'clear the body
	body.Empty
	
	'create a parent container div on the body: recommended
	Dim rrhtml As BANanoHTML
	rrhtml.Initialize("div").SetID("react-root")
	'add the div to the body, get it and convert it to an object
	Dim rr As BANanoObject = body.Append(rrhtml.HTML).Get("#react-root").ToObject
	'
	'initialize banano react
	BR.Initialize
	'
	'create a div
	Dim div As ReactElement = BR.div
	'create a h1 with text contacts
	Dim h1 As ReactElement = BR.h1
	h1.AddChild("Contacts")
	'create a ul
	Dim ul As ReactElement = BR.ul
	'create a list item
	Dim li1 As ReactElement = BR.li
	'create an anchor and set properties
	Dim a1 As ReactElement = BR.a
	a1.AddChild("James Nelson").SetProp("href","mailto:james@frontarm.com").AddToParent(li1)
	'
	Dim li2 As ReactElement = BR.li
	Dim a2 As ReactElement = BR.a
	a2.AddChild("Mashy").SetProp("href","mailto:mbangaa@gmail.com").AddToParent(li2)
	'
	ul.AddReactElement(li1)
	ul.AddReactElement(li2)
	'
	div.AddReactElement(h1)
	div.AddReactElement(ul)
	'
	BR.Render(div, rr)
	
End Sub