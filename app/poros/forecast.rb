class Forecast
    attr_reader :current_weather, :daily_weather, :hourly_weather, :id
    
    def initialize(data) 
        @current_weather = CurrentWeather.new(data[:current])
        @id = nil
        @daily_weather = data[:daily].first(5).map do |x|
            DailyWeather.new(x)
        end

        @hourly_weather = data[:hourly].first(8).map do |x|
            HourlyWeather.new(x)
        end
    end
end