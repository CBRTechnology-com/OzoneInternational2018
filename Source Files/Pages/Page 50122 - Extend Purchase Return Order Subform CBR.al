pageextension 50122 ExtendPurchReturnOrdSubformCBR extends "Purchase Return Order Subform"
{
    layout
    {
        addafter("No.")
        {
            field("Gen. Prod. Posting Group"; "Gen. Prod. Posting Group")
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