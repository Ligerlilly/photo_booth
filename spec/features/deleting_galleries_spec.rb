  require 'spec_helper'

  feature 'Deleting galleries' do
  	before do
  		FactoryGirl.create(:user)
  		FactoryGirl.create(:gallery)
  	end

    scenario 'user can delete galleries' do
    	visit '/admin'
    	click_link 'Sign in'
    	fill_in 'Email', with: 'test@test.com'
    	fill_in 'Password', with: 'password'
    	click_button 'Log in'
    	click_link 'Galleries'
    	click_link 'Delete'
    	expect(page).to have_content('Gallery destroyed')

    end
  end