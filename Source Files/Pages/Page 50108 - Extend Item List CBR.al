pageextension 50108 ExtendItemList extends "Item List"
{
    layout
    {
        addafter("Default Deferral Template Code")
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
        // Add changes to page actions here
    }

    var
        myInt: Integer;
}