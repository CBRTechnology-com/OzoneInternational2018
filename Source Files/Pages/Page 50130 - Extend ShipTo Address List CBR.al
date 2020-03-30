pageextension 50130 ExtendShipToAddressList extends "Ship-to Address List"
{
    layout
    {
        addafter("Location Code")
        {
            field("Responsibility Center"; "Responsibility Center CBR")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        addfirst("&Address")
        {
            action("Default Dimensions CBR")
            {
                ShortcutKey = 'Shift+Ctrl+D';
                CaptionML = ENU = 'Dimensions', ESM = 'Dimensions', FRC = 'Dimensions', ENC = 'Dimensions';
                Promoted = true;
                Image = Dimensions;
                PromotedCategory = Process;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    OpenDefaultDimensions;
                end;
            }
        }
        addafter("Online Map")
        {
            action("Linked Fixed Assets")
            {
                RunObject = page 5601;
                RunPageLink = "Customer No. CBR" = field("Customer No."), "Ship-to Code CBR" = field(Code);
                Promoted = true;
                PromotedIsBig = true;
                Image = FARegisters;
                PromotedCategory = Process;
                ApplicationArea = All;
            }

        }
    }

    var
        myInt: Integer;

    PROCEDURE OpenDefaultDimensions();
    VAR
        DefaultDimensions: Page 540;
        DefaultDimension: Record 352;
    BEGIN
        //OZI0002 >>
        CLEAR(DefaultDimensions);
        DefaultDimension.SETRANGE("Table ID", DATABASE::"Ship-to Address");
        DefaultDimension.SETRANGE("No.", "Customer No." + '~' + Code);
        DefaultDimensions.SETTABLEVIEW(DefaultDimension);
        DefaultDimensions.SETRECORD(DefaultDimension);
        DefaultDimensions.RUNMODAL;
        //OZI0002 <<
    END;

}