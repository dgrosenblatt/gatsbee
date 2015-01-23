require 'rails_helper'

RSpec.describe Book, :type => :model do
  let(:blanks) { ['', nil] }

  it { should have_valid(:title).when("Title") }
  it { should_not have_valid(:title).when(*blanks) }

  it { should have_many :comments }
  it { should have_many :clubs }

end
