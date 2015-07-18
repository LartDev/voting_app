require 'rails_helper'

describe 'the home page' do
  let(:user) { FactoryGirl.create(:user) }

  before :each do
    visit root_path
  end

  context 'when the user is not logged in' do
    let(:poll) { FactoryGirl.create(:poll) }

    it "it doesn't allow user to see polls" do
      expect(page).to have_no_content 'List of polls'
    end

    it 'allows the user to log in' do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'

      expect(page).to have_content 'List of polls'
      expect(page).to have_content poll.title
    end

    it 'allows the user to sign up' do
      click_link 'Sign up'
      fill_in 'Name', with: 'John Doe'
      fill_in 'Email', with: 'john_doe@example.com'
      fill_in 'Password', with: 'password'
      fill_in 'Password confirmation', with: 'password'
      click_button 'Sign up'

      expect(page).to have_content 'List of polls'
      expect(page).to have_content poll.title
    end

    it 'allows the user to recover their password' do
      click_link 'Forgot your password'
      fill_in 'Email', with: user.email
      click_button 'Send'

      expect(ActionMailer::Base.deliveries.empty?).to be false
    end
  end

  context 'when the user is logged in' do
    before :each do
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'Log in'
    end

    it 'allows the user to log out' do
      click_link 'Log out'
      expect(page).to have_no_content 'List of polls'
    end
  end
end
