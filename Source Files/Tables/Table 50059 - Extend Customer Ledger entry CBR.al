tableextension 50059 ExtendCustLedgerEntryCBR extends "Cust. Ledger Entry"
{
    fields
    {
        field(50000; "Original Description CBR"; Text[50])
        {
            Editable = false;
            Caption = 'Original Description';
        }
    }

    var
}