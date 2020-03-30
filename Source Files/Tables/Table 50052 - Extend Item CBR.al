tableextension 50052 ExtendItemCBR extends Item
{
    fields
    {
        field(50000; "Manufacturer Name CBR"; Text[100])
        {
            Description = 'GA06';
            Caption = 'Manufacturer Name';
        }
        field(50001; "Manufacturer Item No. CBR"; code[100])
        {
            Description = 'GA06';
            Caption = 'Manufacturer Item No.';

        }
        field(50002; "Qty. on Transfer Order CBR"; Decimal)
        {
            FieldClass = FlowField;
            Caption = 'Qty. on Transfer Order';
            CalcFormula = sum ("Transfer Line"."Qty. to Ship" where("Item No." = field("No."),
                                                                   Status = const(Released),
                                                                   "Qty. to Ship" = filter(<> 0),
                                                                   "Derived From Line No." = const(0)));
            DecimalPlaces = 0 : 5;
            Description = 'OZI0001';
        }

    }
    fieldgroups
    {
        addlast(DropDown; "Manufacturer Item No. CBR", "Manufacturer Name CBR")
        {

        }
    }

    var
        ItemVendorCBR: Record "Item Vendor";
}