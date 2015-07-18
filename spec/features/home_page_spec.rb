require 'rails_helper'

describe 'the home page' do
  it 'shows a list of polls' do
    poll = FactoryGirl.create(:poll)

    visit root_path

    expect(page).to have_content 'List of polls'
    expect(page).to have_content poll.title
  end
end
