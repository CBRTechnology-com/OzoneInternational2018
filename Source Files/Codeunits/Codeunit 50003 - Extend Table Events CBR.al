codeunit 50003 "Extend Table Events CBR"
{

    trigger OnRun();
    begin
    end;

    var
        InvtSetup: Record "Inventory Setup";
        ItemVendor: Record "Item Vendor";
        GLSetup: Record "General Ledger Setup";
        HasInvtSetup: Boolean;



    [EventSubscriber(ObjectType::Table, DATABASE::"Cust. Ledger Entry", 'OnAfterValidateEvent', 'Description', false, false)]
    local procedure DescriptionOnAfterValidate(var Rec: Record "Cust. Ledger Entry"; var xRec: Record "Cust. Ledger Entry"; CurrFieldNo: Integer);
    begin
        if Rec."Original Description CBR" = '' then
            Rec."Original Description CBR" := xRec.Description;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::Item, 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInsertItem(var Rec: Record Item; RunTrigger: Boolean);
    begin
        // OZI0002 >>
        Rec."Costing Method" := InvtSetup."Default Costing Method";
        //Message(format(Invtsetup."Default Costing method"));
        // OZI0002 <<
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::Item, 'OnAfterValidateEvent', 'No.', false, false)]
    local procedure NoOnAfterValidate(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer);
    begin
        // OZI0002 >>
        Rec."Costing Method" := InvtSetup."Default Costing Method";
        //Message(format(Invtsetup."Default Costing method"));
        // OZI0002 <<
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::Item, 'OnAfterValidateEvent', 'Vendor Item No.', false, false)]
    local procedure VendorItemNoOnAfterValidate(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer);
    begin
        // OZI0001 >>
        if (Rec."Vendor No." <> '') and (Rec."Vendor Item No." <> '') then begin
            ItemVendor.RESET;
            ItemVendor.SETRANGE("Vendor No.", Rec."Vendor No.");
            ItemVendor.SETRANGE("Item No.", Rec."No.");
            if not ItemVendor.FINDFIRST then begin
                ItemVendor.INIT;
                ItemVendor."Item No." := Rec."No.";
                ItemVendor.VALIDATE("Vendor No.", Rec."Vendor No.");
                ItemVendor."Vendor Item No." := Rec."Vendor Item No.";
                ItemVendor.INSERT(true);

            end else begin
                ItemVendor."Vendor Item No." := Rec."Vendor Item No.";
                ItemVendor.MODIFY(true);

            end;
        end;
        // OZI0001 <<
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::Item, 'OnAfterValidateEvent', 'Item Category Code', false, false)]
    local procedure ItemCategoryCodeOnAfterValidate(var Rec: Record Item; var xRec: Record Item; CurrFieldNo: Integer);
    begin
        // OZI0002 >>
        GetInvtSetup;
        Rec."Costing Method" := InvtSetup."Default Costing Method";
        //Message(format(Invtsetup."Default Costing method"));
        // OZI0002 <<
    end;

    procedure GetInvtSetup();
    begin
        if not HasInvtSetup then begin
            InvtSetup.GET;
            HasInvtSetup := true;
        end;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Sales Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInsertSalesHeader(var Rec: Record "Sales Header"; RunTrigger: Boolean);
    begin
        //GA06 fill in Assigned User ID
        Rec."Assigned User ID" := USERID;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Purchase Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInsertPurchaseHeader(var Rec: Record "Purchase Header"; RunTrigger: Boolean);
    begin
        //GA06 fill in Assigned User ID
        Rec."Assigned User ID" := USERID;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Ship-to Address", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInsertShipToAddress(var Rec: Record "Ship-to Address"; RunTrigger: Boolean);
    var
        GLSetup: Record "General Ledger Setup";
        DimensionValue: Record "Dimension Value";
        DefaultDimension: Record "Default Dimension";
    begin
        //OZI0001 >>
        GLSetup.GET;
        with Rec do begin
            CLEAR(DimensionValue);
            DimensionValue."Dimension Code" := GLSetup."Shortcut Dimension 8 Code";
            DimensionValue.Code := Code;
            DimensionValue.Name := Name;
            DimensionValue."Dimension Value Type" := DimensionValue."Dimension Value Type"::Standard;
            if not DimensionValue.INSERT(true) then;

            CLEAR(DefaultDimension);
            DefaultDimension.VALIDATE("Table ID", DATABASE::"Ship-to Address");
            DefaultDimension."No." := "Customer No." + '~' + Code;
            DefaultDimension."Dimension Code" := GLSetup."Shortcut Dimension 8 Code";
            DefaultDimension."Dimension Value Code" := Code;
            DefaultDimension."Value Posting" := DefaultDimension."Value Posting"::"Same Code";
            if not DefaultDimension.INSERT(false) then;
        end;
        //OZI0001 <<
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Assembly Header", 'OnAfterInsertEvent', '', false, false)]
    local procedure OnInsertAssemblyHeader(var Rec: Record "Assembly Header"; RunTrigger: Boolean);
    begin
        //GA06 fill in Assigned User ID
        Rec."Assigned User ID" := USERID;
    end;

    [EventSubscriber(ObjectType::Table, DATABASE::"Fixed Asset", 'OnAfterValidateEvent', 'Customer No. CBR', false, false)]
    local procedure CustomerNoOnAfterValidate(var Rec: Record "Fixed Asset"; var xRec: Record "Fixed Asset"; CurrFieldNo: Integer);
    begin
        if Rec."Customer No. CBR" <> xRec."Customer No. CBR" then
            Rec."Ship-to Code CBR" := '';
    end;

    //[EventSubscriber(ObjectType::Table, DATABASE::"Service Header", 'OnAfterInsertEvent', '', false, false)]
    //local procedure OnInsertServiceHeader(var Rec: Record "Service Header"; RunTrigger: Boolean);
    //begin
    //    //GA06 fill in Assigned User ID
    //Rec."Assigned User ID" := USERID;
    //end;

    //[EventSubscriber(ObjectType::Table, DATABASE::"Service Header", 'OnAfterValidateEvent', 'Customer No.', false, false)]
    //local procedure CustomerNoOnAfterValidateServiceHeader(var Rec: Record "Service Header"; var xRec: Record "Service Header"; CurrFieldNo: Integer);
    //begin
    //end;



}

