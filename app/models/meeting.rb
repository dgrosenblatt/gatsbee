require 'google/api_client'

class Meeting < ActiveRecord::Base
  before_save :create_calendar_event
  belongs_to :user
  belongs_to :club

  #location can't be blank
  #meeting_time can't return nil when Chronic.parse'd
  private

  def create_calendar_event
    summary = self.club.name
    location = self.location
    start = Chronic.parse(self.meeting_time).to_datetime
    attendees = self.club.users.map { |user| { "email" => self.user.email } }
    @event = {
      'summary' => summary,
      'description' => 'Book Club Meeting',
      'location' => location,
      'start' => { 'dateTime' => start },
      'end' => { 'dateTime' => start.advance(hours: 1) },
      'attendees' => attendees
    }

    client = Google::APIClient.new
    client.authorization.access_token = self.user.oauth_token
    service = client.discovered_api('calendar', 'v3')

    client.execute(
      :api_method => service.events.insert,
      :parameters => {'calendarId' => self.user.email, 'sendNotifications' => true},
      :body => JSON.dump(@event),
      :headers => {'Content-Type' => 'application/json'})
  end
end
