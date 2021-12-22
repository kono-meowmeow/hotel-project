class BookingsController < ApplicationController

    def new
        @hotel = Hotel.find(params[:hotel_id])
        @booking = @hotel.bookings.build
    end

    def create
        hotel = Hotel.find(params[:hotel_id]) 
        booking = Booking.new(booking_params) 
        if booking.save
            redirect_to hotel_booking_path(hotel,booking)
        end
    end

    def index
        @hotel = Hotel.find(params[:hotel_id])
        @bookings = @hotel.bookings
    end

    def show
        @hotel = Hotel.find(params[:hotel_id])
        @booking = Booking.find(params[:id])
    end

    def edit
        @hotel = Hotel.find(params[:hotel_id])
        @booking = Booking.find(params[:id])
    end

    def update
        hotel = Hotel.find(params[:hotel_id])
        booking = Booking.find(params[:id])
        if booking.update(booking_params)
            redirect_to hotel_booking_path(hotel,booking)
        end
    end

    def destroy
        hotel = Hotel.find(params[:hotel_id])
        booking = Booking.find(params[:id])
        if booking.destroy
            redirect_to hotel_bookings_path(hotel)
        end
    end

    private
    def booking_params
        params.require(:booking).permit(:name, :emailaddress, :hotel_id, :checkin, :checkout, :numberofpeople)
    end

end
