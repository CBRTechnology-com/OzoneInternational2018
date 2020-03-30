tableextension 50062 ExtendShipToAddressCBR extends "Ship-to Address"
{
    fields
    {
        field(50000; "Responsibility Center CBR"; Code[10])
        {
            Description = 'OZI0002';
            Caption = 'Responsibility Center';
            TableRelation = "Responsibility Center";
        }

    }

    var
       
}