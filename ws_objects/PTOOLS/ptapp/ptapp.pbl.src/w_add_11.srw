HA$PBExportHeader$w_add_11.srw
forward
global type w_add_11 from window
end type
type cb_1 from commandbutton within w_add_11
end type
end forward

global type w_add_11 from window
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
global w_add_11 w_add_11

on w_add_11.create
this.cb_1=create cb_1
this.Control[]={this.cb_1}
end on

on w_add_11.destroy
destroy(this.cb_1)
end on

type cb_1 from commandbutton within w_add_11
integer x = 1577
integer y = 584
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

