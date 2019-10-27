class CalendarsController < ApplicationController
  def index
    redirect_to '/home/index' if not user_signed_in?
  end


  def get_events
    @calendars =  Calendar.find_by(user_id: 1)
    render json: {results: @calendars}
  end
end
