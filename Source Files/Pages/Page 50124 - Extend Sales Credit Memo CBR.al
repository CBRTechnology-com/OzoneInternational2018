pageextension 50124 ExtendSalesCreditMemoCBR extends "Sales Credit Memo"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Ship-to Code"; "Ship-to Code")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

    var
}