pageextension 50103 ExtendCustomerListCBR extends "Customer List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(ApprovalEntries)
        {
            action("Linked Fixed Assets CBR")
            {
                Caption = 'Linked Fixed Assets';
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