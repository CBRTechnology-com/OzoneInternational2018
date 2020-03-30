tableextension 50069 ExtendSalesRecSetupCBR extends "Sales & Receivables Setup"
{
    fields
    {
        field(50001; "TL Parent Item No. CBR"; Code[20])
        {
            Caption = 'TL Parent Item No.';
            TableRelation = item;
        }
        field(50002; "TL Default Location CBR"; code[10])
        {
            Caption = 'TL Default Location';
            TableRelation = location;
        }
        field(50003; "SalesInvoiceE-mailTemplateCBR"; Blob)
        {
            Caption = 'Sales Invoice E-mail Template';
        }
        field(50004; "Sales E-mail From Address CBR"; text[80])
        {
            Caption = 'Sales E-mail From Address';
        }
        field(50005; "Sales E-mail Subject CBR"; text[100])
        {
            Caption = 'Sales E-mail Subject';
        }
        field(50006; "SalesOrderE-mailTemplateCBR"; Blob)
        {
            Caption = 'Sales Order E-mail Template';
        }
    }

    var
        myInt: Integer;
}