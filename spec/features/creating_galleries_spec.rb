
	require 'spec_helper'

	feature 'creating galleries' do
		scenario 'can create a gallery' do
			visit '/'
			click_link 'Galleries'
			click_link 'Create Gallery'
			fill_in 'Name', with: 'Hi'
			click_button 'Create Gallery'
			expect(page).to have_content('Hi')
		end

	end