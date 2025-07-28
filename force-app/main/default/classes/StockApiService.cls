// public class StockApiService {
//     private static final String STOCK_API_ENDPOINT = 'callout:Stock_Data_API/query';

//     private static final String API_KEY;
// }

public class StockApiService {

    /**
     * @description makes callout to stock api to get latest price for given symbols
     * @param stockSymbols A list of stock symbols to lookup
     * @return Map<String, CalloutResult> results = new Map<String, CallloutResult>();
     */

    // best practice for explicit private declaration?

     //base endpoint for named credential
     private static final String STOCK_API_ENDPOINT = 'callout:Stock_Data_API/query';

    // store api key retrieved from custom metadata
    private static final String API_KEY;

    // fetch api key once from custom metadata when class is first loaded
    static {
        API_Configuration__mdt config = [
            SELECT API_KEY 
            FROM API_Configuration__mdt 
            WHERE DeveloperName = 'Stock_API'
            LIMIT 1
        ];
        API_KEY = config.API_Key__c;
    }

    public static Map<String, CalloutResult> getStockPrices(List<String> stockSymbols) {
        // empty map placeholder

        Map<String, CalloutResult> results = new Map<String, CalloutResult>();

        // 1 create full request
        for (String symbol : stockSymbol) {
            String fullUrl = STOCK_API_ENDPOINT;
            fullUrl += '?function=GLOBAL_Quote';
            fullUrl += '&symbol=' + symbol;
            fullUrl += '&apikey=' + API_KEY;

            // 2. http request
            HttpRequest request = new HttpRequest();
            request.setEndpoint(fullUrl);
            request.getMethod('GET');
            request.setTimeout(10000); // 10 second timeout - limit


            // 3. send request
            try {
                Http http = new Http();
                HttpResponse response = http.send(request);

                // responsse handling placeholder
            } catch (System.CalloutException e){
                String errorMessage = 'A CalloutException occurred: ' + e.getMessage();
                System.debug(errorMessage);

                // add failure result to the map
                // fill calloutresult class - ( isSuccess, StockApiResponseWrapper, errorMessage )
                results.put(symbol, new CalloutResult(false, null, errorMessage));
            }
        }

        return results;
    }
}