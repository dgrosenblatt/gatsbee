require 'rails_helper'

feature 'View the homepage', %{
  As a user
  I want to view information about the website
  So I can understand what it is
} do
  scenario 'without signing in' do
    visit '/'

    expect(page).to have_content 'GatsBee'
    expect(page).to have_content 'book club'
  end
end
