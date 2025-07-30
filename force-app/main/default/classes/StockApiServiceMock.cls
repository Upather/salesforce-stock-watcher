@isTest
public class StockApiServiceMock implements HttpCalloutMock {

    public HttpResponse respond (HttpRequest req) {
        // new httpresponse obj

        // success scenario
        HttpResponse res = new HttpResponse();
        res.setHeader('Content-Type', 'application/json');
        
        //mimic successful response 
        String successBody = '{ "Global Quote": { "01. symbol": "CRM", "05. price": "250.75"} }';

        // check the URL of incoming request
        if (req.getEndpoint().contains('symbol=CRM')) {
            // success
            res.setBody(successBody);
            res.setStatusCode(200);

        } else {
            // for any other symbol (not CRM) simulate error
            res.setBody('{"Error Message": "Invalid API call."}');
            res.setStatusCode(404);
        }
        return res;
    }
}