
class CalendarsController < ApplicationController


  def index
    redirect_to '/home/index' if not user_signed_in?
  end

  def get_events
    client = Signet::OAuth2::Client.new(client_options)
    client.update!([current_user.token])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @calendar_list = service.list_calendar_lists
    logger.debug(@calendar)
  end

  private
  def client_options
    {
      client_id: Rails.application.credentials.google[:google_client_id],
      client_secret: Rails.application.credentials.google[:google_client_secret],
      authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
      token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
      scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
      redirect_uri: 'http://localhost:3000/users/auth/google_oauth2/callback'
    }
  end


end
