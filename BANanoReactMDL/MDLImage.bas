B4J=true
Group=Default Group
ModulesStructureVersion=1
Type=Class
Version=7.51
@EndOfDesignText@
#IgnoreWarnings:12
Sub Class_Globals
	Public ID As String
	Private ImageInt As ReactElement
	Public HasContent As Boolean
End Sub

'initialize the image
Public Sub Initialize(BR As BANanoReact, sid As String) As MDLImage
	ImageInt = BR.img(sid)
	HasContent = False
	Return Me
End Sub

'add to parent
Sub Pop(parent As ReactElement)
	parent.AddElement(Image)
End Sub


'add a class
Sub AddClass(clsList As String) As MDLImage
	ImageInt.AddClass(clsList)
	HasContent = True
	Return Me
End Sub

'set properties
Sub SetProps(m As Map) As MDLImage
	ImageInt.SetProps(m)
	HasContent = True
	Return Me
End Sub

'set the source of the image
Sub SetSrc(url As String) As MDLImage
	ImageInt.SetSRC(url)
	HasContent = True
	Return Me
End Sub

'set the width of the image
Sub SetPropWidth(w As Object) As MDLImage
	ImageInt.SetPropWidth(w)
	HasContent = True
	Return Me
End Sub

'set the height style of the image
Sub SetPropHeight(h As Object) As MDLImage
	ImageInt.SetPropHeight(h)
	HasContent = True
	Return Me
End Sub

'set the width style of the image
Sub SetWidth(w As Object) As MDLImage
	ImageInt.SetWidth(w)
	HasContent = True
	Return Me
End Sub

'set the height style of the image
Sub SetHeight(h As Object) As MDLImage
	ImageInt.SetHeight(h)
	HasContent = True
	Return Me
End Sub

'set the style of the image
Sub SetStyle(m As Map) As MDLImage
	ImageInt.SetStyles(m)
	HasContent = True
	Return Me
End Sub

'set the border for the image
Sub SetBorder(b As Object) As MDLImage
	ImageInt.SetBorder(b)
	HasContent = True
	Return Me
End Sub

'set the border for the image
Sub SetPropBorder(b As Object) As MDLImage
	ImageInt.SetPropBorder(b)
	HasContent = True
	Return Me
End Sub

'set border radius
Sub SetBorderRadius(br As Object) As MDLImage
	ImageInt.SetStyle("borderRadius", br)
	HasContent = True
	Return Me
End Sub

'set the alt of the image
Sub SetAlt(a As Object) As MDLImage
	ImageInt.SetALT(a)
	HasContent = True
	Return Me
End Sub

'get the image
Sub Image As ReactElement
	Return ImageInt
End Sub