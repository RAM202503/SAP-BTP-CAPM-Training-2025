namespace CMMPortal.db;

using { cuid, managed, temporal, Currency, Country } from '@sap/cds/common';

using { CMMPortal.common } from './reusecommon';


context master {
    entity businesspartner {
        key NODE_KEY : common.Guid @title : '{i18n>NODE_KEY}';
        BP_ROLE : String(2) @title : '{i18n>BP_ROLE}';
        EMAIL_ADDRESS : String(105) @title : '{i18n>EMAIL_ADDRESS}';
        PHONE_NUMBER : String(32) @title : '{i18n>PHONE_NUMBER}';
        FAX_NUMBER : String(32) @title : '{i18n>FAX_NUMBER}';
        WEB_ADDRESS : String(44) @title : '{i18n>WEB_ADDRESS}';
        ADDRESS_GUID : Association to address @title : '{i18n>ADDRESS_GUID}';
        BP_ID : String(32) @title : '{i18n>BP_ID}';
        COMPANY_NAME : String(250) @title : '{i18n>COMPANY_NAME}';
    }
    entity address {
        key NODE_KEY: common.Guid @title : '{i18n>NODE_KEY}';
        CITY: String(44) @title : '{i18n>CITY}';
        POSTAL_CODE: String(8) @title : '{i18n>POSTAL_CODE}';
        STREET: String(44) @title : '{i18n>STREET}';
        BUILDING: String(128) @title : '{i18n>BUILDING}';
        COUNTRY: String(44) @title : '{i18n>COUNTRY}';
        ADDRESS_TYPE: String(44) @title : '{i18n>ADDRESS_TYPE}';
        VAL_START_DATE: Date @title : '{i18n>VAL_START_DATE}';
        VAL_END_DATE: Date @title : '{i18n>VAL_END_DATE}';
        LATITUDE: Decimal @title : '{i18n>LATITUDE}';
        LONGITUDE: Decimal @title : '{i18n>LONGITUDE}';
        businesspartner: Association to one businesspartner on
        businesspartner.ADDRESS_GUID = $self;
    }

    entity product{
        key NODE_KEY: common.Guid;
        PRODUCT_ID: String(28);
        TYPE_CODE: String(2);
        CATEGORY: String(32);
        DESCRIPTION: localized String(255);
        SUPPLIER_GUID: Association to master.businesspartner;
        TAX_TARIF_CODE: Integer;
        MEASURE_UNIT: String(2);
        WEIGHT_MEASURE: Decimal(5,2);
        WEIGHT_UNIT: String(2);
        CURRENCY_CODE: String(4);
        PRICE:Decimal(15,2);
        WIDTH:Decimal(5,2);
        DEPTH:Decimal(5,2);
        HEIGHT:Decimal(5,2);
        DIM_UNIT:String(2);
    }

    entity employees: cuid {
        nameFirst: String(40);
        nameMiddle: String(40);
        nameLast: String(40);
        nameInitials: String(40);
        sex: common.Gender;
        language: String(1);
        phoneNumber: common.phoneNumber;
        email: common.Email;
        loginName: String(12);
        Currency: Currency;
        salaryAmount: common.AmountT;
        accountNumber: String(16);
        bankId: String(8);
        bankName: String(64);
    }
}

context transaction {
    entity purchaseorder: common.Amount{
        key NODE_KEY: common.Guid @title : '{i18n>NODE_KEY}';
        PO_ID: String(40) @title : '{i18n>PO_ID}';
        PARTNER_GUID: Association to master.businesspartner; 
        LIFECYCLE_STATUS: String(1) @title : '{i18n>LIFECYCLE_STATUS}';
        OVERALL_STATUS: String(1) @title : '{i18n>OVERALL_STATUS}';
        Items: Association to many poitems on Items.PARENT_KEY = $self;
    }

    entity poitems: common.Amount{
        key NODE_KEY: common.Guid @title : '{i18n>NODE_KEY}';
        PARENT_KEY: Association to purchaseorder;
        PO_ITEM_POS: Integer @title : '{i18n>PO_ITEM_POS}';
        PRODUCT_GUID: Association to master.product;
    }
}