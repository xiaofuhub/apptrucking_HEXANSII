HA$PBExportHeader$n_cst_setting_pathtoedi210exportfolder.sru
forward
global type n_cst_setting_pathtoedi210exportfolder from n_cst_syssettings_folders
end type
end forward

global type n_cst_setting_pathtoedi210exportfolder from n_cst_syssettings_folders
end type
global n_cst_setting_pathtoedi210exportfolder n_cst_setting_pathtoedi210exportfolder

forward prototypes
public function string of_getvalue ()
public function integer of_savevalue (any aa_value)
end prototypes

public function string of_getvalue ();String 	ls_Value
Any 		la_Value

n_cst_Settings lnv_settings

lnv_settings.of_GetSetting(116,la_Value)

ls_Value = String(la_Value)

Return ls_Value


end function

public function integer of_savevalue (any aa_value);Int li_ReturnValue = 1
String ls_Value

n_cst_Settings lnv_settings

ls_Value = String(aa_Value)

IF Not IsNull(ls_Value) THEN
	This.of_SetSetting(116,ls_Value,lnv_settings.cs_datatype_string)
ELSE
	li_ReturnValue = -1 
END IF

Return li_ReturnValue


end function

on n_cst_setting_pathtoedi210exportfolder.create
call super::create
end on

on n_cst_setting_pathtoedi210exportfolder.destroy
call super::destroy
end on

event constructor;call super::constructor;is_propertytextlabel = "Full Path to EDI 210 Export Folder."
end event

