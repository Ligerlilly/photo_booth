
	require 'spec_helper'

	feature 'Creating galleries' do
		
		before do
			FactoryGirl.create(:user)
			FactoryGirl.create(:gallery)
		end
		
		scenario 'user can create a gallery' do
			visit '/admin'
			click_link 'Sign in'
			fill_in 'Email', with: 'test@test.com'
			fill_in 'Password', with: 'password'
			click_button 'Log in'
			click_link 'Galleries'
			click_link 'Create Gallery'
			fill_in 'Name', with: 'Hi'
			click_button 'Create Gallery'
			expect(page).to have_content('Hi')
		end

	end