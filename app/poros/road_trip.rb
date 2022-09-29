class RoadTrip
    attr_reader :time, :bordercrossing, :blocked

    def initialize(data)
        @time = data[:formattedTime]
        @bordercrossing = data[:hasCountryCross]
        @blocked = data[:hasAccessRestriction]
    end
    
end