pageextension 50114 ExtendPurchaseCreditMemo extends "Purchase Credit Memo"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Customer Ship-to Code"; "Customer Ship-to Code CBR")
            {
                ApplicationArea = All;
                Caption = 'Customer Ship-to Code';
            }
            field("Customer Ship-to Name"; "Ship-to Code Name CBR")
            {
                ApplicationArea = All;
                Caption = 'Customer Ship-to Name';
            }
            field("Customer ID"; "Customer ID CBR")
            {
                ApplicationArea = All;
                Caption = 'Customer ID';
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var

}