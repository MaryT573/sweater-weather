class WeatherFacade
    def self.current(location)
        parsed_json = WeatherService.get_weather(location) 
        CurrentWeather.new(parsed_json[:current])
    end
    
    def self.hourly(location)
        parsed_json = WeatherService.get_weather(location)
        parsed_json[:hourly][0..7].map do |hourly_weather| 
            HourlyWeather.new(hourly_weather)
        end
    end

    def self.future(location)
        parsed_json = WeatherService.get_weather(location)
        parsed_json[:daily][0..4].map do |daily_weather| 
            DailyWeather.new(daily_weather)
        end
    end

    def self.forecast(location)
        parsed_json = WeatherService.get_weather(location)
        Forecast.new(parsed_json)
    end

    def self.hourly_eta(location, time)
        parsed_json = WeatherService.get_weather(location)
        time = time - 1
        data = parsed_json[:hourly][time] 
        WeatherEta.new(data)
    end
end