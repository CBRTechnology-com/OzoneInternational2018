pageextension 50105 ExtendVendorlListCBR extends "Vendor List"
{


    layout
    {
        addafter("Base Calendar Code")
        {
            field("Credit Limit"; "Credit Limit CBR")
            {
                ApplicationArea = All;
            }
            field(Balance; Balance)
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
        myInt: Integer;
}