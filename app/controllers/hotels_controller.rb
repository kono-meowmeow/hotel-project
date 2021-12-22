class HotelsController < ApplicationController



    def new
        @hotel = Hotel.new
    end

    def create
        @hotel = Hotel.new(contact_params)

        if @hotel.save
            redirect_to hotels_path
        end
    end

    

    def index

        #以下、ransack

        
        @q = Hotel.ransack(params[:q])
        @hotels = @q.result.includes(:prefecture).page(params[:page])
        

        @prefectures = Prefecture.all


        #以上、ransack
        
    end

    def show
        @hotel = Hotel.find(params[:id])

        @reviews = @hotel.reviews.all
    end

    def edit
        @hotel = Hotel.find(params[:id])
    end

    def update
        @hotel = Hotel.find(params[:id])
        @hotel = @hotel.update(hotel_params)
        redirect_to hotels_path(@hotel)
    end

    def destroy
        @hotel = Hotel.find(params[:id])
        @hotel.destroy
        redirect_to hotels_path
    end


    private
    
    def hotel_params
        params.require(:hotel).permit(:name, :body, :image, :prefecture_id)
    end


    #以下、ransack

    def search_params
        params.require(:q).permit(:name_cont, :prefecture_id_eq)
    end

    #以上、ransack




end
