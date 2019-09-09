B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=StaticCode
Version=7.51
@EndOfDesignText@
'Static code module
#IgnoreWarnings:12
Sub Process_Globals
	Private BANano As BANano  'ignore
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
	Dim app As ReactElement = BR.Initialize
	'add a menu
	app.AddBR
	app.AddReactElement(modReact.ExamplesMenu(BR))
	app.addhr
	
	'
	'create an ol
	Dim ol As ReactElement = BR.ol("mylist").AddClass("rectangle").SetOnClick(Me, "itemclick")
	'
	'create a list item
	Dim li1 As ReactElement = BR.li("").SetKey("li1")
	li1.AddElement(BR.CreateElement("a", CreateMap("href":"#", "id": "item1"),"Item 1"))
	'
	Dim li2 As ReactElement = BR.li("").SetKey("li2")
	li2.AddElement(BR.CreateElement("a", CreateMap("href":"#", "id": "item2"),"Item 2"))
	'
	Dim li3 As ReactElement = BR.li("").SetKey("li3")
	li3.AddElement(BR.CreateElement("a", CreateMap("href":"#", "id": "item3"),"Item 3"))
	'
	Dim li4 As ReactElement = BR.li("").SetKey("li4")
	li4.AddElement(BR.CreateElement("a", CreateMap("href":"#", "id": "item4"),"Item 4"))
	'
	Dim li5 As ReactElement = BR.li("").SetKey("li5")
	li5.AddElement(BR.CreateElement("a", CreateMap("href":"#", "id": "item5"),"Item 5"))
	'
	ol.AddElements(Array(li1,li2,li3,li4,li5))
	'
	'
	app.AddReactElement(ol)
	app.Render("app")
End Sub


Sub ItemClick(e As BANanoEvent)
	Dim itemid As String = BR.GetIDFromEvent(e)
	Log(itemid)
End Sub

