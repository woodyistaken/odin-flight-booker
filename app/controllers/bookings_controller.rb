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
    book_param[:passengers_attributes].each_value do |passenger|
      @booking.passengers.build(name: passenger[:name], email: passenger[:email])
    end
    if @booking.save
      book_param[:passengers_attributes].each_value do |passenger|
        PassengerMailer.confirm_email(Passenger.new(passenger)).deliver_later
      end
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
