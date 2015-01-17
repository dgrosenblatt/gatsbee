require 'rails_helper'

feature 'View the homepage' do
  scenario 'without signing in' do
    visit '/'

    expect(page).to have_content 'GatsBee'
    expect(page).to have_content 'book club'
  end
end
