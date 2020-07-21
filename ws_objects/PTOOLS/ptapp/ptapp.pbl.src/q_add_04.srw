HA$PBExportHeader$q_add_04.srw
forward
global type q_add_04 from window
end type
type cb_1 from commandbutton within q_add_04
end type
end forward

global type q_add_04 from window
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
global q_add_04 q_add_04

on q_add_04.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on q_add_04.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within q_add_04
integer x = 937
integer y = 364
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

