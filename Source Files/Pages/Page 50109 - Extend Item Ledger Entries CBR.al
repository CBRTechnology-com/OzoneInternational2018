pageextension 50109 ExtendItemLedgerEntriesCBR extends "Item Ledger Entries"
{
    layout
    {
        addafter(Description)
        {
            field("Source Type"; "Source Type")
            {
                ApplicationArea = All;
            }
            field("Source No."; "Source No.")
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