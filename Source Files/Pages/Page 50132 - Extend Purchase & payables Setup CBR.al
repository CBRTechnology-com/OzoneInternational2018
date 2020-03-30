pageextension 50132 ExtendPurchasePayableSetupCBR extends "Purchases & Payables Setup"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addbefore("Vendor Posting Groups")
        {
            group("&Mail Templates")
            {
                CaptionML = ENU = '&Mail Templates';
                group("Purchase Mail Template")
                {
                    Image = Template;
                    action("Import")
                    {
                        Image = Import;
                        ApplicationArea = ALl;
                        trigger OnAction()
                        begin
                            CalcFields("Purchase E-mail TemplateCBR");
                            if "Purchase E-mail TemplateCBR".HasValue then
                                AppTemplateExists := TRUE;
                            IF FileMgt.BLOBImport(TempBlob, '*.HTM') = '' THEN
                                exit;
                            //"Purchase E-mail TemplateCBR" := TempBlob.Blob;

                            IF AppTemplateExists THEN
                                IF NOT CONFIRM(AP002, FALSE, FIELDCAPTION("Purchase E-mail TemplateCBR")) THEN
                                    exit;
                            CurrPage.SaveRecord;
                        end;
                    }
                    action("Export")
                    {
                        Image = Export;
                        CaptionML = ENU = 'E&xport';
                        ApplicationArea = All;
                    }
                    action("Delete")
                    {
                        CaptionML = ENU = 'Delete';
                        Image = Delete;
                        ApplicationArea = All;
                        trigger OnAction()
                        begin
                            CALCFIELDS("Purchase E-mail TemplateCBR");
                            IF "Purchase E-mail TemplateCBR".HASVALUE THEN
                                IF CONFIRM(AP003, FALSE, FIELDCAPTION("Purchase E-mail TemplateCBR")) THEN BEGIN
                                    CLEAR("Purchase E-mail TemplateCBR");
                                    CurrPage.SAVERECORD;
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