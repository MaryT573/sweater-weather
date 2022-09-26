class WeatherFacade
    def self.current(location)
        parsed_json = WeatherService.get_weather(location) 
        CurrentWeather.new(parsed_json[:current])
    end
    
    def self.hourly(location)
        parsed_json = WeatherService.get_weather(location)
        parsed_json[:hourly].map do |hourly_weather| 
            HourlyWeather.new(hourly_weather)
        end
    end

    def self.future(location)
        parsed_json = WeatherService.get_weather(location)
        parsed_json[:daily].map do |daily_weather| 
            DailyWeather.new(daily_weather)
        end
    end
end