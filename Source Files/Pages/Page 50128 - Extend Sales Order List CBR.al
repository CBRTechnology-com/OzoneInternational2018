pageextension 50128 ExtendSalesOrderListCBR extends "Sales Order List"
{
    layout
    {

    }

    actions
    {
        addafter("Pick Instruction")
        {
            action("EMailDocumentCBR")
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