sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'tcs/sd/managepurchaseorder/test/integration/FirstJourney',
		'tcs/sd/managepurchaseorder/test/integration/pages/POsList',
		'tcs/sd/managepurchaseorder/test/integration/pages/POsObjectPage',
		'tcs/sd/managepurchaseorder/test/integration/pages/PurchaseOrderItemsObjectPage'
    ],
    function(JourneyRunner, opaJourney, POsList, POsObjectPage, PurchaseOrderItemsObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            // start index.html in web folder
            launchUrl: sap.ui.require.toUrl('tcs/sd/managepurchaseorder') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onThePOsList: POsList,
					onThePOsObjectPage: POsObjectPage,
					onThePurchaseOrderItemsObjectPage: PurchaseOrderItemsObjectPage
                }
            },
            opaJourney.run
        );
    }
);