class ReviewsController < ApplicationController

    def new
        @hotel = Hotel.find(params[:hotel_id])
        @review = @hotel.reviews.build
    end

    def create
        @hotel = Hotel.find(params[:hotel_id])
        @review = Review.new(review_params)
        if @review.save
            redirect_to hotel_reviews_path(@hotel)
        end
    end

    def index
        @hotel = Hotel.find(params[:hotel_id])
        @reviews = @hotel.reviews
    end

    def show
        @hotel = Hotel.find(params[:hotel_id])
        @review = Review.find(params[:id])
    end

    def edit
        @hotel = Hotel.find(params[:hotel_id])
        @review = Review.find(params[:id])
    end

    def update
        @hotel = Hotel.find(params[:hotel_id])
        @review = Review.find(params[:id])
        if @review.update(review_params)
            redirect_to hotel_reviews_path(@hotel)
        end
    end

    def destroy
        @hotel = Hotel.find(params[:hotel_id])
        @review = Review.find(params[:id])
        if @review.destroy
            redirect_to hotel_reviews_path(@hotel)
        end
    end

    private
    def review_params
        params.require(:review).permit(:name, :body, :hotel_id, :title, :rate)
    end
    
end
