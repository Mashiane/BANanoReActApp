B4J=true
Group=Default Group\React
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Private BANano As BANano   'ignore
	Public React As BANanoObject
	Public ReactDOM As BANanoObject
	Public JQuery As BANanoJQuery
	Private Themes As Map
End Sub

'initialize the lib class
Public Sub Initialize As ReactElement
	'initialize the react library
	React.Initialize("React")
	'initialize the react dom library
	ReactDOM.Initialize("ReactDOM")
	Themes.Initialize
	JQuery.Initialize
	'empty the body
	Dim el As BANanoElement = BANano.GetElement("#body")
	el.Empty
	el.Append($"<div id="app"></div>"$)
	'create the master div
	Dim app As ReactElement = div("app")
	Return app
End Sub

'clone the element
Sub CloneElement(elSource As BANanoObject, props As Map) As BANanoObject
	Dim clone As BANanoObject = React.RunMethod("cloneElement", Array(elSource, props))
	Return clone
End Sub

'sub count children
Sub ChildrenCount(cc As BANanoObject) As Int
	Dim cnt As Int = React.GetField("Children").RunMethod("count", Array(cc)).Result
	Return cnt
End Sub

'sub children to array
Sub ChildrenToArray(cc As BANanoObject) As List
	Dim ar As List = React.GetField("Children").RunMethod("toArray", Array(cc)).result
	Return ar
End Sub

'get the current reference
Sub GetRef(ref As BANanoObject) As BANanoObject
	Dim rr As BANanoObject = ref.GetField("current")
	Return rr
End Sub

'get reference value
Sub GetReferenceValue(ref As BANanoObject) As Object
	Dim rr As Object = ref.GetField("current").GetField("value").Result
	Return rr
End Sub

'add on item click
Sub OnItemClick(selector As String, module As Object, methodName As String)
	Dim el As BANanoElement = BANano.GetElement(selector)
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	el.AddEventListener("click", cb, True)
End Sub

'add on event
Sub OnEvent(selector As String, eventName As String, module As Object, methodName As String)
	Dim el As BANanoElement = BANano.GetElement(selector)
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, methodName, Array(e))
	el.AddEventListener(eventName, cb, True)
End Sub


'get selected nav drawe item that was clicked
Sub GetIDFromEvent(e As BANanoEvent) As String
	'get the target
	Dim aid As String = ""
	Dim target As BANanoElement = BANano.ToElement(e.OtherField("target"))
	Dim tagName As String = target.GetField("tagName").Result
	Select Case tagName
		Case "A"
			aid = target.GetField("id").result
		Case Else
			Dim parentNode As BANanoElement = BANano.ToElement(target.GetField("parentNode"))
			aid = parentNode.GetField("id").result
	End Select
	Return aid
End Sub

'add a class theme
Sub AddTheme(themeName As String, themeDetails As String)
	themeName = themeName.ToLowerCase
	Themes.Put(themeName, themeDetails)
End Sub

'get the theme
Sub GetTheme(themeName As String) As String
	If Themes.ContainsKey(themeName) Then
		Return Themes.Get(themeName)
	Else
		Return ""
	End If
End Sub

'getElementById
Sub getElementById(sid As String) As BANanoObject
	Dim el As BANanoObject = BANano.Window.GetField("document").RunMethod("getElementById", Array(sid))
	Return el
End Sub

'create an instance of the reactelement
Sub CreateElement(typeOf As String, props As Map, children As Object) As ReactElement
	Dim obj As ReactElement
	obj.Initialize(Me, typeOf)
	obj.SetProps(props)
	obj.AddChild(children)
	Return obj
End Sub

'create an instance of the reactelement
Sub CreateReactElement(typeOF As String, props As Map, children As Object) As ReactElement
	Dim obj As ReactElement = CreateElement(typeOF, props, children)
	Return obj
End Sub

'render a child to the parent
Sub Render(child As ReactElement, parent As Object)
	child.CreateElement
	If GetType(parent) = "string" Then
		parent = getElementById(parent)
	End If
	'render the element
	ReactDOM.RunMethod("render", Array(child.element, parent))
End Sub

'create a div
Sub div(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "div")
	d.SetID(z) 
	Return d
End Sub

'create image
Sub img(imgid As String) As ReactElement
	Dim ic As ReactElement
	ic.Initialize(Me, "img")
	ic.SetID(imgid)
	Return ic
End Sub


'create main
Sub mainElement(mainid As String) As ReactElement
	Dim m As ReactElement
	m.Initialize(Me, "main")
	m.SetID(mainid)
	Return m
End Sub


'create progress bar
Sub progress(pbid As String) As ReactElement
	Dim pb As ReactElement
	pb.Initialize(Me, "progress")
	pb.SetID(pbid)
	Return pb
End Sub


'create nav
Sub nav(nid As String) As ReactElement
	Dim n As ReactElement
	n.Initialize(Me, "nav")
	n.SetID(nid)
	Return n
End Sub

'create datalist
Sub datalist(nid As String) As ReactElement
	Dim n As ReactElement
	n.Initialize(Me, "datalist")
	n.SetID(nid)
	Return n
End Sub

'create header
Sub header(hid As String) As ReactElement
	Dim h As ReactElement
	h.Initialize(Me, "header")
	h.SetID(hid)
	Return h
End Sub

'create block quote
Sub blockquote(bqid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me, "blockquote")
	u.SetID(bqid)
	Return u
End Sub


Sub mark(preid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me, "mark")
	u.SetID(preid)
	Return u
End Sub


Sub tim(preid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me, "time")
	u.SetID(preid)
	Return u
End Sub


Sub dl(preid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me, "dl")
	u.SetID(preid)
	Return u
End Sub

Sub dt(preid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me, "dt")
	u.SetID(preid)
	Return u
End Sub

Sub dd(preid As String) As ReactElement
	Dim u As ReactElement
	u.Initialize(Me,"dd")
	u.SetID(preid)
	Return u
End Sub


'create a aside
Sub aside(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "aside")
	d.SetID(z)
	Return d
End Sub

'create figcaption
Sub figcaption(fid As String) As ReactElement
	Dim f As ReactElement
	f.Initialize(Me, "figcaption")
	f.SetID(fid)
	Return f
End Sub


'create figure
Sub figure(fid As String) As ReactElement
	Dim f As ReactElement
	f.Initialize(Me, "figure")
	f.SetID(fid)
	Return f
End Sub



'create horizontal rule
Sub hr(bc As Boolean) As ReactElement  'ignore
	Dim d As ReactElement
	d.Initialize(Me,"hr")
	Return d
End Sub


'create line break
Sub br(bc As Boolean) As ReactElement  'ignore
	Dim d As ReactElement
	d.Initialize(Me,"br")
	Return d
End Sub


'create sub
Sub subElement(sid As String) As ReactElement
	Dim s As ReactElement
	s.Initialize(Me, "sub")
	s.SetID(sid)
	Return s
End Sub

Sub strong(sid As String) As ReactElement
	Dim s As ReactElement
	s.Initialize(Me,"strong")
	s.SetID(sid)
	Return s
End Sub

'create em
Sub em(sid As String) As ReactElement
	Dim s As ReactElement
	s.Initialize(Me,"em")
	s.SetID(sid)
	Return s
End Sub


'create small
Sub small(sid As String) As ReactElement
	Dim s As ReactElement
	s.Initialize(Me,"small")
	s.SetID(sid)
	Return s
End Sub



'create a article
Sub article(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "article")
	d.SetID(z)
	Return d
End Sub

'create a legend
Sub legend(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "legend")
	d.SetID(z)
	Return d
End Sub


'create a fieldset
Sub fieldset(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "fieldset")
	d.SetID(z)
	Return d
End Sub

'create a iframe
Sub iframe(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "iframe")
	d.SetID(z) 
	Return d
End Sub

'create a canvas
Sub canvas(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "canvas")
	d.SetID(z) 
	Return d
End Sub


'create a audio
Sub audio(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "audio")
	d.SetID(z) 
	Return d
End Sub

'create a video
Sub video(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "video")
	d.SetID(z)
	Return d
End Sub


'create a source
Sub source(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "source")
	d.SetID(z) 
	Return d
End Sub

'create a code
Sub code(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "code")
	d.SetID(z) 
	Return d
End Sub


'create a caption
Sub caption(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "caption")
	d.SetID(z) 
	Return d
End Sub


'create a optgroup
Sub optgroup(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "optgroup")
	d.SetID(z) 
	Return d
End Sub


'create a span
Sub span(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "span") 
	d.SetID(z)
	Return d
End Sub

'create a table
Sub table(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "table") 
	d.SetID(z)
	Return d
End Sub

'create a table heading
Sub thead(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "thead")
	d.SetID(z)
	Return d
End Sub


'create a table body
Sub tbody(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "tbody")
	d.SetID(z)
	Return d
End Sub


'create a table data
Sub td(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "td")
	d.SetID(z)
	Return d
End Sub


'create a table row
Sub tr(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "tr")
	d.SetID(z)
	Return d
End Sub


'create a table heading
Sub th(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "th")
	d.SetID(z)
	Return d
End Sub

'create a label item
Sub label(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "label")
	d.SetID(z)
	Return d
End Sub

'create a text area item
Sub textarea(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "textarea")
	d.SetID(z)
	Return d
End Sub

'create a select item
Sub combo(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "select")
	d.SetID(z)
	Return d
End Sub


'create a pre item
Sub pre(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "pre")
	d.SetID(z)
	Return d
End Sub

'create a option item
Sub option(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "option")
	d.SetID(z)
	Return d
End Sub

'create a button item
Sub button(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "button")
	d.SetID(z)
	Return d
End Sub

'create an input item
Sub input(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "input")
	d.SetID(z)
	Return d
End Sub

'create a footer item
Sub footer(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "footer")
	d.SetID(z)
	Return d
End Sub

'create a list item
Sub li(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "li")
	d.SetID(z)
	Return d
End Sub

'create an unordered list
Sub ul(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "ul")
	d.SetID(z)
	Return d
End Sub

'create an anchor
Sub a(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "a")
	d.SetID(z)
	Return d
End Sub

'create an address
Sub address(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "address")
	d.SetID(z)
	Return d
End Sub


'create a bold
Sub b(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "b")
	d.SetID(z)
	Return d
End Sub


'create an icon
Sub i(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "i")
	d.SetID(z)
	Return d
End Sub

'create a paragraph
Sub p(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "p")
	d.SetID(z)
	Return d
End Sub

'create a h1
Sub h1(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h1")
	d.SetID(z)
	Return d
End Sub

'create a h2
Sub h2(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h2")
	d.SetID(z)
	Return d
End Sub

'create a h3
Sub h3(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h3")
	d.SetID(z)
	Return d
End Sub

'create a h4
Sub h4(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h4")
	d.SetID(z)
	Return d
End Sub

'create a h5
Sub h5(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h5")
	d.SetID(z)
	Return d
End Sub

'create a h6
Sub h6(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "h6")
	d.SetID(z)
	Return d
End Sub


'create a section
Sub section(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "section")
	d.SetID(z)
	Return d
End Sub

'create an ol
Sub ol(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "ol")
	d.SetID(z)
	Return d
End Sub


'create a form
Sub form(z As String) As ReactElement
	Dim d As ReactElement
	d.Initialize(Me, "form")
	d.SetID(z)
	Return d
End Sub


Sub iif(Expression2Evaluate As String, ReturnIfTrue As Object, ReturnIfFalse As Object) As Object
	If Expression2Evaluate = True Then Return ReturnIfTrue Else Return ReturnIfFalse
End Sub


Sub Capitalize(t As String) As String
	Dim s , r , o As String
	s = t.SubString2(0,1)
	r = t.SubString2(1, t.Length)
	o = s.ToUpperCase & r
	Return o
End Sub

Sub ProperCase(myStr As String) As String
	Try
		Dim x1 As String
		Dim j, k As Int
		myStr = myStr.tolowercase
		x1 = myStr.ToUpperCase.CharAt(0)
		myStr = x1 & myStr.SubString2(1, myStr.Length)
		For j = 1 To myStr.Length
			k = myStr.IndexOf2(" ", j + 1)
			If k = -1 Then Exit
			x1 = myStr.ToUpperCase.CharAt(k + 1)
			myStr = myStr.SubString2(0, k + 1) & x1 & myStr.SubString2(k + 2, myStr.Length)
		Next
		Return myStr
	Catch
		Return myStr
	End Try
End Sub


'format the text
Sub FormatText(sText As String) As String
	Dim RM As Map
	RM.Initialize
	RM.clear
	RM.Put("{U}", "<ins>")
	RM.Put("{/U}", "</ins>")
	RM.Put("¢","&cent;")
	RM.put("£","&pound;")
	RM.Put("{SUP}", "<sup>")
	RM.Put("{/SUP}", "</sup>")
	RM.Put("¥","&yen;")
	RM.Put("€","&euro;")
	RM.put("©","&copy;")
	RM.Put("®","&reg;")
	RM.Put("{POUND}","&pound;")
	RM.Put("{/B}", "</b>")
	RM.Put("{I}", "<i>")
	RM.Put("{YEN}","&yen;")
	RM.Put("{EURO}","&euro;")
	RM.Put("{CODE}","<code>")
	RM.Put("{/CODE}","</code>")
	RM.put("{COPYRIGHT}","&copy;")
	RM.Put("{REGISTERED}","&reg;")
	RM.Put("®", "&reg;")
	RM.Put("{B}", "<b>")
	RM.Put("{SMALL}", "<small>")
	RM.Put("{/SMALL}", "</small>")
	RM.Put("{EM}", "<em>")
	RM.Put("{/EM}", "</em>")
	RM.Put("{MARK}", "<mark>")
	RM.Put("{/MARK}", "</mark>")
	RM.Put("{/I}", "</i>")
	RM.Put("{SUB}", "<sub>")
	RM.Put("{/SUB}", "</sub>")
	RM.Put("{BR}", "<br/>")
	RM.Put("{WBR}","<wbr>")
	RM.Put("{STRONG}", "<strong>")
	RM.Put("{/STRONG}", "</strong>")
	RM.Put("{NBSP}", "&nbsp;")
	RM.Put("“","")
	RM.Put("”","")
	RM.Put("’","'")
	Dim kTot As Int = RM.Size - 1
	Dim kCnt As Int
	For kCnt = 0 To kTot
		Dim strValue As String = RM.GetKeyAt(kCnt)
		Dim strRep As String = RM.Get(strValue)
		sText = sText.Replace(strValue, strRep)
	Next
	Return sText
End Sub