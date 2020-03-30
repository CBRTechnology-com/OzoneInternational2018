pageextension 50127 ExtendSalesReturnOrderCBR extends "Sales Return Order"
{
    layout
    {
        addafter("Location Code")
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