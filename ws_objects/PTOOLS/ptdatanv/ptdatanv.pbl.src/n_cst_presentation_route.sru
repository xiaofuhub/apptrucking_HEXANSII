HA$PBExportHeader$n_cst_presentation_route.sru
forward
global type n_cst_presentation_route from n_cst_presentation
end type
end forward

global type n_cst_presentation_route from n_cst_presentation
end type

forward prototypes
private function integer of_getvaluelist (string as_columnname, ref string as_valuelist)
public function integer of_setpresentation (powerobject apo_target, string as_objectname)
end prototypes

private function integer of_getvaluelist (string as_columnname, ref string as_valuelist);//Returns: 1 = Success, 0 = Column not found, -1 = Error

Integer	li_Return
String	ls_ValueList

li_Return = 1
as_ValueList = ""

CHOOSE CASE as_ColumnName

CASE "type"
	ls_ValueList = gc_Dispatch.cs_RouteType_Pickup + "~t" + gc_Dispatch.cs_RouteType_Pickup +&
					"/" + gc_Dispatch.cs_RouteType_Deliver + "~t" + gc_Dispatch.cs_RouteType_Deliver +&
					"/" + gc_Dispatch.cs_RouteType_Any + "~t" + gc_Dispatch.cs_RouteType_Any + "/"

CASE ELSE						
	li_Return = 0

END CHOOSE

IF li_Return = 1 THEN
	as_ValueList = "Values = '" + ls_ValueList + "'"
END IF


RETURN li_Return
				
end function

public function integer of_setpresentation (powerobject apo_target, string as_objectname);

String	lsa_Settings[], &
			ls_ValueList, &
			ls_Work
Integer	li_Count, &
			li_Index, &
			li_Return


li_Return = 1
as_ObjectName = Lower ( as_ObjectName )


CHOOSE CASE as_ObjectName


//***Route Table***

CASE "type"
	IF This.of_GetValueList ( as_ObjectName, ls_ValueList ) = 1 THEN
		lsa_Settings = { "Edit.CodeTable = Yes", ls_ValueList, "ddlb.UseAsBorder = No" }
	ELSE
		li_Return = -1
	END IF
END CHOOSE

IF li_Return = 1 THEN

	li_Count = UpperBound ( lsa_Settings )
	
	FOR li_Index = 1 TO li_Count
	
		apo_Target.Dynamic Modify ( as_ObjectName + "." + lsa_Settings [ li_Index ] )
	
	NEXT

END IF

RETURN li_Return

end function

on n_cst_presentation_route.create
TriggerEvent( this, "constructor" )
end on

on n_cst_presentation_route.destroy
TriggerEvent( this, "destructor" )
end on

