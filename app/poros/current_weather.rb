class CurrentWeather
    attr_reader :datetime, 
                :sunrise, 
                :sunset, 
                :temperature, 
                :feels_like, 
                :humidity, 
                :uvi, 
                :visibility, 
                :conditions,
                :icon

    def initialize(data) 
        @datetime = Time.at(data[:dt]).to_datetime
        @sunrise = Time.at(data[:sunrise]).to_datetime
        @sunset = Time.at(data[:sunset]).to_datetime
        @feels_like = data[:feels_like]
        @temperature = data[:temp]
        @humidity = data[:humidity]
        @uvi = data[:uvi]
        @visibility = data[:visibility]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end
end