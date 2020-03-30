pageextension 50102 ExtendCustomerCardCBR extends "Customer Card"
{
    layout
    {
        modify("Search Name")
        {
            Visible = true;
            ApplicationArea = All;
        }
        addafter("Language Code")
        {
            field("Additional Billing Contacts"; "Additional Billing ContactsCBR")
            {
                ApplicationArea = All;
            }
        }

    }

    actions
    {
        addafter(CustomerReportSelections)
        {
            action("Linked Fixed assets CBR")
            {
                Caption = 'Linked Fixed assets';
                RunObject = page 5601;
                RunPageLink = "Customer No. CBR" = field("No.");
                Promoted = true;
                PromotedIsBig = true;
                Image = FARegisters;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
        }
    }

    var

}