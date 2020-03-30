pageextension 50121 ExtendPurchReturnOrderCBR extends "Purchase Return Order"
{
    layout
    {
        addafter("Location Code")
        {
            field("Customer Ship-to Code"; "Customer Ship-to Code CBR")
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