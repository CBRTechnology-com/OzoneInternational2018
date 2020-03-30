tableextension 50054 ExtendGenJournalLineCBR extends "Gen. Journal Line"
{
    fields
    {
        field(50000; "Vendor Name CBR"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (vendor.Name where("No." = field("Account No.")));
            TableRelation = if ("Account Type" = const(Vendor)) vendor."No." where("No." = field("Account No."));
            Description = 'GA00';
            Caption = 'Vendor Name';
            Editable = false;
        }
        field(50001; "Customer No./Ship-to CBR"; Code[20])
        {
            Caption = 'Customer No./Ship-to';
        }
        field(50002; "Service Order No. CBR"; Code[20])
        {
            Caption = 'Service Order No.';
        }
    }

    var
        
}