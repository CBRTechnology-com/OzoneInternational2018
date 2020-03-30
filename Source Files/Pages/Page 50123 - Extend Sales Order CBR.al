pageextension 50123 ExtendSalesOrderCBR extends "Sales Order"
{
    layout
    {

    }

    actions
    {
        addafter("Pick Instruction")
        {
            action("EmailDocumentCBR")
            {
                CaptionML = ENU = 'EMail Order';
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