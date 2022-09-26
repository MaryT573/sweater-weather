class Forecast
    attr_reader :current_weather, :daily_weather, :hourly_weather
    
    def initialize(data)
        @current_weather = CurrentWeather.new(data[:current])
        
        @daily_weather = data[:daily].map do |x|
            DailyWeather.new(x)
        end

        @hourly_weather = data[:hourly].map do |x|
            HourlyWeather.new(x)
        end
    end
end