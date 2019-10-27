
class CalendarsController < ApplicationController


  def index
    redirect_to '/home/index' if not user_signed_in?
  end

  def redirect
    client = Signet::OAuth2::Client.new(client_options)
    redirect_to client.authorization_uri.to_s
  end

  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to root_path
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
      redirect_uri: 'http://localhost:3000/callback',
    }
  end


end
