B4J=true
Group=Default Group\React
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12, 9
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
	Private ref As Map
	Private BANano As BANano   'ignore
	Private BanReact As BANanoReact
	'
	'Type background(backgroundAttachment As Object, backgroundColor As Object, backgroundImage As Object, backgroundPositionX As Object, backgroundPositionY As Object, backgroundRepeat As Object)
	'Type backgroundPosition(backgroundPositionX As Object, backgroundPositionY As Object)
	'Type border(borderWidth As Object, borderStyle As Object, borderColor As Object)
	'Type borderBottom(borderBottomWidth As Object, borderBottomStyle As Object, borderBottomColor As Object)
	'Type borderLeft(borderLeftWidth As Object, borderLeftStyle As Object, borderLeftColor As Object)
	'Type borderRight(borderRightWidth As Object, borderRightStyle As Object, borderRightColor As Object)
	'Type borderTop(borderTopWidth As Object, borderTopStyle As Object, borderTopColor As Object)
	'Type font(fontStyle As Object, fontVariant As Object, fontWeight As Object, fontSize As Object, lineHeight As Object, fontFamily As Object)
	'Type outline(outlineWidth As Object, outlineStyle As Object, outlineColor As Object)
	'Type position(position As Object, top As Object, bottom As Object, left As Object, right As Object)
End Sub

'initialize the react element
Public Sub Initialize(BR As BANanoReact, sTag As String) As ReactElement
	elTag = sTag.tolowercase
	props.Initialize 
	r = BR.React
	BanReact = BR
	children.Initialize 
	style.Initialize 
	classList.Initialize 
	className = ""
	state.Initialize
	ref.Initialize
	Return Me
End Sub

'set click event
Sub SetOnClick1(module As Object, method As String) As ReactElement
	Dim e As BANanoEvent
	Dim cb As BANanoObject = BANano.CallBack(module, method, Array(e))
	SetOnClick(cb)
	Return Me
End Sub

'render the element
Sub Render(elID As String)
	'render to the body
	BanReact.Render(Me,elID)
End Sub

'add class on condition
Sub AddClassOnCondition(b As Boolean, cls As String) As ReactElement
	If b Then
		AddClass(cls)
	End If
	Return Me
End Sub

'set default value
Sub SetDefaultValue(dv As Object) As ReactElement
	SetProp("defaultValue", dv)
	Return Me
End Sub

'set backgroundImage
Sub SetBackgroundImage(biURL As String) As ReactElement
	SetStyle("backgroundImage", $"url('${biURL}')"$)
	Return Me
End Sub

'set fontWeight
Sub SetFontWeight(w As Object) As ReactElement
	SetStyle("fontWeight", w)
	Return Me
End Sub

'set background image
Sub SetBackground(biURL As String) As ReactElement
	SetStyle("background", $"url('${biURL}')"$)
	Return Me
End Sub


'set backgroundRepeat
Sub SetBackgroundRepeat(rpt As Object) As ReactElement
	SetStyle("backgroundRepeat", rpt)
	Return Me
End Sub


'set backgroundSize
Sub SetBackgroundSize(rpt As Object) As ReactElement
	SetStyle("backgroundSize", rpt)
	Return Me
End Sub


'set backgroundColor
Sub SetBackgroundColor(rpt As Object) As ReactElement
	SetStyle("backgroundColor", rpt)
	Return Me
End Sub

'set backgroundPosition
Sub SetBackgroundPosition(rpt As Object) As ReactElement
	SetStyle("backgroundPosition", rpt)
	Return Me
End Sub

'set tabindex
Sub SetTabIndex(ti As String) As ReactElement
	SetStyle("tabIndex", ti)
	Return Me
End Sub

'set padding bottom
Sub SetPaddingBottom(PaddingBottom As String) As ReactElement
	SetStyle("paddingBottom", MakePx(PaddingBottom))
	Return Me
End Sub

'set padding right
Sub SetPaddingRight(PaddingRight As String) As ReactElement
	SetStyle("paddingRight", MakePx(PaddingRight))
	Return Me
End Sub

'set padding left
Sub SetPaddingLeft(PaddingLeft As String) As ReactElement
	SetStyle("paddingLeft", MakePx(PaddingLeft))
	Return Me
End Sub

'set padding top	
Sub SetPaddingTop(PaddingTop As String) As ReactElement
	SetStyle("paddingTop", MakePx(PaddingTop))
	Return Me
End Sub

'set marging
Sub SetMargin(MarginBottom As String) As ReactElement
	SetStyle("margin", MakePx(MarginBottom))
	Return Me
End Sub

'set margin bottom
Sub SetMarginBottom(MarginBottom As String) As ReactElement
	SetStyle("marginBottom", MakePx(MarginBottom))
	Return Me
End Sub

'margin right
Sub SetMarginRight(MarginRight As String) As ReactElement
	SetStyle("marginRight", MakePx(MarginRight))
	Return Me
End Sub

'margin left
Sub SetMarginLeft(MarginLeft As String) As ReactElement
	SetStyle("marginLeft", MakePx(MarginLeft))
	Return Me
End Sub
	
'margin top	
Sub SetMarginTop(MarginTop As String) As ReactElement
	SetStyle("marginTop", MakePx(MarginTop))
	Return Me
End Sub


'set the id of the element
Sub SetID(t As String) As ReactElement
	If t <> "" Then
		ID = t
		SetProp("id", ID)
	End If
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

'remove a class
Sub RemoveClass(cls As List) As ReactElement
	For Each strStyle As String In cls
		strStyle = strStyle.Trim
		If classList.ContainsKey(strStyle) Then
			classList.Remove(strStyle)
		End If
	Next
	Return Me
End Sub

'add multiple classes
Sub AddClasses(clsList As List) As ReactElement
	For Each strcls As String In clsList
		AddClass(strcls)
	Next
	Return Me
End Sub

'set the property
Sub SetProp(k As String, v As Object) As ReactElement
	If k = "class" Then
		AddClass(v)
		Return Me
	End If
	props.Put(k,v)
	Return Me	
End Sub

'set the ref property
Sub SetRef(k As String, v As Object) As ReactElement
	ref.Put(k,v)
	Return Me	
End Sub


'set the initial state
Sub SetState(k As String, v As Object) As ReactElement
	state.Put(k, v)
	Return Me	
End Sub

'set multiple states
Sub SetStates(m As Map) As ReactElement
	For Each k As String In m.Keys
		Dim v As Object = m.Get(k)
		SetState(k, v)
	Next
	Return Me
End Sub

'set for / set htmlfor
Sub SetFor(k As String) As ReactElement
	SetProp("htmlFor",k)
	Return Me
End Sub

'set font family
Sub SetFontFamily(f As Object) As ReactElement   'ignore
	SetStyle("fontFamily", f)
	Return Me
End Sub

'set width
Sub SetWidth(w As Object) As ReactElement
	SetStyle("width", MakePx(w))
	Return Me
End Sub

'set min width
Sub SetMinWidth(w As Object) As ReactElement
	SetStyle("minWidth", MakePx(w))
	Return Me
End Sub

'set min height
Sub SetMinHeight(w As Object) As ReactElement
	SetStyle("minHeight", MakePx(w))
	Return Me
End Sub

'set max height
Sub SetMaxHeight(w As Object) As ReactElement
	SetStyle("maxHeight", MakePx(w))
	Return Me
End Sub

'set min height
Sub SetMaxWidth(w As Object) As ReactElement
	SetStyle("maxWidth", MakePx(w))
	Return Me
End Sub

'set border
Sub SetBorder(w As Object) As ReactElement
	SetStyle("border", w)
	Return Me
End Sub
	
'set border top
Sub SetBorderTop(w As Object) As ReactElement
	SetStyle("borderTop", w)
	Return Me
End Sub

'set border bottom
Sub SetBorderBottom(w As Object) As ReactElement
	SetStyle("borderBottom", w)
	Return Me
End Sub

'set border left
Sub SetBorderLeft(w As Object) As ReactElement
	SetStyle("borderLeft", w)
	Return Me
End Sub

'set border right
Sub SetBorderRight(w As Object) As ReactElement
	SetStyle("borderRight", w)
	Return Me
End Sub


'set border radius
Sub SetBorderRadius(w As Object) As ReactElement
	SetStyle("borderRadius", w)
	Return Me
End Sub


'set height
Sub SetHeight(h As String) As ReactElement
	SetStyle("height", MakePx(h))
	Return Me
End Sub


'set font size
Sub SetFontSize(f As Object) As ReactElement   'ignore
	SetStyle("fontSize", MakePx(f))
	Return Me
End Sub

'set style color
Sub SetColor(k As String) As ReactElement
	SetStyle("color",k)
	Return Me
End Sub

'set style padding
Sub SetPadding(k As String) As ReactElement
	SetStyle("padding",k)
	Return Me
End Sub

'set text align
Sub SetTextAlign(ta As Object) As ReactElement
	SetStyle("textAlign", ta)
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
	AddChild(props.Get("label"))
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
	If propsMap = Null Then Return Me
	For Each k As String In propsMap.Keys
		Dim v As Object = propsMap.Get(k)
		'is it a style
		If k.StartsWith("style.") Then
			Dim styleName As String = MvField(k,2,".")
			SetStyle(styleName, v)
		Else	
			SetProp(k,v)
		End If
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

'add a child object (BANanoObject or String)
Sub AddChild(child As Object) As ReactElement
	If GetType(child) = "string" Then
		child = BanReact.FormatText(child)
	End If
	children.Add(child)
	Return Me
End Sub

'add a react element child
Sub AddElement(child As ReactElement) As ReactElement
	child.CreateElement
	children.Add(child.element)
	Return Me
End Sub

'add a child react element to this
Sub AddReactElement(child As ReactElement) As ReactElement
	AddElement(child)
	Return Me
End Sub

'add horizontal rule
Sub AddHR
	AddElement(BanReact.hr(True))
End Sub

'add line break
Sub AddBR
	AddElement(BanReact.br(True))
End Sub


'add a react element child
Sub AddElements(childrenList As List) As ReactElement
	For Each re As ReactElement In childrenList
		AddElement(re)
	Next
	Return Me
End Sub

'add a react element child
Sub AddReactElements(childrenList As List) As ReactElement
	AddElements(childrenList)
	Return Me
End Sub

'set the title
Sub SetTitle(stitle As String) As ReactElement
	SetProp("title", stitle)
	Return Me
End Sub

'set hidden
Sub SetHidden(b As Boolean) As ReactElement
	SetProp("hidden", b)
	Return Me
End Sub


'set checked
Sub SetChecked(b As Boolean) As ReactElement
	SetProp("checked", b)
	Return Me
End Sub

'set auto complete
Sub SetAutoCompleeOn(b As Boolean) As ReactElement
	If b Then
		SetProp("autoComplete", b)
	End If
	Return Me
End Sub

'set auto focus
Sub SetAutoFocus(b As Boolean) As ReactElement
	If b Then
		SetProp("autoFocus", b)
	End If
	Return Me
End Sub

'set rel
Sub SetRel(rel As String) As ReactElement
	SetProp("rel", rel)
	Return Me
End Sub


'add to parent
Sub Pop(parent As ReactElement)
	CreateElement
	parent.AddChild(Element)
End Sub

'create the element
Sub CreateElement
	If ref.Size > 0 Then
		props.Put("ref", ref)
	End If
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
	Case "input", "img", "textarea", "hr", "br"
		Element = r.RunMethod("createElement", Array(elTag, props))
	Case Else
		'apply template
'		Dim tChild As Int = children.Size - 1
'		Dim cChild As Int = 0
'		For cChild = 0 To tChild
'			Dim child1 As Object = children.Get(cChild)
'			Dim typeof As String = GetType(child1)
'			Select Case typeof
'			Case "string"
'				child1 = template(child1)
'				children.Set(cChild, child1)	
'			End Select
'		Next
		If children.Size = 0 Then
			Element = r.RunMethod("createElement", Array(elTag, props))
		Else
			Element = r.RunMethod("createElement", Array(elTag, props, children))
		End If
	End Select
End Sub

'get the state
Sub GetState(prop As String) As Object
	If state.ContainsKey(prop) Then
		Dim v As Object = state.Get(prop)
		Return v
	Else
		Return ""
	End If
End Sub

'get the property
Sub GetProp(prop As String) As Object
	If props.ContainsKey(prop) Then
		Dim v As Object = props.Get(prop)
		Return v
	Else
		Return ""
	End If
End Sub


'update the state
'Sub SetState(k as string, v as object)
'	Element.RunMethod("setState", Array(k, v))
'End Sub

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

'on mousedown
Sub SetOnMouseDown(cb As BANanoObject) As ReactElement
	SetProp("onMouseDown", cb)
	Return Me
End Sub

'on mouseout
Sub SetOnMouseOut(cb As BANanoObject) As ReactElement
	SetProp("onMouseOut", cb)
	Return Me
End Sub


'on mouseover
Sub SetOnMouseOver(cb As BANanoObject) As ReactElement
	SetProp("onMouseOver", cb)
	Return Me
End Sub



'on mouseup
Sub SetOnMouseUp(cb As BANanoObject) As ReactElement
	SetProp("onMouseUp", cb)
	Return Me
End Sub


'on mousemove
Sub SetOnMouseMove(cb As BANanoObject) As ReactElement
	SetProp("onMouseMove", cb)
	Return Me
End Sub


'on double click
Sub SetOnDblClick(cb As BANanoObject) As ReactElement
	SetProp("onDoubleClick", cb)
	Return Me
End Sub


'on select
Sub SetOnSelect(cb As BANanoObject) As ReactElement
	SetProp("onSelect", cb)
	Return Me
End Sub


'on click event
Sub SetOnClick(cb As BANanoObject) As ReactElement
	SetProp("onClick", cb)
	Return Me
End Sub

'on focus
Sub SetOnFocus(cb As BANanoObject) As ReactElement
	SetProp("onFocus", cb)
	Return Me
End Sub

'on submit
Sub SetOnSubmit(cb As BANanoObject) As ReactElement
	SetProp("onSubmit", cb)
	Return Me
End Sub

'on input
Sub SetOnInput(cb As BANanoObject) As ReactElement
	SetProp("onInput", cb)
	Return Me
End Sub


'on drag
Sub SetOnDrag(cb As BANanoObject) As ReactElement
	SetProp("onDrag", cb)
	Return Me
End Sub

'on drag end
Sub SetOnDragEnd(cb As BANanoObject) As ReactElement
	SetProp("onDragEnd", cb)
	Return Me
End Sub

'on drag enter
Sub SetOnDragEnter(cb As BANanoObject) As ReactElement
	SetProp("onDragEnter", cb)
	Return Me
End Sub


'on drag exit
Sub SetOnDragExit(cb As BANanoObject) As ReactElement
	SetProp("onDragExit", cb)
	Return Me
End Sub


'on drag leave
Sub SetOnDragLeave(cb As BANanoObject) As ReactElement
	SetProp("onDragLeave", cb)
	Return Me
End Sub


'on drag over
Sub SetOnDragOver(cb As BANanoObject) As ReactElement
	SetProp("onDragOver", cb)
	Return Me
End Sub


'on drag start
Sub SetOnDragStart(cb As BANanoObject) As ReactElement
	SetProp("onDragStart", cb)
	Return Me
End Sub

'on drop
Sub SetOnDop(cb As BANanoObject) As ReactElement
	SetProp("onDrop", cb)
	Return Me
End Sub


'on blur
Sub SetOnBlur(cb As BANanoObject) As ReactElement
	SetProp("onBlur", cb)
	Return Me
End Sub


'on change event
Sub SetOnChange(cb As BANanoObject) As ReactElement
	SetProp("onChange", cb)
	Return Me
End Sub

'on key down
Sub SetOnKeyDown(cb As BANanoObject) As ReactElement
	SetProp("onKeyDown", cb)
	Return Me
End Sub

'on key press
Sub SetOnKeyPress(cb As BANanoObject) As ReactElement
	SetProp("onKeyPress", cb)
	Return Me
End Sub

'on key up
Sub SetOnKeyUp(cb As BANanoObject) As ReactElement
	SetProp("onKeyUp", cb)
	Return Me
End Sub

'replace all bracket things
private Sub template(sout As String) As Object
	For Each mk As String In state.Keys
		Dim mv As Object = state.Get(mk)
		Dim tag As String = $"{${mk}}"$
		sout = sout.Replace(tag,mv)
	Next
	Return sout
End Sub

private Sub MakePx(sValue As String) As String
	sValue = sValue.trim
	If sValue.EndsWith("%") Then
		Return sValue
	else If sValue.EndsWith("vm") Then
		Return sValue
	else If sValue.EndsWith("px") Then
		Return sValue
	else If sValue.EndsWith("cm") Then
		Return sValue
	else If sValue.EndsWith("mm") Then
		Return sValue
	else If sValue.EndsWith("in") Then
		Return sValue
	else If sValue.EndsWith("pt") Then
		Return sValue
	else If sValue.EndsWith("pc") Then
		Return sValue
	else If sValue.EndsWith("em") Then
		Return sValue
	else If sValue.EndsWith("ex") Then
		Return sValue
	else If sValue.EndsWith("ch") Then
		Return sValue
	else If sValue.EndsWith("rem") Then
		Return sValue
	else If sValue.EndsWith("vw") Then
		Return sValue
	else If sValue.EndsWith("vh") Then
		Return sValue
	else If sValue.EndsWith("vmin") Then
		Return sValue
	else If sValue.EndsWith("vmax") Then
		Return sValue
	else If sValue.EndsWith(";") Then
		Return sValue
	Else
		sValue = sValue.Replace("px","")
		sValue = $"${sValue}px"$
		If sValue = "px" Then sValue = ""
		Return sValue
	End If
End Sub

'set zindex
Sub SetZIndex(zindex As String) As ReactElement
	SetStyle("zIndex",zindex)
	Return Me
End Sub

'set src
Sub SetSRC(sValue As String) As ReactElement
	SetProp("src",sValue)
	Return Me
End Sub


'set selected
Sub SetSelected(b As Boolean) As ReactElement
	SetProp("selected", b)
	Return Me
End Sub

'set max
Sub SetMax(m As Object) As ReactElement
	SetProp("max", m)
	Return Me
End Sub

'set min
Sub SetMin(m As Object) As ReactElement
	SetProp("min", m)
	Return Me
End Sub

'set alt
Sub SetALT(sValue As String) As ReactElement
	SetProp("alt",sValue)
	Return Me
End Sub

''set list style circle
Sub SetListTypeCircle(b As Boolean) As ReactElement
	SetStyle("listStyleType", "circle")
	Return Me
End Sub

'set list style disk
Sub SetListTypeDisk(b As Boolean) As ReactElement
	SetStyle("listStyleType", "disk")
	Return Me
End Sub

'set list style none
Sub SetListTypeNone(b As Boolean) As ReactElement
	SetStyle("listStyleType", "none")
	Return Me
End Sub

'set list style squre
Sub SetListTypeSquare(b As Boolean) As ReactElement
	SetStyle("listStyleType", "square")
	Return Me
End Sub

'format the text
private Sub FormatText(sText As String) As String
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


'mvfield sub
private Sub MvField(sValue As String, iPosition As Int, Delimiter As String) As String
	If sValue.Length = 0 Then Return ""
	Dim xPos As Int = sValue.IndexOf(Delimiter)
	If xPos = -1 Then Return sValue
	Dim mValues As List = StrParse(Delimiter,sValue)
	Dim tValues As Int
	tValues = mValues.size -1
	Select Case iPosition
		Case -1
			Return mValues.get(tValues)
		Case -2
			Return mValues.get(tValues - 1)
		Case -3
			Dim sb As StringBuilder
			sb.Initialize
			Dim startcnt As Int
			sb.Append(mValues.Get(1))
			For startcnt = 2 To tValues
				sb.Append(Delimiter)
				sb.Append(mValues.get(startcnt))
			Next
			Return sb.tostring
		Case Else
			iPosition = iPosition - 1
			If iPosition <= -1 Then
				Return mValues.get(tValues)
			End If
			If iPosition > tValues Then
				Return ""
			End If
			Return mValues.get(iPosition)
	End Select
End Sub


' parse a string to a list
private Sub StrParse(Delim As String, InputString As String) As List
	Dim OutList As List
	Dim CommaLoc As Int
	OutList.Initialize
	OutList.clear
	CommaLoc=InputString.IndexOf(Delim)
	Do While CommaLoc >-1
		Dim LeftSide As String
		LeftSide= InputString.SubString2(0,CommaLoc)
		Dim RightSide As String
		RightSide= InputString.SubString(CommaLoc+1)
		OutList.Add(LeftSide)
		InputString=RightSide
		CommaLoc=InputString.IndexOf(Delim)
	Loop
	OutList.Add(InputString)
	Return OutList
End Sub

Sub SetAccept(o As Object) As ReactElement
	SetProp("accept", o)
	Return Me
End Sub

'set acceptCharset
Sub SetAcceptCharset(o As Object) As ReactElement
	SetProp("acceptCharset", o)
	Return Me
End Sub

'set accessKey
Sub SetAccessKey(o As Object) As ReactElement
	SetProp("accessKey", o)
	Return Me
End Sub

'set allowFullScreen
Sub SetAllowFullScreen(o As Object) As ReactElement 
			SetProp("allowFullScreen", o) 
			Return Me 
			End Sub

'set async
Sub SetAsync(o As Object) As ReactElement 
			SetProp("async", o) 
			Return Me 
			End Sub

'set autoComplete
Sub SetAutoComplete(o As Object) As ReactElement 
			SetProp("autoComplete", o) 
			Return Me 
			End Sub

'set autoPlay
Sub SetAutoPlay(o As Object) As ReactElement 
			SetProp("autoPlay", o) 
			Return Me 
			End Sub

'set capture
Sub SetCapture(o As Object) As ReactElement 
			SetProp("capture", o) 
			Return Me 
			End Sub

'set cellPadding
Sub SetCellPadding(o As Object) As ReactElement 
			SetProp("cellPadding", o) 
			Return Me 
			End Sub

'set cellSpacing
Sub SetCellSpacing(o As Object) As ReactElement 
			SetProp("cellSpacing", o) 
			Return Me 
			End Sub

'set challenge
Sub SetChallenge(o As Object) As ReactElement 
			SetProp("challenge", o) 
			Return Me 
			End Sub

'set charSet
Sub SetCharSet(o As Object) As ReactElement 
			SetProp("charSet", o) 
			Return Me 
			End Sub

'set cite
Sub SetCite(o As Object) As ReactElement 
			SetProp("cite", o) 
			Return Me 
			End Sub

'set classID
Sub SetClassID(o As Object) As ReactElement 
			SetProp("classID", o) 
			Return Me 
			End Sub

'set colSpan
Sub SetColSpan(o As Object) As ReactElement 
			SetProp("colSpan", o) 
			Return Me 
			End Sub

'set cols
Sub SetCols(o As Object) As ReactElement 
			SetProp("cols", o) 
			Return Me 
			End Sub

'set content
Sub SetContent(o As Object) As ReactElement 
			SetProp("content", o) 
			Return Me 
			End Sub

'set contentEditable
Sub SetContentEditable(o As Object) As ReactElement 
			SetProp("contentEditable", o) 
			Return Me 
			End Sub

'set contextMenu
Sub SetContextMenu(o As Object) As ReactElement 
			SetProp("contextMenu", o) 
			Return Me 
			End Sub

'set controls
Sub SetControls(o As Object) As ReactElement 
			SetProp("controls", o) 
			Return Me 
			End Sub

'set controlsList
Sub SetControlsList(o As Object) As ReactElement 
			SetProp("controlsList", o) 
			Return Me 
			End Sub

'set coords
Sub SetCoords(o As Object) As ReactElement 
			SetProp("coords", o) 
			Return Me 
			End Sub

'set crossOrigin
Sub SetCrossOrigin(o As Object) As ReactElement 
			SetProp("crossOrigin", o) 
			Return Me 
			End Sub

'set dateTime
Sub SetDateTime(o As Object) As ReactElement 
			SetProp("dateTime", o) 
			Return Me 
			End Sub

'set default
Sub SetDefault(o As Object) As ReactElement 
			SetProp("default", o) 
			Return Me 
			End Sub

'set defer
Sub SetDefer(o As Object) As ReactElement 
			SetProp("defer", o) 
			Return Me 
			End Sub

'set dir
Sub SetDir(o As Object) As ReactElement 
			SetProp("dir", o) 
			Return Me 
			End Sub

'set disabled
Sub SetDisabled(o As Object) As ReactElement 
			SetProp("disabled", o) 
			Return Me 
			End Sub

'set download
Sub SetDownload(o As Object) As ReactElement 
			SetProp("download", o) 
			Return Me 
			End Sub

'set draggable
Sub SetDraggable(o As Object) As ReactElement 
			SetProp("draggable", o) 
			Return Me 
			End Sub

'set encType
Sub SetEncType(o As Object) As ReactElement 
			SetProp("encType", o) 
			Return Me 
			End Sub

'set form
Sub SetForm(o As Object) As ReactElement 
			SetProp("form", o) 
			Return Me 
			End Sub

'set formAction
Sub SetFormAction(o As Object) As ReactElement 
			SetProp("formAction", o) 
			Return Me 
			End Sub

'set formEncType
Sub SetFormEncType(o As Object) As ReactElement 
			SetProp("formEncType", o) 
			Return Me 
			End Sub

'set formMethod
Sub SetFormMethod(o As Object) As ReactElement 
			SetProp("formMethod", o) 
			Return Me 
			End Sub

'set formNoValidate
Sub SetFormNoValidate(o As Object) As ReactElement 
			SetProp("formNoValidate", o) 
			Return Me 
			End Sub

'set formTarget
Sub SetFormTarget(o As Object) As ReactElement
	SetProp("formTarget", o)
	Return Me
End Sub
			
Sub SetFrameBorder(o As Object) As ReactElement
	SetProp("frameBorder", o)
	Return Me
End Sub

'set headers
Sub SetHeaders(o As Object) As ReactElement
	SetProp("headers", o)
	Return Me
End Sub

'set height
Sub SetPropHeight(o As Object) As ReactElement 
SetProp("height", o) 
Return Me 
End Sub


'set high
Sub SetHigh(o As Object) As ReactElement 
SetProp("high", o) 
Return Me 
End Sub


'set hrefLang
Sub SetHrefLang(o As Object) As ReactElement 
SetProp("hrefLang", o) 
Return Me 
End Sub

'set htmlFor
Sub SetHtmlFor(o As Object) As ReactElement 
SetProp("htmlFor", o) 
Return Me 
End Sub

'set httpEquiv
Sub SetHttpEquiv(o As Object) As ReactElement 
SetProp("httpEquiv", o) 
Return Me 
End Sub

'set icon
Sub SetIcon(o As Object) As ReactElement 
SetProp("icon", o) 
Return Me 
End Sub

'set inputMode
Sub SetInputMode(o As Object) As ReactElement 
SetProp("inputMode", o) 
Return Me 
End Sub

'set integrity
Sub SetIntegrity(o As Object) As ReactElement 
SetProp("integrity", o) 
Return Me 
End Sub

'set is
Sub SetIs(o As Object) As ReactElement 
SetProp("is", o) 
Return Me 
End Sub

'set keyParams
Sub SetKeyParams(o As Object) As ReactElement 
SetProp("keyParams", o) 
Return Me 
End Sub

'set keyType
Sub SetKeyType(o As Object) As ReactElement 
SetProp("keyType", o) 
Return Me 
End Sub

'set kind
Sub SetKind(o As Object) As ReactElement 
SetProp("kind", o) 
Return Me 
End Sub

'set lang
Sub SetLang(o As Object) As ReactElement 
SetProp("lang", o) 
Return Me 
End Sub

'set list
Sub SetList(o As Object) As ReactElement 
SetProp("list", o) 
Return Me 
End Sub

'set loop
Sub SetLoop(o As Object) As ReactElement 
SetProp("loop", o) 
Return Me 
End Sub

'set low
Sub SetLow(o As Object) As ReactElement 
SetProp("low", o) 
Return Me 
End Sub

'set manifest
Sub SetManifest(o As Object) As ReactElement 
SetProp("manifest", o) 
Return Me 
End Sub

'set marginHeight
Sub SetMarginHeight(o As Object) As ReactElement 
SetProp("marginHeight", o) 
Return Me 
End Sub

'set marginWidth
Sub SetMarginWidth(o As Object) As ReactElement 
SetProp("marginWidth", o) 
Return Me 
End Sub

'set maxLength
Sub SetMaxLength(o As Object) As ReactElement 
SetProp("maxLength", o) 
Return Me 
End Sub

'set media
Sub SetMedia(o As Object) As ReactElement 
SetProp("media", o) 
Return Me 
End Sub

'set mediaGroup
Sub SetMediaGroup(o As Object) As ReactElement 
SetProp("mediaGroup", o) 
Return Me 
End Sub

'set method
Sub SetMethod(o As Object) As ReactElement 
SetProp("method", o) 
Return Me 
End Sub

'set minLength
Sub SetMinLength(o As Object) As ReactElement 
SetProp("minLength", o) 
Return Me 
End Sub

'set multiple
Sub SetMultiple(o As Object) As ReactElement 
SetProp("multiple", o) 
Return Me 
End Sub

'set muted
Sub SetMuted(o As Object) As ReactElement 
SetProp("muted", o) 
Return Me 
End Sub

'set noValidate
Sub SetNoValidate(o As Object) As ReactElement 
SetProp("noValidate", o) 
Return Me 
End Sub

'set nonce
Sub SetNonce(o As Object) As ReactElement 
SetProp("nonce", o) 
Return Me 
End Sub

'set open
Sub SetOpen(o As Object) As ReactElement 
SetProp("open", o) 
Return Me 
End Sub

'set optimum
Sub SetOptimum(o As Object) As ReactElement 
SetProp("optimum", o) 
Return Me 
End Sub

'set pattern
Sub SetPattern(o As Object) As ReactElement 
SetProp("pattern", o) 
Return Me 
End Sub

'set poster
Sub SetPoster(o As Object) As ReactElement 
SetProp("poster", o) 
Return Me 
End Sub

'set preload
Sub SetPreload(o As Object) As ReactElement 
SetProp("preload", o) 
Return Me 
End Sub

'set profile
Sub SetProfile(o As Object) As ReactElement 
SetProp("profile", o) 
Return Me 
End Sub

'set radioGroup
Sub SetRadioGroup(o As Object) As ReactElement 
SetProp("radioGroup", o) 
Return Me 
End Sub

'set readOnly
Sub SetReadOnly(o As Object) As ReactElement 
SetProp("readOnly", o) 
Return Me 
End Sub

'set required
Sub SetRequired(o As Object) As ReactElement 
SetProp("required", o) 
Return Me 
End Sub

'set reversed
Sub SetReversed(o As Object) As ReactElement 
SetProp("reversed", o) 
Return Me 
End Sub

'set role
Sub SetRole(o As Object) As ReactElement 
SetProp("role", o) 
Return Me 
End Sub

'set rowSpan
Sub SetRowSpan(o As Object) As ReactElement 
SetProp("rowSpan", o) 
Return Me 
End Sub

'set rows
Sub SetRows(o As Object) As ReactElement 
SetProp("rows", o) 
Return Me 
End Sub

'set sandbox
Sub SetSandbox(o As Object) As ReactElement 
SetProp("sandbox", o) 
Return Me 
End Sub

'set scope
Sub SetScope(o As Object) As ReactElement 
SetProp("scope", o) 
Return Me 
End Sub

'set scoped
Sub SetScoped(o As Object) As ReactElement 
SetProp("scoped", o) 
Return Me 
End Sub

'set scrolling
Sub SetScrolling(o As Object) As ReactElement 
SetProp("scrolling", o) 
Return Me 
End Sub

'set seamless
Sub SetSeamless(o As Object) As ReactElement 
SetProp("seamless", o) 
Return Me 
End Sub

'set shape
Sub SetShape(o As Object) As ReactElement 
SetProp("shape", o) 
Return Me 
End Sub

'set size
Sub SetSize(o As Object) As ReactElement 
SetProp("size", o) 
Return Me 
End Sub

'set sizes
Sub SetSizes(o As Object) As ReactElement 
SetProp("sizes", o) 
Return Me 
End Sub

'set span
Sub SetSpan(o As Object) As ReactElement 
SetProp("span", o) 
Return Me 
End Sub

'set spellCheck
Sub SetSpellCheck(o As Object) As ReactElement 
SetProp("spellCheck", o) 
Return Me 
End Sub

'set srcDoc
Sub SetSrcDoc(o As Object) As ReactElement 
SetProp("srcDoc", o) 
Return Me 
End Sub

'set srcLang
Sub SetSrcLang(o As Object) As ReactElement 
SetProp("srcLang", o) 
Return Me 
End Sub

'set srcSet
Sub SetSrcSet(o As Object) As ReactElement 
SetProp("srcSet", o) 
Return Me 
End Sub

'set start
Sub SetStart(o As Object) As ReactElement 
SetProp("start", o) 
Return Me 
End Sub

'set step
Sub SetStep(o As Object) As ReactElement 
SetProp("step", o) 
Return Me 
End Sub

'set summary
Sub SetSummary(o As Object) As ReactElement 
SetProp("summary", o) 
Return Me 
End Sub

'set useMap
Sub SetUseMap(o As Object) As ReactElement 
SetProp("useMap", o) 
Return Me 
End Sub

'set width
Sub SetPropWidth(o As Object) As ReactElement 
SetProp("width", o) 
Return Me 
End Sub

'set border
Sub SetPropBorder(o As Object) As ReactElement 
SetProp("border", o) 
Return Me 
End Sub


'set wmode
Sub SetWmode(o As Object) As ReactElement 
SetProp("wmode", o) 
Return Me 
End Sub

'set wrap
Sub SetWrap(o As Object) As ReactElement 
SetProp("wrap", o) 
Return Me 
End Sub	

'remove prop
Sub RemoveProp(prop As Object) As ReactElement
	If props.ContainsKey(prop) Then
		props.Remove(prop)		
	End If
	Return Me
End Sub