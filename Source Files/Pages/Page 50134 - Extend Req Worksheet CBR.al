pageextension 50134 ExtendReQWorksheetCBR extends "Req. Worksheet"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(CalculatePlan)
        {
            action("Select All Accept Action Message")
            {
                Promoted = true;
                PromotedIsBig = true;
                Image = Approve;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
        }
    }

    var
        myInt: Integer;
}