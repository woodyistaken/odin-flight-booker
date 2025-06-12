class BookingsController < ApplicationController
  def new
    @booking=Booking.new
    @booking.flight=Flight.find(params[:flight_id])
    params[:num_passengers].to_i.times { @booking.passengers.build() }
  end
  def create
    @booking=Booking.new
    book_param=booking_params
    @booking.flight=Flight.find(book_param[:flight])
    book_param[:passengers_attributes].each_value do |hash|
      @booking.passengers.build(name: hash[:name], email: hash[:email])
    end
    if @booking.save
      redirect_to @booking
    else
      render :new, status: :unprocessable_entity
    end
  end
  def show
    @booking=Booking.find(params[:id])
  end
  private
  def booking_params
    params.expect(booking: [ :flight, passengers_attributes: [ [ :name, :email ] ] ])
  end
end
