class RidesController < ApplicationController

  def new
    @attraction = Attraction.find_by(id: params[:attraction_id])
    @ride = Ride.create(user_id: current_user.id, attraction_id: @attraction.id)
    take_ride_output = @ride.take_ride

    if take_ride_output != true
      flash[:notice] = take_ride_output
    else
      flash[:notice] = "Thanks for riding the #{@attraction.name}!"
    end
    redirect_to user_path(current_user)
  end
end
