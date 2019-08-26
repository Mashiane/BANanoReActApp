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

#if css
	.rectangle {
		counter-reset: li;
		list-style: none;
		font: 14px "Trebuchet MS", "Lucida Sans";
		padding: 0;
		text-shadow: 0 1px 0 rgba(255,255,255,.5);
	}
	.rectangle a {
		position: relative;
		display: block;
		padding: .4em .4em .4em .8em;
		margin: .5em 0 .5em 2.5em;
		background: #D3D4DA;
		color: #444;
		text-decoration: none;
		transition: all .3s ease-out;
	}
	.rectangle a:hover {background: #DCDDE1;}       
	.rectangle a:before {
		content: counter(li);
		counter-increment: li;
		position: absolute;
		left: -2.5em;
		top: 50%;
		margin-top: -1em;
		background: #9097A2;
		height: 2em;
		width: 2em;
		line-height: 2em;
		text-align: center;
		font-weight: bold;
	}
	.rectangle a:after {
		position: absolute;
		content: "";
		border: .5em solid transparent;
		left: -1em;
		top: 50%;
		margin-top: -.5em;
		transition: all .3s ease-out;
	}
	.rectangle a:hover:after {
		left: -.5em;
		border-left-color: #9097A2;
	}
#End If

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
	'create an ol
	Dim ol As ReactElement = BR.ol
	ol.SetClassName("rectangle")
	
	'create a list item
	Dim li1 As ReactElement = BR.li
	li1.AddReactElement(BR.CreateReactElement("a", CreateMap("href":"#"),"Item 1"))
	'
	Dim li2 As ReactElement = BR.li
	li2.AddReactElement(BR.CreateReactElement("a", CreateMap("href":"#"),"Item 2"))
	'
	Dim li3 As ReactElement = BR.li
	li3.AddReactElement(BR.CreateReactElement("a", CreateMap("href":"#"),"Item 3"))
	'
	Dim li4 As ReactElement = BR.li
	li4.AddReactElement(BR.CreateReactElement("a", CreateMap("href":"#"),"Item 4"))
	'
	Dim li5 As ReactElement = BR.li
	li5.AddReactElement(BR.CreateReactElement("a", CreateMap("href":"#"),"Item 5"))
	'
	ol.AddReactElement(li1)
	ol.AddReactElement(li2)
	ol.AddReactElement(li3)
	ol.AddReactElement(li4)
	ol.AddReactElement(li5)
	'
	BR.Render(ol, rr)
	
End Sub