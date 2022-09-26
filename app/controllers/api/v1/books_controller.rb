class Api::V1::BooksController < ApplicationController
    def index
        city = MapFacade.find_lat_long(forecast_params)
        weather = WeatherFacade.current(city)
        books = BookFacade.search_books(location[:location])
        book_count = books.count
        data = []
        data.push(location, book_count, weather, books)
        render json: data, include: [:location, :book_count, :weather, :books]
      end
      
    private
        
    def location
        params.permit(:location)
    end
    def forecast_params
        params.permit(:location)
    end
end