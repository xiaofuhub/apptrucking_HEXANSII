HA$PBExportHeader$n_cst_dlk_init.sru
forward
global type n_cst_dlk_init from ofr_n_cst_dlk_init
end type
end forward

global type n_cst_dlk_init from ofr_n_cst_dlk_init
end type
global n_cst_dlk_init n_cst_dlk_init

on n_cst_dlk_init.create
TriggerEvent( this, "constructor" )
end on

on n_cst_dlk_init.destroy
TriggerEvent( this, "destructor" )
end on

