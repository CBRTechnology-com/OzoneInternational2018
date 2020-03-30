tableextension 50053 ExtendPurchaseHeaderCBR extends "Purchase Header"
{
    fields
    {
        field(50000; "Customer Ship-to Code CBR"; Code[20])
        {
            Description = 'OZI0001';
            Caption = 'Customer Ship-to Code';
            trigger OnValidate()
            begin
                ValidateShortcutDimCode(8, "Customer Ship-to Code CBR");
            end;

            trigger OnLookup()
            begin
                LookupShortcutDimCode(8, "Customer Ship-to Code CBR");
            end;
        }
        field(50001; "Ship-to Code Name CBR"; Text[100])
        {
            Caption = 'Customer Ship-to Code Name';

        }
        field(50002; "Customer ID CBR"; Code[20])
        {
            Caption = 'Customer ID';
            TableRelation = Customer;
        }
    }

    var


    procedure LookupShortcutDimCode(FieldNumber: Integer; var ShortcutDimCode: Code[20])
    var

        DimMgtCBR: Codeunit DimensionManagement;
    begin
        DimMgtCBR.LookupDimValueCode(FieldNumber, ShortcutDimCode);
        ValidateShortcutDimCode(FieldNumber, ShortcutDimCode);
    end;

    procedure UpdateCustomerShipToName()
    var
        DimensionValue: Record "Dimension Value";
    //CBR_SS>>
    begin
        DimensionValue.RESET;
        DimensionValue.SETRANGE(Code, "Customer Ship-to Code CBR");
        IF DimensionValue.FINDFIRST THEN
            "Ship-to Code Name CBR" := DimensionValue.Name;
    end;
    //CBR_SS<<
}