  require 'spec_helper'
  feature 'Creating photos' do
  	before do
  		FactoryGirl.create(:gallery, name: 'Hi')
      FactoryGirl.create(:user)
  	end

  	scenario 'users can upload photos to a gallery' do
  		visit '/admin'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
  		click_link 'Galleries'
  		click_link 'Hi'
  		click_link 'Add Photo'
  		attach_file('photo_image', '/home/user/public_html/images/blueBelt.jpg')
  		click_button 'Create Photo'
  		expect(page).to  have_css("img[src$='blueBelt.jpg']")

  	end
  end