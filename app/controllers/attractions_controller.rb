class AttractionsController < ApplicationController
    
    def index
        @attractions = Attraction.all
        @user = current_user
    end
    
    def new
        @attraction = Attraction.new
    end

    def create
        if current_user.admin
            @attr = Attraction.create(attraction_params)
            redirect_to attraction_path(@attr)
        end
    end

    def edit
        @attraction = Attraction.find_by(id: params[:id])
    end

    def update
        if current_user.admin
            @attraction = Attraction.find_by(id: params[:id])
            @attraction.update(attraction_params)
            redirect_to attraction_path(@attraction)
        end
    end
    
    def show
        @attraction = Attraction.find_by(id: params[:id])
        @user = current_user
    end

    def ride
    end

    private
    
    def is_admin?
        if user.admin == true
            true
        else
            false
        end
    end

    def attraction_params
        params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
end
