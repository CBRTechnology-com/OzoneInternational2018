tableextension 50060 ExtendSalesHeaderCBR extends "Sales Header"
{
    fields
    {
        field(50000; "Turbo Lease Document CBR"; Boolean)
        {
            Caption = 'Turbo Lease Document';
        }

        modify("Ship-to Code")
        {
            trigger OnAfterValidate()
            begin
                IF ("Ship-to Code" <> '') then
                    //OZI0002 >>
                    ValidateShortcutDimCode(8, "Ship-to Code");
                //OZI0002 <<
            end;
        }

    }

    procedure ZeroAmountInLines(SalesHeader: Record "Sales Header")
    //CBR_SS added a parameter
    var

        SalesLineCBR: Record "Sales Line";
    //SalesHeader: Record "Sales Header";
    begin
        SalesLineCBR.SetSalesHeader(SalesHeader);
        SalesLineCBR.SetRange("Document Type", SalesHeader."Document Type");
        SalesLineCBR.SETRANGE("Document No.", SalesHeader."No.");
        SalesLineCBR.SETFILTER(Type, '>0');
        SalesLineCBR.SETFILTER(Quantity, '<>0');
        IF SalesLineCBR.FINDSET(TRUE) THEN
            REPEAT
                SalesLineCBR.Amount := 0;
                SalesLineCBR."Amount Including VAT" := 0;
                SalesLineCBR."VAT Base Amount" := 0;
                SalesLineCBR.InitOutstandingAmount;
                SalesLineCBR.MODIFY;
            UNTIL SalesLineCBR.NEXT = 0;
    end;

    var


}