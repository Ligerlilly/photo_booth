  require 'spec_helper'

  feature 'Editing photos' do
	  before do
	  	FactoryGirl.create(:user)
	  	FactoryGirl.create(:gallery)
	  end

	  scenario 'users can edit photos' do
	  	visit '/admin'
	  	click_link 'Sign in'
	  	fill_in 'Email', with: 'test@test.com'
	  	fill_in 'Password', with: 'password'
	  	click_button 'Log in'
	  	click_link 'Galleries'
	  	click_link 'Gallery'
	  	click_link 'Add Photo'
	  	attach_file('photo_image', '/home/user/public_html/images/blueBelt.jpg')
	  	click_button "Create Photo"
	  	expect(page).to have_css("img[src$='blueBelt.jpg']")
	  	click_link('Edit', match: :first)
	  	attach_file('photo_image', '/home/user/public_html/images/breakfast.jpg')
	  	click_button 'Update Photo'
	  	expect(page).to have_css("img[src$='breakfast.jpg']")

	  end

  end