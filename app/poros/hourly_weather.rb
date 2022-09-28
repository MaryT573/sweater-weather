class HourlyWeather
    attr_reader :time,
                :temperature,
                :conditions,
                :icon
                
    def initialize(data)
        @time = Time.at(data[:dt]).to_datetime
        @temperature = data[:temp]
        @conditions = data[:weather].first[:description]
        @icon = data[:weather].first[:icon]
    end

    def self.eta(data) 
        eta_time = Time.at(data[:dt]).to_datetime 
        eta_temperature = data[:temp]
        eta_conditions = data[:weather].first[:description]
        require 'pry'; binding.pry 
    end
end