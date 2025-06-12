class FlightsController < ApplicationController
  def index
    @options={ departure_airport: params[:departure_airport_id],
                arrival_airport: params[:arrival_airport_id],
                start: params[:start],
                num_passengers: params[:num_passengers] }
    @flights=Flight.all
    if !params[:departure_airport_id].nil?
      @searched_flights=Flight.all.where(departure_airport: Airport.find(params[:departure_airport_id]),
                              arrival_airport: Airport.find(params[:arrival_airport_id]),
                              start: params[:start])
    end
  end
end
