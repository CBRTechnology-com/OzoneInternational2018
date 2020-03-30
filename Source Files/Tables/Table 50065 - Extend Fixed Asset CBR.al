tableextension 50065 ExtendFixedAssetCBR extends "Fixed Asset"
{
    fields
    {
        field(50000; "Customer No. CBR"; Code[20])
        {
            TableRelation = Customer;
            Caption = 'Customer No.';
            Description = 'OZI0001';
        }
        field(50001; "Ship-to Code CBR"; Code[10])
        {
            Caption = 'Ship-to Code';
            TableRelation = "Ship-to Address".Code where("Customer No." = field("Customer No. CBR"));
            Description = 'OZI0001';
        }
        field(50002; "Responsibility Center CBR"; Code[10])
        {
            TableRelation = "Responsibility Center";
            CaptionML = ENU = 'Responsibility Center', ESM = 'Centro responsabilidad', FRC = 'Centre de gestion', ENC = 'Responsibility Centre';
        }
    }

    var
        
}