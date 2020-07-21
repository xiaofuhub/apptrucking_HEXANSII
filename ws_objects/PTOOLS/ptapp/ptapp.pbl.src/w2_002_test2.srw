HA$PBExportHeader$w2_002_test2.srw
forward
global type w2_002_test2 from window
end type
type cb_1 from commandbutton within w2_002_test2
end type
end forward

global type w2_002_test2 from window
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
global w2_002_test2 w2_002_test2

on w2_002_test2.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w2_002_test2.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w2_002_test2
integer x = 1198
integer y = 520
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

