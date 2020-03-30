pageextension 50129 ExtendPurchaseOrderListCBR extends "Purchase Order List"
{
    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(Send)
        {
            action("EmailDocumentCBR")
            {
                CaptionML = ENU = 'Email Order';
                Promoted = true;
                PromotedIsBig = true;
                Image = Email;
                PromotedCategory = Process;
                ApplicationArea = all;
            }
        }
    }

    var

}