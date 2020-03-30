tableextension 50056 ExtendTransferLineCBR extends "Transfer Line"
{
    fields
    {
        field(50000; "Manufacturer Item No. CBR"; code[100])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Item."Manufacturer Item No. CBR" where("No." = FIELD("Item No.")));
            Description = 'GA00';
            Editable = false;
            Caption = 'Manufacturer Item No.';
        }
        field(50001; "Vendor Item No. CBR"; Text[20])
        {
            FieldClass = FlowField;
            CalcFormula = lookup (Item."Vendor Item No." where("No." = field("Item No.")));
            Description = 'GA00';
            Editable = false;
            Caption = 'Vendor Item No.';
        }
        field(50002; "Package Tracking No. CBR"; text[30])
        {
            Description = 'OZI0001';
            Caption = 'Package Tracking No. CBR';
        }
    }


    var
     
}