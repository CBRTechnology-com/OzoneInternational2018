tableextension 50055 ExtendItemJournalLineCBR extends "Item Journal Line"
{
    fields
    {
        field(50000; "Manufacturer Item No. CBR"; Code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Item."Manufacturer Item No. CBR" where("No." = field("Item No.")));
            Description = 'GA00';
            Editable = false;
            Caption = 'Manufacturer Item No.';
        }
        field(50001; "Vendor Item No. CBR"; Text[20])
        {
            FieldClass = FlowField;
            Caption = 'Vendor Item No.';
            CalcFormula = lookup (item."Vendor Item No." where("No." = field("Item No.")));
            Description = 'GA00';
            Editable = false;
        }
    }

    var
        
}