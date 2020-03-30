tableextension 50058 ExtendGLEntryCBR extends "G/L Entry"
{
    fields
    {
        field(50000; "Customer No./Ship-to CBR"; Code[20])
        {
            Caption = 'Customer No./Ship-to';

        }
        field(50002; "Service Order No. CBR"; Code[20])
        {
            Caption = 'Service Order No.';
        }

    }

    var

}