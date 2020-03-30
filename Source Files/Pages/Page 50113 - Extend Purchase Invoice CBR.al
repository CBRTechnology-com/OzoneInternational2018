pageextension 50113 ExtendPurchaseInvoiceCBR extends "Purchase Invoice"
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

    }

    var

}