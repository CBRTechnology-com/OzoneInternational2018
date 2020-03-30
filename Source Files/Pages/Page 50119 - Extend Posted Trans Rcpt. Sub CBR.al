pageextension 50119 ExtendPostTransRcptSubFormCBR extends "Posted Transfer Rcpt. Subform"
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