pageextension 50117 ExtendPurchaseJournalCBR extends "Purchase Journal"
{
    layout
    {
        addafter(Comment)
        {
            field("Customer No./Ship-to"; "Customer No./Ship-to CBR")
            {
                ApplicationArea = All;
                Caption = 'Customer No./Ship-to';
            }
        }
    }

    actions
    {
        addafter("Insert Conv. LCY Rndg. Lines")
        {
            action("Wells Fargo Import CBR")
            {
                Promoted = true;
                Caption = 'Wells Fargo Import';
                PromotedIsBig = true;
                Image = Import;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
        }
    }

    var

}