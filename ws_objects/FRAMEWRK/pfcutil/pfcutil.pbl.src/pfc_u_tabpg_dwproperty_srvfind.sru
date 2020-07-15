HA$PBExportHeader$pfc_u_tabpg_dwproperty_srvfind.sru
$PBExportComments$PFC DataWindow Property - The Find service tabpage
forward
global type pfc_u_tabpg_dwproperty_srvfind from u_tabpg_dwproperty_base
end type
type cbx_allowfinddlg from u_cbx within pfc_u_tabpg_dwproperty_srvfind
end type
type cbx_allowreplacedlg from u_cbx within pfc_u_tabpg_dwproperty_srvfind
end type
end forward

global type pfc_u_tabpg_dwproperty_srvfind from u_tabpg_dwproperty_base
cbx_allowfinddlg cbx_allowfinddlg
cbx_allowreplacedlg cbx_allowreplacedlg
end type
global pfc_u_tabpg_dwproperty_srvfind pfc_u_tabpg_dwproperty_srvfind

forward prototypes
public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib)
public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib)
end prototypes

public function integer of_getinfo (ref n_cst_infoattrib anv_infoattrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_infoattrib	(By reference) The Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Object Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

// Populate Information.
anv_infoattrib.is_name = 'DW Property Find/Replace Service'
anv_infoattrib.is_description = 'DW Property Find/Replace Service'

Return 1
end function

public function integer of_getpropertyinfo (ref n_cst_propertyattrib anv_attrib);//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		of_GetPropertyInfo
//
//	Access:   		Public
//
//	Arguments:		
//		anv_attrib	(By ref.) The Property Information attributes.
//
//	Returns:  		Integer
//	 1 for success.
//	-1 for error.
//
//	Description:  
//	 Gets the Service Property Information.
//
//////////////////////////////////////////////////////////////////////////////
//
//	Revision History
//
//	Version
//	6.0    Initial version
//
//////////////////////////////////////////////////////////////////////////////
//
//	Copyright $$HEX2$$a9002000$$ENDHEX$$1996-1997 Sybase, Inc. and its subsidiaries.  All rights reserved.
//	Any distribution of the PowerBuilder Foundation Classes (PFC)
//	source code by other than Sybase, Inc. and its subsidiaries is prohibited.
//
//////////////////////////////////////////////////////////////////////////////

n_cst_infoattrib lnv_infoattrib

// Get the first two attributes from the Main Information attributes.
of_GetInfo(lnv_infoattrib)
anv_attrib.is_name = lnv_infoattrib.is_name
anv_attrib.is_description = lnv_infoattrib.is_description

// The Property Tab Text.
anv_attrib.is_propertytabtext ='General'

Return 1
end function

on pfc_u_tabpg_dwproperty_srvfind.create
int iCurrent
call u_tabpg_dwproperty_base::create
this.cbx_allowfinddlg=create cbx_allowfinddlg
this.cbx_allowreplacedlg=create cbx_allowreplacedlg
iCurrent=UpperBound(this.Control)
this.Control[iCurrent+1]=cbx_allowfinddlg
this.Control[iCurrent+2]=cbx_allowreplacedlg
end on

on pfc_u_tabpg_dwproperty_srvfind.destroy
call u_tabpg_dwproperty_base::destroy
destroy(this.cbx_allowfinddlg)
destroy(this.cbx_allowreplacedlg)
end on

event pfc_propertyapply;call super::pfc_propertyapply;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_PropertyApply
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  		
//	 Apply the requested changes.
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

integer 	li_rc
boolean	lb_current, lb_desired

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_find) or Not IsValid(idw_requestor.inv_find) Then
	Return -1
End If

// -- Allow Find Dialog Only. --
lb_current = idw_requestor.inv_find.of_IsAllowFindDlg()
lb_desired = cbx_allowfinddlg.Checked
// If the desired value differs from the current value.
If lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_find.of_SetAllowFindDlg(lb_desired)
End If

// -- Allow Replace Dialog Only. --
lb_current = idw_requestor.inv_find.of_IsAllowReplaceDlg()
lb_desired = cbx_allowreplacedlg.Checked
// If the desired value differs from the current value.
If lb_current<> lb_desired Then
	li_rc = idw_requestor.inv_find.of_SetAllowReplaceDlg(lb_desired)
End If

Return 1

end event

event pfc_propertypopulate;call super::pfc_propertypopulate;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertypopulate
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		Integer
//   1 if it succeeds.
//	 -1 if an error occurs.
//
//	Description:  	
//	Populate the screen edit controls with the current service values.
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

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return -1
End If
If IsNull(idw_requestor.inv_find) or Not IsValid(idw_requestor.inv_find) Then
	Return -1
End If

// Determine if Allow Find Dialog is enabled.
cbx_allowfinddlg.Checked = idw_requestor.inv_find.of_IsAllowFindDlg()

// Determine if Allow Replace Dialog is enabled.
cbx_allowreplacedlg.Checked = idw_requestor.inv_find.of_IsAllowReplaceDlg()

Return 1

end event

event pfc_propertysyntax;call super::pfc_propertysyntax;//////////////////////////////////////////////////////////////////////////////
//
//	Function:  		pfc_propertysyntax
//
//	Access:    		Public
//
//	Arguments:  	None
//
//	Returns:   		String
//	  The syntax required to create the currently selections.
//   '!' in error
//
//	Description:  
//	Create the required syntax to match the current selections.
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

integer	li_upper
integer	li_cnt
integer 	li_rc
integer	li_styledesired
integer	li_index
integer	li_excludecount=0
string	ls_excludecols[]
string	ls_exclude
string	ls_syntax
boolean	lb_desired
n_cst_conversion lnv_conversion

// Validate references.
If IsNull(idw_requestor) or Not IsValid(idw_requestor) Then
	Return '!'
End If
If IsNull(idw_requestor.inv_find) or Not IsValid(idw_requestor.inv_find) Then
	Return '!'
End If


// -- Start the service. --
ls_syntax += 'This.of_SetFind(True)~r~n'

// -- Allow Find Dialog. --
lb_desired = cbx_allowfinddlg.Checked
ls_syntax += '~r~nThis.inv_find.of_SetAllowFindDlg('+lnv_conversion.of_String(lb_desired)+')'

// -- Allow Replace Dialog. --
lb_desired = cbx_allowreplacedlg.Checked
ls_syntax += '~r~nThis.inv_find.of_SetAllowReplaceDlg('+lnv_conversion.of_String(lb_desired)+')'

Return ls_syntax

end event

type cbx_allowfinddlg from u_cbx within pfc_u_tabpg_dwproperty_srvfind
int X=27
int Y=24
int Width=983
string Text="Allow &Find dialog"
end type

type cbx_allowreplacedlg from u_cbx within pfc_u_tabpg_dwproperty_srvfind
int X=27
int Y=116
int Width=983
string Text="Allow &Replace dialog"
end type
