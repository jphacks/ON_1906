class CalendarsController < ApplicationController
  def index
    redirect_to '/home/index' if not user_signed_in?
  end
end
