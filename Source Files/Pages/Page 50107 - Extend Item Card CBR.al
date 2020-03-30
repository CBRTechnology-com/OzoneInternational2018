pageextension 50107 ExtendItemCardCBR extends "Item Card"
{
    layout
    {

        addafter("Purch. Unit of Measure")
        {
            field("Manufacturer Name"; "Manufacturer Name CBR")
            {
                ApplicationArea = All;
            }
            field("Manufacturer Item No."; "Manufacturer Item No. CBR")
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