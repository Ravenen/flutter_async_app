
# Vending Machines App

An app for viewing vending machines.

### Prehistory

For this lab I used my **own** API from the [backend](https://e4c577p993.execute-api.us-east-2.amazonaws.com/dev/vending_machine/) I wrote for the Cloud Technologies course.  
  
In the Flutter app I created a counter wich displays a number of orders placed in vending machines during the app run. The implementation is a stream wich serves as a SSE of new orders.

## Technologies used
- **async functions and Future** for HTTP calls to the API and its display
- **custom BLoC** for orders placed counter and "Clear" button
- **custom events** to pass events to the BLoC
- **Provider** to provide the BLoC globally
- **Future- and StreamBuilder** to display Future's and Stream's 

## Demo


https://user-images.githubusercontent.com/57559975/142503670-6440dfa7-ec6a-4ac5-b777-8c5396233d19.mp4

