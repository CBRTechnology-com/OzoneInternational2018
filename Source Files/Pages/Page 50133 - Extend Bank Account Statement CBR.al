pageextension 50133 ExtendBankAccountStatementCBR extends "Bank Account Statement"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter("&Card")
        {
            action(StatementCBR)
            {
                Caption = 'Statement';
                ApplicationArea = All;
            }
        }
    }

    var
        myInt: Integer;
}