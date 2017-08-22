

class HomeController < ApplicationController
  def index
  end

  def view_all_calender
      @client=Google::APIClient.new
      @client.authorization.access_token = current_user.oauthens[0].token
      @client.authorization.refresh_token =  current_user.oauthens[0].refresh_token
      @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
      @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
      @client.authorization.refresh!
      @service = @client.discovered_api('calendar', 'v3')
      @response = @client.execute(api_method: @service.calendar_list.list)
      @calenders=JSON.parse(@response.body)['items']
  end
def add_calender
  # @client=Google::APIClient.new
  # @client.authorization.access_token = current_user.oauthens[0].token
  # @client.authorization.refresh_token =  current_user.oauthens[0].refresh_token
  # @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
  # @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
  # @client.authorization.refresh!
  # @service = @client.discovered_api('calendar', 'v3')
  #
  # a= @client.execute(:api_method=>@service.calendars.insert,
  #                    :data=>JSON.dump({'summary'=>'king'}),
  #                    :header=>{'Content-Type'=>'application/json'}
  #                    )
  # puts a
  # raise

  calendar = Google::Apis::CalendarV3::Calendar.new(
    summary: 'calendarSummary',
    time_zone: 'America/Los_Angeles'
  )
result = client.insert_calendar(calendar)
puts '-------------------------------------------------------------------------'
puts result.id
puts '-------------------------------------------------------------------------'

end
  def add_event
    @client=Google::APIClient.new
    @client.authorization.access_token = current_user.oauthens[0].token
    @client.authorization.refresh_token =  current_user.oauthens[0].refresh_token
    @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
    @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
    event={
       summary: "ijhfwrgyugfu",
       location: "shucyscs",
       description: "important ejihfefeio"
    }
    @client.execute(:api_method => @service.events.insert,
  :parameters => {'calendarId' => 'my_own',
    'sendNotifications' => true},
  :body => JSON.dump(event),
  :headers => {'Content-Type' => 'application/json'})
end

end
