pageextension 50125 ExtendPostedSalesInvoiceCBR extends "Posted Sales Invoice"
{
    layout
    {

    }

    actions
    {
        addafter(ActivityLog)
        {
            action(EmailDocumentCBR)
            {
                CaptionML = ENU = 'Email Invoice';
                Promoted = true;
                PromotedIsBig = true;
                Image = Email;
                PromotedCategory = Process;
                ApplicationArea = All;
            }
        }

    }
    var

}