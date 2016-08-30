# Travel Time Challenge

Implementation of a map to coordiante negotiators based on this [**specification**](https://gist.github.com/edwinwills/841bbd0aeab7c2d66f55#our-problem) (you can explore the application [**here**](https://rentify-map-app.herokuapp.com/))



Prerequisites
--------------
Ruby on Rails installed

Usage
--------------

####Clone the application

`git clone https://github.com/jorgemmsilva/travel_time_challenge.git`

####Install Dependencies
`bundle install`

####Configure secrets
Create file config/application.yml, configure database access and API keys:
```
DATABASE_PASSWORD: "**********"
DATABASE_USERNAME: username
GOOGLE_MAPS_API_KEY: "**********"
CITYMAPPER_API_KEY: "**********"
```

####Run database migrations
`rake db:migrate`

####Start server
`rails s`

App should be up and running on localhost:3000