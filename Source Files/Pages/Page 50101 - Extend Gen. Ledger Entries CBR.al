pageextension 50101 ExtendGenLedgerEntryCBR extends "General Ledger Entries"
{
    layout
    {
        addafter("Entry No.")
        {
            field("Customer No./Ship-to"; "Customer No./Ship-to CBR")
            {
                ApplicationArea = All;
            }
            field("Service Order No."; "Service Order No. CBR")
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