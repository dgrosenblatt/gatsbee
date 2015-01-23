require 'rails_helper'

RSpec.describe Club, :type => :model do
  let(:blanks) { ['', nil] }

  it { should have_valid(:name).when("Club") }
  it { should_not have_valid(:name).when(*blanks) }

  it { should have_many(:memberships) }
  it { should belong_to(:current_book) }
end
