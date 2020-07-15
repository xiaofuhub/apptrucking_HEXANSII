HA$PBExportHeader$pfc_n_tmg.sru
$PBExportComments$PFC Timing Class
forward
global type pfc_n_tmg from timing
end type
end forward

global type pfc_n_tmg from timing
end type
global pfc_n_tmg pfc_n_tmg

type variables
Public:
n_cst_tmgsingle 	inv_single
n_cst_tmgmultiple 	inv_multiple
end variables

forward prototypes
public function integer of_setmultiple (boolean ab_switch)
public function integer of_setsingle (boolean ab_switch)
end prototypes

public function integer of_setmultiple (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetMultiple
//
//	(Arguments: boolean
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	Returns:  		Integer
//	 1 - Successful operation.
//	 0 - No action taken.
//	 -1 - An error was encountered.
//
//	Description:
// Starts or stops the Multiple Notify Service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

//Cannot be turned on if the Single service is on.
If ab_switch And IsValid(inv_single) Then Return -1

IF ab_Switch THEN
	IF IsNull(inv_multiple) Or Not IsValid (inv_multiple) THEN
		inv_multiple = Create n_cst_tmgmultiple
		inv_multiple.of_SetRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_multiple) THEN
		Destroy inv_multiple
		Return 1
	END IF	
END IF

Return 0
end function

public function integer of_setsingle (boolean ab_switch);//////////////////////////////////////////////////////////////////////////////
//
//	Event:  of_SetSingle
//
//	(Arguments: boolean
//   TRUE  - Start (create) the service
//   FALSE - Stop (destroy ) the service
//
//	Returns:  		Integer
//	 1 - Successful operation.
//	 0 - No action taken.
//	 -1 - An error was encountered.
//
//	Description:
// Starts or stops the Single Notify Service.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

//Check arguments
If IsNull(ab_switch) Then
	Return -1
End If

//Cannot be turned on if the Multiple service is on.
If ab_switch And IsValid(inv_multiple) Then Return -1

IF ab_Switch THEN
	IF IsNull(inv_single) Or Not IsValid (inv_single) THEN
		inv_single = Create n_cst_tmgsingle
		inv_single.of_SetRequestor ( this )
		Return 1
	END IF
ELSE 
	IF IsValid (inv_single) THEN
		Destroy inv_single
		Return 1
	END IF	
END IF

Return 0
end function

on pfc_n_tmg.create
call timing::create
TriggerEvent( this, "constructor" )
end on

on pfc_n_tmg.destroy
call timing::destroy
TriggerEvent( this, "destructor" )
end on

event timer;//////////////////////////////////////////////////////////////////////////////
//
//	Event: timer
//
//	Arguments: None
//
//	Returns: None
//
//	Description:
//	Processes timer.
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

If IsValid(inv_single) Then
	inv_single.Event pfc_timer()
End If

If IsValid(inv_multiple) Then
	inv_multiple.Event pfc_timer()
End If
end event

event destructor;//////////////////////////////////////////////////////////////////////////////
//
//	Event:
//	Destructor
//
//	Description:
//	Clean anything that has been created or opened by the service
//
//////////////////////////////////////////////////////////////////////////////
//	
//	Revision History
//
//	Version
//	6.0   Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

of_SetSingle(False)
of_SetMultiple(False)

end event

