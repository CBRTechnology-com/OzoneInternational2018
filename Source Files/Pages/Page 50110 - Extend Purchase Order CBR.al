pageextension 50110 ExtendPurchaseOrderCBR extends "Purchase Order"
{
    layout
    {


    }

    actions
    {
        addafter("Co&mments")
        {
            action(EmailDocumentCBR)
            {
                CaptionML = ENU = 'Email Order';
                Promoted = true;
                PromotedIsBig = true;
                Image = Email;
                PromotedCategory = Process;
                ApplicationArea = All;


            }
        }
    }

    var
        myInt: Integer;
}