class WeatherService

    def self.conn
        Faraday.new(url: 'https://api.openweathermap.org')
    end

    def self.get_weather(location)
        response = conn.get("/data/2.5/onecall") do |faraday|
            faraday.params['appid'] = ENV['weather_key']
            faraday.params['exclude'] = 'minutely,alerts'
            faraday.params['lon'] = location[:lng]
            faraday.params['lat'] = location[:lat]
            faraday.params['units'] = 'imperial'
        end
        JSON.parse(response.body, symbolize_names: true)
    end
end