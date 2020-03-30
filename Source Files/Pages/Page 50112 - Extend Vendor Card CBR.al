pageextension 50112 ExtendVendorCardCBR extends "Vendor Card"
{
    layout
    {
        addafter("Responsibility Center")
        {
            field("Credit Limit"; "Credit Limit CBR")
            {
                ApplicationArea = All;
            }
            field("Lease Number"; "Lease Number CBR")
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