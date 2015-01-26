  require 'spec_helper'

  feature 'Editing galleries' do
	  before do
	  	FactoryGirl.create(:user)
	  	FactoryGirl.create(:gallery)
	  end

	  scenario 'users can edit galleries' do
	  	visit '/admin'
	  	click_link 'Sign in'
	  	fill_in 'Email', with: 'test@test.com'
	  	fill_in 'Password', with: 'password'
	  	click_button 'Log in'
	  	click_link 'Galleries'
	  	click_link('Edit', match: :first)
	  	fill_in 'Name', with: 'Hi'
	  	click_button 'Update Gallery'
	  	expect(page).to have_content('Hi')

	  end

  end