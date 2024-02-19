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

5. ### Run the Server:  

    `rails s`   

6. ### Sample Test Cases:  
  	Test that the Location model is valid with correct latitude and longitude values.

	Test that the WeatherService fetches air pollution data successfully for a given location.  

	Test that the AirQualityImporter parses and saves the fetched air quality data correctly.  

	Test that the scheduled task runs successfully and imports air quality data periodically.      

	## Execution:  
	Run RSpec tests:

	`bundle exec rspec`

	rubocop tests:

	`rubocop` or `rubocop -A`

7. ### Swagger Documentation:
	Access the Swagger documentation for the API: `http://localhost:3000/api-docs/index.html`

8. Here you can find we are fetching and storing the historical air pollution data for every location for one year without crashing application.
   ![seed_data](https://github.com/shimroz1992/xbe_technical_task/assets/16288470/af51b854-a827-4e96-b03a-7574f22f189b)

9. Below is attached screenshots of swaggers documentation.   
   ![endpoint_1](https://github.com/shimroz1992/xbe_technical_task/assets/16288470/43254100-ab2e-4b21-a652-6b2382c877a7)
   
   ![endpoint_2](https://github.com/shimroz1992/xbe_technical_task/assets/16288470/d8d4335b-eac2-4fb7-b531-ea13db40be2a)
   
   ![endpoint_3](https://github.com/shimroz1992/xbe_technical_task/assets/16288470/bf56c459-2402-4ccf-a97b-67befc4bb6aa)
   

	Thank you for taking the time to explore this repository! Your feedback and contributions are highly appreciated. If you have any questions, suggestions, or encounter any issues, please don't hesitate to open an issue or reach out to us. Together, let's make this project even better!
