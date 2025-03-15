// Importing necessary objects
// Tables
using { CMMPortal.db.master, CMMPortal.db.transaction } from '../db/datamodel';
// Views
using { CMMPortal.view.CDSViews } from '../db/CDSView';

service CatalogService @(path:'CatalogService') {
        action sum(a: Integer, b : Integer) returns Integer;
    entity BusinessPartnerSet as projection on master.businesspartner;
    entity AddressSet as projection on master.address;
    entity EmployeeSet as projection on master.employees;

    entity POs @(odata.draft.enabled : true) as projection on transaction.purchaseorder{
        *,
        case OVERALL_STATUS
        when 'P' then 'Pending'
        when 'N' then 'New'
        when 'A' then 'Approved'
        when 'X' then 'Rejected'
        end as OverallStatus : String(10),
        case OVERALL_STATUS
        when 'P' then 2
        when 'N' then 2
        when 'A' then 3
        when 'X' then 1
        end as StatusCriticality : Integer,
        Items
    }actions{
        action Add_GrossAmount(id : UUID) returns POs;
        function largestOrder() returns array of POs;
    };
    entity PurchaseOrderItems as projection on transaction.poitems;

//    entity CProductValuesView as projection on CDSViews.CProductValuesView;

//    action boost() returns POs ;

}