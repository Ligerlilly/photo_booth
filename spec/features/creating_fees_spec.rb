 require 'spec_helper'

 feature 'Creating fees' do
 	before do
 		FactoryGirl.create(:user)
 	end
 	scenario 'visitors can not create fees' do
 		visit '/fees/new'
 		expect(page).to have_content('You must be admin.')
 	end
 	scenario 'user can create fees' do
 		visit '/admin'
 		click_link 'Sign in'
 		fill_in 'Email', with: "test@test.com"
 		fill_in 'Password', with: 'password'
 		click_button 'Log in'
 		visit '/fees/new'
 		fill_in 'Title', with: 'Hi'
 		fill_in 'Content', with: 'yall'
 		click_button 'Create Fee'
 		expect(page).to have_content( 'Hi yall')

 	end
 end