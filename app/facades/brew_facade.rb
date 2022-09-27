class BrewFacade
    def self.get_brew(location, quantity)
        parsed_json = BrewService.brew_search(location, quantity)
        parsed_json.map do |brews| 
            Brewery.new(brews)
        end
    end
end