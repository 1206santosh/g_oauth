

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
  @client=Google::APIClient.new
  @client.authorization.access_token = current_user.oauthens[0].token
  @client.authorization.refresh_token =  current_user.oauthens[0].refresh_token
  @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
  @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
  @client.authorization.refresh!
  @service = @client.discovered_api('calendar', 'v3')

  a= @client.execute(:api_method=>@service.calendars.insert,
                     :body=>JSON.dump({'summary'=>'king'}),
                     :headers=>{'Content-Type'=>'application/json'}
        )
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
  puts a.body
  puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"

#
#   calendar = Google::Apis::CalendarV3::Calendar.new(
#     summary: 'calendarSummary',
#     time_zone: 'America/Los_Angeles'
#   )
# result = @client.insert_calendar(calendar)
# puts '-------------------------------------------------------------------------'
# puts result.id
# puts '-------------------------------------------------------------------------'

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
       location: "pune",
       description: "important ejihfefeio",
       start: {dateTime:Time.now.to_formatted_s(:iso8601)},
     end: {dateTime:Time.now.to_formatted_s(:iso8601)}
    }
  a=  @client.execute(:api_method => @service.events.insert,
                    :parameters => {'calendarId' =>'b6osmrfr0km1r4jcb2rr198vag@group.calendar.google.com',
                                    'sendNotifications' => true},
                    :body => JSON.dump(event),
                    :headers => {'Content-Type' => 'application/json'})
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
    puts a.body
    puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"


end


def get_event
  @client=Google::APIClient.new
  @client.authorization.access_token = current_user.oauthens[0].token
  @client.authorization.refresh_token =  current_user.oauthens[0].refresh_token
  @client.authorization.client_id = '366795280395-6j2npbkr777sk4gs6pd4gq9pcqku7nnk.apps.googleusercontent.com'
  @client.authorization.client_secret = '9CjhvxaRU4mmKvy5UpkqacHg'
  @client.authorization.refresh!
  @service = @client.discovered_api('calendar', 'v3')
  a=@client.execute(:api_method=>@service.events.list,
                    :parameters => {'calendarId' =>'b6osmrfr0km1r4jcb2rr198vag@group.calendar.google.com'},

                    :headers => {'Content-Type' => 'application/json'})
@all_events=JSON.parse(a.body)
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
puts @all_events
puts "+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++"
raise
redirect_to root_path
end

end
