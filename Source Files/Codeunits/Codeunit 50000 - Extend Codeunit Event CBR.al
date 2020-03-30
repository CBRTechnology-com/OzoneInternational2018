codeunit 50000 ExtendCodeunitEventCBR
{
    trigger OnRun()
    begin

    end;



    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Release Sales Document", 'OnBeforeReleaseSalesDoc', '', true, true)]
    local procedure TestShipToCode414(VAR SalesHeader: Record "Sales Header"; PreviewMode: Boolean)
    begin
        //OZI0001 >>
        SalesHeader.TestField("Ship-to Code");
        //OZI0001 << 
    end;


    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterCheckMandatoryFields', '', false, false)]
    local procedure OnRunEvent(var SalesHeader: Record "Sales Header");
    begin
        // OZI0001   >>
        if (SalesHeader."Document Type" = SalesHeader."Document Type"::Order) or (SalesHeader."Document Type" = SalesHeader."Document Type"::Invoice) then
            SalesHeader.TESTFIELD(SalesHeader."Ship-to Code");
        // OZI0001   <<
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Cust. Entry-Edit", 'OnBeforeCustLedgEntryModify', '', false, false)]
    local procedure OnBeforeModifyCustLedEntry(var CustLedgEntry: Record "Cust. Ledger Entry"; FromCustLedgEntry: Record "Cust. Ledger Entry");
    begin
        //GA00
        CustLedgEntry.VALIDATE(Description, CustLedgEntry.Description);
        //GA00 EOM
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::DimensionManagement, 'OnAfterSetupObjectNoList', '', false, false)]
    local procedure OnAfterSetupObjectNoList(var TempAllObjWithCaption: Record AllObjWithCaption temporary);
    begin
        // Add Ship-to Dimension
        TempAllObjWithCaption.INIT;
        TempAllObjWithCaption."Object Type" := TempAllObjWithCaption."Object Type"::Table;
        TempAllObjWithCaption."Object ID" := DATABASE::"Ship-to Address";
        TempAllObjWithCaption.INSERT;
    end;


}