class WeatherEta
    attr_reader :time, :temperature, :conditions

    def initialize(data)
        @time = Time.at(data[:dt]).to_datetime 
        @temperature = data[:temp]
        @conditions = data[:weather].first[:description]
    end
end