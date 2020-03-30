pageextension 50106 ExtendVendorLedEntriesCBR extends "Vendor Ledger Entries"
{
    layout
    {
        addafter("Dimension Set ID")
        {
            field("Customer No./Ship-to"; "Customer No./Ship-to CBR")
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