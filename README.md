# WeatherMap
Coding Challenge: Weather

Public API accessed:
Created a free account at openweathermap.org. Full documentation for the service below is on their site.
http://api.openweathermap.org/data/2.5/weather?q=Westervile,oh,us&APPID=YOUR_APP_ID
Icons are retrieved here:
http://openweathermap.org/weather-conditions

Implementation:
* Created a native-app based application to server as a basic weather app.
* It is a single screen application with search bar at the top to help user search the city they are interested.
* Beneath the search bar
  a) user is shown a message to enter a city if the search is not performed.
  b) activity spinner is shown on search in progress
  c) table view with results is shown if the response is received from the server successfully.
  
Steps to test: 
* Allow customer to enter a US city
* Search the city to retrieve weather info
* Call the openweathermap.org API and display the information you think a user would be interested in seeing. App download and display a weather icon.
* Auto load the last city searched upon app launch.

Included:
* Proper function – requirements met.
* Implemented in MVVM design pattern.
* Well constructed, easy-to-follow, commented code
* Proper separation of concerns and best-practice coding patterns.
* Optimized it well.
* Defensive code that graciously handles unexpected edge cases.
* Developed test suite using XCTestCases for session calls, view model, helper and models tests
* Loosely Coupled Design.
* Constants and other global utilities are organized well.
* Included localized strings, enum and error classes.
* Included helper classes to reduce the heavy lifting performed for math and buisness logic on various classes.
* Few additional information read from weather forecast server
* Tested all the requirements

