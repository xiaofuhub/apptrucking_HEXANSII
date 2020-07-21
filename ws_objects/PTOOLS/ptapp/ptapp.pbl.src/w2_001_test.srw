HA$PBExportHeader$w2_001_test.srw
forward
global type w2_001_test from window
end type
type cb_1 from commandbutton within w2_001_test
end type
end forward

global type w2_001_test from window
integer width = 4754
integer height = 1980
boolean titlebar = true
string title = "Untitled"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_1 cb_1
end type
global w2_001_test w2_001_test

on w2_001_test.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w2_001_test.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w2_001_test
integer x = 654
integer y = 172
integer width = 402
integer height = 112
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "none"
end type

