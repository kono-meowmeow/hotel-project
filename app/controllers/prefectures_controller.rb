class PrefecturesController < ApplicationController


    def new
        @prefecture = Prefecture.new
    end

    def create
        @prefecture = Prefecture.new(contact_params)

        if @prefecture.save
            redirect_to prefectures_path
        end
    end



    def index

        
        @prefectures = Prefecture.all


    end

    def show
        @prefecture = Prefecture.find(params[:id])
        @hotels = @prefecture.hotels
    end

    def edit
        @prefecture = Prefecture.find(params[:id])
    end

    def update
        prefecture = Prefecture.find(params[:id])
        prefecture = prefecture.update(prefecture_params)
        redirect_to prefectures_path(prefecture)
    end

    def destroy
        prefecture = Prefecture.find(params[:id])
        prefecture.destroy
        redirect_to prefectures_path
    end



    private
    def prefecture_params
        params.require(:prefecture).permit(:name)
    end

end
