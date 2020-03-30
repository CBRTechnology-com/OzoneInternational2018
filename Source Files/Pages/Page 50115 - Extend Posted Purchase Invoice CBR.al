pageextension 50115 ExtendPostedPurchaseInvCBR extends "Posted Purchase Invoice"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Navigate)
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