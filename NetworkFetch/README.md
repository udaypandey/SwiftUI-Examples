#  Network Fetch Using Combine

This is bare bones version of fetching a REST API worth of data from the cloud and rendering it using SwiftUI.
There is no proper handling logic and errors are suppressed using default data instead.

Ideally proper error codes should be propagated to show the right error message. Worth doing a separate sample project to see if the response should be wrapped in Result to provide both content and error. That way we avoid closing the subscription and still provide meaning response to UI.

The app triggers a network request on startup and then provides a refresh button to refresh the data on the fly.

Depending on the business requirements, the data fetch logic may differ:
1. Data fetch may be done at startup
2. Data fetch could be an interim step on its own or 
3. It could be done as part of loading a particular screen.

