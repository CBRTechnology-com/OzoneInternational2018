tableextension 50050 ExtendVendorCBR extends Vendor
{
    fields
    {
        field(50000; "Credit Limit CBR"; Decimal)
        {
            Description = 'GA00';
            Caption = 'Credit Limit';
        }
        field(50001; "Lease Number CBR"; Text[100])
        {
            Caption = 'Lease Number';
        }
    }

    var

}