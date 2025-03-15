using CatalogService as service from '../../srv/CatalogService';

annotate service.POs with @(

    // Selection Fields - Add fields for selection data
    UI.SelectionFields: [
        PO_ID,
        PARTNER_GUID.COMPANY_NAME,
        PARTNER_GUID.ADDRESS_GUID.CITY,
        GROSS_AMOUNT,
        OVERALL_STATUS
    ],

    // Line Item - Add line item to the table
    UI.LineItem       : [
        {
            $Type: 'UI.DataField',
            Value: PO_ID
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.ADDRESS_GUID.CITY
        },
        {
            $Type: 'UI.DataField',
            Value: GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataFieldForAction',
            Action: 'CatalogService.Add_GrossAmount',
            Label : 'Update',
            Inline: true,
        },
        {
            $Type      : 'UI.DataField',
            Value      : OverallStatus,
            Criticality: StatusCriticality
        }
    ],

    UI.HeaderInfo     : {
        TypeName      : 'Purchase Order',
        TypeNamePlural: 'Purchase Orders',
        Title         : {
            $Type: 'UI.DataField',
            Value: PO_ID
        },
        Description   : {
            $Type: 'UI.DataField',
            Value: PARTNER_GUID.COMPANY_NAME
        },
        ImageUrl      : 'https://upload.wikimedia.org/wikipedia/commons/thumb/c/c1/Google_%22G%22_logo.svg/768px-Google_%22G%22_logo.svg.png'
    },

    UI.Facets :
    [
        {
        $Type : 'UI.CollectionFacet',
        Label : 'General Information',
        Facets: 
            [
                {
                    $Type : 'UI.ReferenceFacet',
                    Target: '@UI.Identification',
                    Label : 'Purchase Order Details'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Pricing',
                    Target : '@UI.FieldGroup#MyFieldGroup'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'Status',
                    Target : '@UI.FieldGroup#MyFieldGroup2'
                },
                {
                    $Type : 'UI.ReferenceFacet',
                    Label : 'PO Lineitems',
                    Target : 'Items/@UI.LineItem'
                }
            ],
        },
    ],

    UI.Identification : [
        {
            $Type : 'UI.DataField',
            Value : PO_ID
        },
        {
            $Type : 'UI.DataField',
            Value : NODE_KEY
        },
        {
            $Type : 'UI.DataField',
            Value : OVERALL_STATUS
        }
    ],

    UI.FieldGroup #MyFieldGroup : {
        Label : 'Pricing Information',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : GROSS_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : NET_AMOUNT
            },
            {
                $Type : 'UI.DataField',
                Value : TAX_AMOUNT
            },
        ],
    },

    UI.FieldGroup #MyFieldGroup2 : {
        Label : 'Status',
        Data : [
            {
                $Type : 'UI.DataField',
                Value : LIFECYCLE_STATUS
            },
            {
                $Type : 'UI.DataField',
                Value : CURRENCY_code
            },
        ],
    },
);

annotate service.PurchaseOrderItems with @(
    UI.LineItem: [
        {
            $Type : 'UI.DataField',
            Value : PO_ITEM_POS
        },
        {
            $Type : 'UI.DataField',
            Value : PRODUCT_GUID_NODE_KEY
        },
        {
            $Type : 'UI.DataField',
            Value : GROSS_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : TAX_AMOUNT
        },
        {
            $Type : 'UI.DataField',
            Value : CURRENCY_code
        }
    ]
);
