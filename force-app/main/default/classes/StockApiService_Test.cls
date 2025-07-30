@isTest
private class StockApiService_Test {

    @isTest
    static void myUnitTest() {
        // arrange
        Test.setMock(HttpCalloutMock.class, new StockApiServiceMock());
        List<String> symbolsToTest = new List<String>{'CRM'};

        // act
        Test.startTest();
        Map<String, CalloutResult> results = StockApiService.getStockPrices(symbolsToTest);
        Test.stopTest();

        // assert
        System.assertEquals(1, results.size(), 'Should have one result');
        CalloutResult crmResult = results.get('CRM');

        System.assertNotEquals(null, crmResult, 'Result should not be null');
        System.assertEquals(true, crmResult.isSuccess, 'Should be successful');
        System.assertEquals(null, crmResult.errorMessage, 'Should have no error message.');

        // check the data parse
        System.assertEquals('CRM', crmResult.data.globalQuote.symbol);
        System.assertEquals('250.75', crmResult.data.globalQuote.price);
    }

    // test for failure
    @isTest
    static void testGetStockPrices_Failure() {
        // symbol that will fail - !CRM
        // arrange
        Test.setMock(HttpCalloutMock.class, new StockApiServiceMock());
        List<String> symbolsToTest = new List<String>{'FAIL'};

        // act 
        Test.startTest();
        Map<String, CalloutResult> results = StockApiService.getStockPrices(symbolsToTest);
        Test.stopTest();

        // assert
        System.assertEquals(1, results.size());
        CalloutResult failResult = results.get('FAIL');
        System.assertNotEquals(null, failResult);
        System.assertEquals(false, failResult.isSuccess, 'Should be a failure');
        System.assertNotEquals(null, failResult.errorMessage, 'Should have an error message.');
        System.assertEquals(null, failResult.data, 'Data should be null on failure.');
    }
}