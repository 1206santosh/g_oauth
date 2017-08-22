module Calender
class GoogleCalendarWrapper
  def initialize(current_user)
    configure_client(current_user)
  end

  def configure_client(current_user)
    @client = Google::APIClient.new
    @client.authorization.access_token = current_user.token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
    @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
  end

  def calendar_id()
      return @service.list_calender_lists

end

end
end
