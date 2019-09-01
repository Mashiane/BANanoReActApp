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

Sub Show
	Dim app As ReactElement = BR.Initialize
	'add a menu
	app.AddBR
	app.AddReactElement(modReact.ExamplesMenu(BR))
	app.addhr
	
	'
	Dim h1 As ReactElement = BR.h1("").SetClassName("abc").SetTextAlign("center").SetOnClick(BANano.CallBack(Me,"h1_click",Null))
	h1.SetState("greeting", "World!")
	h1.AddChild("Hello " & h1.GetState("greeting"))
	'
	Dim p1 As ReactElement = BR.p("").SetLabel("A nice text paragraph!")
	'
	Dim inp1 As ReactElement = BR.input("inp1").SetType("text")
	'
	Dim pwd1 As ReactElement = BR.input("pwd1").SetType("password").SetDefaultValue("password")
	'
	Dim rad1 As ReactElement = BR.input("rad1").SetType("radio")
	'
	Dim chk1 As ReactElement = BR.input("").SetType("checkbox")
	
	Dim ta1 As ReactElement = BR.textarea("").SetDefaultValue("")
	'
	Dim fil1 As ReactElement = BR.input("fil1").SetType("file")
	'
	Dim num1 As ReactElement = BR.input("num1").SetType("number")
	'
	
	Dim sel1 As ReactElement = BR.combo("").SetDefaultValue("lime")
	Dim op1 As ReactElement = BR.option("").SetValue("grapefruit").SetLabel("Grapefruit")
	Dim op2 As ReactElement = BR.option("").SetValue("lime").SetLabel("Lime")
	Dim op3 As ReactElement = BR.option("").SetValue("coconut").SetLabel("Coconut")
	sel1.AddElements(Array(op1, op2, op3))
	'
	Dim btn As ReactElement = BR.button("").SetLabel("Button")
	'
	Dim imgx As ReactElement = BR.img("").SetSRC("./assets/image005.jpg")
	'
	Dim lbl1 As ReactElement = BR.label("").AddChild("This is a label!")
	'
	app.AddElements(Array(h1,p1,inp1,pwd1,rad1,ta1,fil1,num1,chk1,sel1,btn,imgx,lbl1))
	'
	app.Render("app")
End Sub

Sub h1_click
	BANano.Alert("h1 clicked!")
End Sub

