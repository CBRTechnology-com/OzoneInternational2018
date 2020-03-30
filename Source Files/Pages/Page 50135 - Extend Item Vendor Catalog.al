pageextension 50135 ExtendItemVendorCatalogCBR extends "Item Vendor Catalog"
{

    layout
    {
        addafter("Lead Time Calculation")
        {
            field("Line No."; "Line No. CBR")
            {
                Visible = false;
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