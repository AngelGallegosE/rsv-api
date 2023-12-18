# README

## Versions:
- Rails: 7.1.1
- Ruby: 3.2.2

## Instructions:
1. PLEASE VERIFY THE AVAILABILITY OF THE OPEN WEATHER MAP KEY: The free keys have a limited number of calls per day.
2. For security reasons, the OpenWeatherMap app key is not committed. Please paste the key in 
the `app/services/open_weather_map_api.rb` file, within the `APP_KEY = ''` variable.
3. Run 'bundle install'.
4. This is the curl:
```
curl --request GET \
  --url 'http://127.0.0.1:3000/api/v1/weathers/search?city=morelia' \
  --header 'User-Agent: insomnia/8.4.5'
```
the only query params is: `city`

The expected response:
```
[
  {
    "city_name": "Morelia",
    "daily": [
      {
        "day": 19,
        "min": 7.12,
        "max": 22.28
      },
      {
        "day": 20,
        "min": 9.53,
        "max": 23.16
      },
      {
        "day": 21,
        "min": 10.28,
        "max": 23.54
      },
      {
        "day": 22,
        "min": 10.94,
        "max": 23.28
      },
      {
        "day": 23,
        "min": 12.3,
        "max": 20.35
      },
      {
        "day": 24,
        "min": 10.59,
        "max": 23.77
      },
      {
        "day": 25,
        "min": 10.81,
        "max": 21.99
      }
    ]
  },
  {
    "city_name": "Morelos",
    "daily": [
      {
        "day": 19,
        "min": 10.69,
        "max": 18.26
      },
      {
        "day": 20,
        "min": 10.57,
        "max": 20.37
      },
      {
        "day": 21,
        "min": 13.56,
        "max": 21.13
      },
      {
        "day": 22,
        "min": 14.76,
        "max": 16.88
      },
      {
        "day": 23,
        "min": 13.8,
        "max": 24.05
      },
      {
        "day": 24,
        "min": 15.16,
        "max": 23.04
      },
      {
        "day": 25,
        "min": 14.31,
        "max": 19.13
      }
    ]
  },

  ...
]
```
