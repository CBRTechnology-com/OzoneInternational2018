codeunit 50002 "Page Subscribers"
{

    trigger OnRun();
    begin
    end;

    var
        StyleText: Text[10];
        ServiceHeader: Record "Service Header";
        ServiceContractHeader: Record "Service Contract Header";
        StockkeepingUnit: Record "Stockkeeping Unit";
        SKUBelowReorder: Integer;
        TempBlob: Codeunit "Temp Blob";
        AppTemplateExists: Boolean;
        FileMgt: Codeunit "File Management";
        AP002: Label 'Do you want to replace the existing %1?';
        AP003: Label 'Do you want to delete the template %1?';


    [EventSubscriber(ObjectType::Page, Page::"Customer Card", 'OnAfterValidateEvent', 'Name', true, true)]
    local procedure NameOnAfterValidate(var Rec: Record Customer; var xRec: Record Customer);
    begin
        // OZI0001 >>
        if not CONFIRM('Are you sure you want to update the Customer Name?', false) then
            ERROR('Change has been reverted.');
        // OZI0001 <<
    end;

    [EventSubscriber(ObjectType::Page, Page::"Vendor List", 'OnAfterGetRecordEvent', '', false, false)]
    local procedure OnAfterGetRecordEvent(var Rec: Record Vendor);
    begin
        with Rec do begin
            //GA00 Format Style
            if (Balance > "Credit Limit CBR") and ("Credit Limit CBR" <> 0) then
                StyleText := 'Attention'
            else
                StyleText := '';
        end;
    end;



    [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailOnActionEvent(var Rec: Record "Sales Header");
    var
    //EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(Rec."Document Type", Rec."No.", false, false);
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'Customer', false, false)]
    // local procedure OnBeforePostAssignedIDError(var Rec: Record "Sales Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'PostAndSend', false, false)]
    // local procedure OnBeforePostandSendAssignedIDError(var Rec: Record "Sales Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // // [EventSubscriber(ObjectType::Page, Page::"Sales Order", 'OnBeforeActionEvent', 'PostAndNew', false, false)]
    // // local procedure OnBeforePostandNewAssignedIDError(var Rec: Record "Sales Header");
    // // begin
    // //     // TRIO0001 >>
    // //     if Rec."Assigned User ID" = '' then
    // //         ERROR('You have to input an Assigned User ID before you can post.');
    // //     // TRI0001 <<
    // // end;

    [EventSubscriber(ObjectType::Page, Page::"Item Vendor Catalog", 'OnNewRecordEvent', '', false, false)]
    local procedure OnNewRecordEvent(var Rec: Record "Item Vendor"; BelowxRec: Boolean; var xRec: Record "Item Vendor");
    var
        NextItemVend: Record "Item Vendor";
    begin
        with Rec do begin
            // OZI0001 >>
            NextItemVend.RESET;
            NextItemVend.SETRANGE("Item No.", xRec."Item No.");
            NextItemVend.SETFILTER("Line No. CBR", '>%1', xRec."Line No. CBR");
            if NextItemVend.FINDFIRST then
                "Line No. CBR" := (xRec."Line No. CBR" + NextItemVend."Line No. CBR") div 2
            else
                "Line No. CBR" := xRec."Line No. CBR" + 10000;
            // OZI0001 <<
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoice", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailDocumentEventPostedSInvoice(var Rec: Record "Sales Invoice Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(7, Rec."No.", false, false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoice", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmalDocumentEventPostedPurchInvoice(var Rec: Record "Purch. Inv. Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(7, Rec."No.", true, false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Sales Invoices", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailDocumentEventPostedSInvoices(var Rec: Record "Sales Invoice Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(7, Rec."No.", false, false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Posted Purchase Invoices", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailDocumentEventPostedPurchInvoices(var Rec: Record "Purch. Inv. Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(7, Rec."No.", true, false);
    end;


    [EventSubscriber(ObjectType::Page, Page::"Req. Worksheet", 'OnAfterActionEvent', 'Select All Accept Action Message', false, false)]
    local procedure AllAcceptEvent(var Rec: Record "Requisition Line");
    begin
        Rec.MODIFYALL("Accept Action Message", true, true)    // OZI0001  >><<
    end;

    [EventSubscriber(ObjectType::Page, Page::"Bank Account Statement", 'OnAfterActionEvent', 'StatementCBR', false, false)]
    local procedure StatementEvent(var Rec: Record "Bank Account Statement");
    begin
        REPORT.RUN(REPORT::"Bank Account Statement", true, true, Rec);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Service Dispatcher Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OpenPageEventServDispatActivities(var Rec: Record "Service Cue");
    begin
        //GA00 Get Items Below Reorder
        SKUBelowReorder := 0;
        StockkeepingUnit.SETFILTER("Reorder Point", '>0');
        StockkeepingUnit.SETFILTER("Location Code", 'ST*|CS');
        StockkeepingUnit.FINDSET;
        repeat
            StockkeepingUnit.CALCFIELDS(Inventory);
            if StockkeepingUnit.Inventory < StockkeepingUnit."Reorder Point" then
                SKUBelowReorder += 1;
        until StockkeepingUnit.NEXT = 0;
    end;

    [EventSubscriber(ObjectType::Page, Page::"SO Processor Activities", 'OnOpenPageEvent', '', false, false)]
    local procedure OpenPageEventSOProcActivities(var Rec: Record "Sales Cue");
    begin
        //GA00 Set Late Filter
        Rec.SETFILTER("Date Filter", '<%1', WORKDATE);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Sales Order List", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailEventSalesOrderList(var Rec: Record "Sales Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(Rec."Document Type", Rec."No.", false, false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order List", 'OnAfterActionEvent', 'EmailDocumentCBR', false, false)]
    local procedure EmailEventPurchOrderList(var Rec: Record "Purchase Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(Rec."Document Type", Rec."No.", true, false);
    end;

    [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnAfterActionEvent', 'EMailDocumentCBR', false, false)]
    local procedure EmailEventPurchOrder(var Rec: Record "Purchase Header");
    var
    // EmailCu: Codeunit "Send Document E-mails";
    begin
        // CLEAR(EmailCu);
        // EmailCu.CreateEmails(Rec."Document Type", Rec."No.", true, false);
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post', false, false)]
    // local procedure OnBeforePostAssignedIDErrorPurchOrder(var Rec: Record "Purchase Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post and &Print', false, false)]
    // local procedure OnBeforePostandPrintAssignedIDErrorPurchOrder(var Rec: Record "Purchase Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Purchase Order", 'OnBeforeActionEvent', 'Post &Batch', false, false)]
    // local procedure OnBeforePostandBatchAssignedIDErrorPurchOrder(var Rec: Record "Purchase Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;


    [EventSubscriber(ObjectType::Page, page::"Purchases & Payables Setup", 'OnAfterActionEvent', 'Export', false, false)]
    local procedure ExportEvent(var Rec: Record "Purchases & Payables Setup");
    begin
        with Rec do begin
            CALCFIELDS("Purchase E-mail TemplateCBR");
            if "Purchase E-mail TemplateCBR".HASVALUE then begin
                //TempBlob.Blob := "Purchase E-mail Template";
                FileMgt.BLOBExport(TempBlob, '*.HTM', true);
            end;
        end;
    end;

    // [EventSubscriber(ObjectType::Page, Page::"Transfer Order", 'OnBeforeActionEvent', 'Post', false, false)]
    // local procedure OnBeforePostAssignedIDErrorTransOrder(var Rec: Record "Transfer Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Transfer Order", 'OnBeforeActionEvent', 'PostAndPrint', false, false)]
    // local procedure OnBeforePostandPrintAssignedIDErrorTransOrder(var Rec: Record "Transfer Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Transfer Orders", 'OnBeforeActionEvent', 'Post', false, false)]
    // local procedure OnBeforePostAssignedIDErrorTransOrders(var Rec: Record "Transfer Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;

    // [EventSubscriber(ObjectType::Page, Page::"Transfer Orders", 'OnBeforeActionEvent', 'PostAndPrint', false, false)]
    // local procedure OnBeforePostandPrintAssignedIDErrorTransOrders(var Rec: Record "Transfer Header");
    // begin
    //     // TRIO0001 >>
    //     if Rec."Assigned User ID" = '' then
    //         ERROR('You have to input an Assigned User ID before you can post.');
    //     // TRI0001 <<
    // end;
}

