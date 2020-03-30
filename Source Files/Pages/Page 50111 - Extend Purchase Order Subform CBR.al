pageextension 50111 ExtendPurchaseOrderSubFormCBR extends "Purchase Order Subform"
{

    layout
    {
        addafter("Cross-Reference No.")
        {
            field("Vendor Item No."; "Vendor Item No.")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {

    }


    var

}