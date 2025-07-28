/* @description Wrapper class modeling the response from the Alpha Vantage API

    @see https://www.alphavantage.co/documentation/
    @see https://www.alphavantage.co/support/#api-key
    @see https://www.alphavantage.co/documentation/#stock-quote
    @see https://www.alphavantage.co/documentation/#daily-adjusted
    @see https://www.alphavantage.co/documentation/#intraday

    {
        "Global Quote": {
            "01. symbol": "IBM",
            "02. open": "173.5500",
            "03. high": "175.9900",
            "04. low": "173.0000",
            "05. price": "175.4500",
            "06. volume": "4399818",
            "07. latest trading day": "2024-07-26",
            "08. previous close": "173.2900",
            "09. change": "2.1600",
            "10. change percent": "1.2465%"
        }
    }

    JSON.deserialize() to map incoming JSON string to Apex object.
*/


public class StockApiResponseWrapper {
    // top-level JSON object = Global Quote

    public GlobalQuote globalQuote;
    public class GlobalQuote {
        @SerializedName ('05. price')
        public String price;

        @SerializeName('01. symbol')
        public String symbol;
    }
}