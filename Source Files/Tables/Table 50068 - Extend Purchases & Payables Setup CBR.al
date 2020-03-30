tableextension 50068 ExtendPurchPayablesSetupCBR extends "Purchases & Payables Setup"
{
    fields
    {
        field(50002; "Purchase E-mail TemplateCBR"; Blob)
        {
            Caption = 'Purchase E-mail Template';
        }
        field(50003; "Purchase E-mail From AddresCBR"; Text[80])
        {
            Caption = 'Purchase E-mail From Address';
        }
        field(50004; "Purchase E-mail SubjectCBR"; Text[100])
        {
            Caption = 'Purchase E-mail Subject';
        }
    }

    var
        myInt: Integer;
}