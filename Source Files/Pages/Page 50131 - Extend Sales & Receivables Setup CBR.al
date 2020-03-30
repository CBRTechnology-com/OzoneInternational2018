pageextension 50131 ExtendSalesRecSetupCBR extends "Sales & Receivables Setup"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("Customer Disc. Groups")
        {
            group("&Mail Templates ")
            {
                CaptionML = ENU = '&Mail Templates ';
                group("Sales Invoice Mail Template")
                {
                    CaptionML = ENU = 'Sales Invoice Mail Template';
                    Image = Template;

                    action("Invoice Import")
                    {
                        CaptionML = ENU = 'Import';
                        Image = Import;
                        ApplicationArea = ll;
                        trigger OnAction()
                        begin
                            CalcFields("SalesInvoiceE-mailTemplateCBR");
                            if "SalesInvoiceE-mailTemplateCBR".HasValue then
                                AppTemplateExists := true;

                            if FileMgt.BLOBImport(TempBlob, '*.HTM') = '' then
                                exit;
                            //"SalesInvoiceE-mailTemplateCBR" := TempBlob.Blob;

                            if AppTemplateExists then
                                if not Confirm(AP002, false, FieldCaption("SalesInvoiceE-mailTemplateCBR")) then
                                    exit;
                            CurrPage.SaveRecord();
                        end;
                    }
                    action("Invoice Export")
                    {
                        CaptionML = ENU = 'E&xport';
                        Image = Export;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CalcFields("SalesInvoiceE-mailTemplateCBR");
                            if "SalesInvoiceE-mailTemplateCBR".HasValue then begin
                                //TempBlob.Blob := "SalesInvoiceE-mailTemplateCBR";
                                FileMgt.BLOBExport(TempBlob, '*.HTM', true);
                            end;
                        end;

                    }
                    action("Invoice Delete")
                    {
                        CaptionML = ENU = 'Delete';
                        Image = Delete;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CalcFields("SalesInvoiceE-mailTemplateCBR");
                            if "SalesInvoiceE-mailTemplateCBR".HasValue then
                                if Confirm(AP003, false, FieldCaption("SalesInvoiceE-mailTemplateCBR")) then begin
                                    Clear("SalesInvoiceE-mailTemplateCBR");
                                    CurrPage.SaveRecord;
                                end;
                        End;
                    }

                }
                group("Sales Order Mail Template")
                {
                    Image = Template;
                    action("Order Import")
                    {
                        CaptionML = ENU = 'Import';
                        Image = Import;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CALCFIELDS("SalesOrderE-mailTemplateCBR");
                            IF "SalesOrderE-mailTemplateCBR".HASVALUE THEN
                                AppTemplateExists := TRUE;

                            IF FileMgt.BLOBImport(TempBlob, '*.HTM') = '' THEN
                                exit;
                            //"SalesOrderE-mailTemplateCBR" := TempBlob.Blob;

                            IF AppTemplateExists THEN
                                IF NOT CONFIRM(AP002, FALSE, FIELDCAPTION("SalesOrderE-mailTemplateCBR")) THEN
                                    EXIT;
                            CurrPage.SAVERECORD;
                        end;
                    }
                    action("Order Export")
                    {
                        CaptionML = ENU = 'Export';
                        Image = Export;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CalcFields("SalesOrderE-mailTemplateCBR");
                            IF "SalesOrderE-mailTemplateCBR".HASVALUE THEN begin
                                //TempBlob.Blob := "SalesOrderE-mailTemplateCBR";
                                FileMgt.BLOBExport(TempBlob, '*.HTM', TRUE);
                            end;
                        end;
                    }
                    action("Order Delete")
                    {
                        CaptionML = ENU = 'Delete';
                        Image = Delete;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CalcFields("SalesOrderE-mailTemplateCBR");
                            if "SalesOrderE-mailTemplateCBR".HasValue then
                                if Confirm(AP003, false, FieldCaption("SalesOrderE-mailTemplateCBR")) then begin
                                    Clear("SalesOrderE-mailTemplateCBR");
                                    CurrPage.SaveRecord;
                                end;
                        end;
                    }
                }
            }
        }

    }

    var
        myInt: Integer;
        TempBlob: Codeunit "Temp Blob";
        AppTemplateExists: Boolean;
        FileMgt: Codeunit 419;
        AP002: TextConst ENU = 'Do you want to replace the existing %1?';
        AP003: TextConst ENU = 'Do you want to delete the template %1?';
}