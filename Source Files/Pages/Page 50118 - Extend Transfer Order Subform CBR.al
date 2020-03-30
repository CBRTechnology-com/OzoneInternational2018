pageextension 50118 ExtendTransferOrderSubformCBR extends "Transfer Order Subform"
{
    layout
    {
        addafter("Item No.")
        {
            field("Item Category Code"; "Item Category Code")
            {
                ApplicationArea = All;
            }

        }
        addafter("ShortcutDimCode[8]")
        {
            field("Manufacturer Item No."; "Manufacturer Item No. CBR")
            {
                ApplicationArea = All;
            }
            field("Vendor Item No."; "Vendor Item No. CBR")
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