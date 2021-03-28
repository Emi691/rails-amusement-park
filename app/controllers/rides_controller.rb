class RidesController < ApplicationController
    def ride
        @user = current_user
        @attraction = Attraction.find_by(id: params[:id])
        @ride = Ride.create(user_id: @user.id, attraction_id: @attraction.id)
        @ride_taken = @ride.take_ride
        flash[:message] = @ride_taken
        redirect_to user_path(@user)
    end
end