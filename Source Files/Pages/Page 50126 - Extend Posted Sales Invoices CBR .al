pageextension 50126 ExtendPostedSalesInvoicesCBR extends "Posted Sales Invoices"
{

    layout
    {
        // Add changes to page layout here
    }

    actions
    {
        addafter(ActivityLog)
        {
            action(EMailDocumentCBR)
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