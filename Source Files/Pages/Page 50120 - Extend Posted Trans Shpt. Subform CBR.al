pageextension 50120 ExtendPostTransShptSubformCBR extends "Posted Transfer Shpt. Subform"
{
    layout
    {
        addafter("Shortcut Dimension 2 Code")
        {
            field("Package Tracking No."; "Package Tracking No. CBR")
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