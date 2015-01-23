require 'rails_helper'

RSpec.describe Meeting, :type => :model do
  let(:blanks) { ['', nil] }

  it { should have_valid(:location).when("Location") }
  it { should_not have_valid(:location).when(*blanks) }

  it { should have_valid(:meeting_time).when("Tomorrow at noon") }
  it { should_not have_valid(:meeting_time).when(*blanks) }

  it { should belong_to(:user) }
  it { should belong_to(:club) }
end
