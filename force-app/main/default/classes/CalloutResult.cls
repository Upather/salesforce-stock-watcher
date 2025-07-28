/**
 * @description wrapper class providing safe result for callouts
 * Provide error rich information
 * Prevent nullpointer exceptions
 */

public class CalloutResult {
    // callout successful
    public Boolean isSuccess { get; private set; } // properties are now read-only

    // if else / try catch
    // parsed data container
    public StockApiResponseWrapper data { get; private set; }

    // to provide error message on failure
    public String errorMessage { get; private set; }

    /**
     * @description constructor creating result object
     * @param isSuccess operation successful?
     * @param data payload if successful else null
     * @param errorMessage error details if failed (null if success)
     */

    public CalloutResult(Boolean isSuccess, StockApiResponseWrapper data, String errorMessage) {
        this.isSuccess = isSuccess;
        this.data = data;
        this.errorMessage = errorMessage;
    }

    // handle security {getprivateset}
}