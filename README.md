# xbe_technical_task

## Description
This project implements an API for managing locations and their associated air qualities.

## Prerequisites
- Ruby (version 2.7.5)
- Bundler
- OpenWeatherMap API key (`OPENWEATHERMAP_API_KEY`)

## Installation
1. ### Clone the repository:
   ```bash
   git clone https://github.com/shimroz1992/xbe_technical_task

2. ### Install dependencies:
   
   `bundle install`   
3. ### Set up the database:

   `rails db:create`  
   `rails db:migrate`    
4. ### Seed the database with initial data:

    `rails db:seed`

    Run the Server:  

    `rails s`   

5. ### Sample Test Cases:  
  Test that the Location model is valid with correct latitude and longitude values.

Test that the WeatherService fetches air pollution data successfully for a given location.  

Test that the AirQualityImporter parses and saves the fetched air quality data correctly.  

Test that the scheduled task runs successfully and imports air quality data periodically.      

## Execution:  
Run RSpec tests:

`bundle exec rspec`

rubocop tests:

`rubocop` or `rubocop -A`

6. ### Swagger Documentation:
Access the Swagger documentation for the API: `http://localhost:3000/api-docs/index.html`    


Thank you for taking the time to explore this repository! Your feedback and contributions are highly appreciated. If you have any questions, suggestions, or encounter any issues, please don't hesitate to open an issue or reach out to us. Together, let's make this project even better!
