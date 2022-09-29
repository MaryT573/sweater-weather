# Sweater Weather

#### Here is the application sweater weather. It allows you to query for forecast information in a specific city, create a user account, retrieve a user account's api key using a email and password set up during the user account creation, and lastly when using the api key plot a route between two city's and get a weather forecast for the hour of estimated arrival in the destination city.

## Endpoints
#### http://localhost:3000/api/v1/forecast (To use this endpoint you will need to enter a city as a location param)
#### http://localhost:3000/api/v1/users (To use this endpoint you will need to pass a Json payload in the body of the request including Username, password, and password_confirmation, this will grant you a api key)
#### http://localhost:3000/api/v1/sessions (To use this endpoint you will need to pass a Json payload in the body of the request including an existing Username and password. This will return your previously created api key)
#### http://localhost:3000/api/v1/road_trip (To use this endpoint you will need to pass a Json payload in the body of the request that includes your api key, starting city, and destination city)

## Keys
#### This application uses Mapquest and OpenWeather apis, so keys for both of those applications are required to run.