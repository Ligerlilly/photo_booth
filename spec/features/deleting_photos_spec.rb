  require 'spec_helper'
  feature 'Deleting photos' do
  	before do
  		FactoryGirl.create(:gallery, name: 'Hi')
      FactoryGirl.create(:user)
  	end

  	scenario 'users can delete photos and visitors can not' do
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
      visit '/admin'
      click_link 'Sign out'
      visit '/galleries/7'
      expect(page).not_to have_content("Delete")
      visit '/admin'
      click_link 'Sign in'
      fill_in 'Email', with: 'test@test.com'
      fill_in 'Password', with: 'password'
      click_button 'Log in'
      visit '/galleries/7'
  		click_link 'Delete'
  		expect(page).not_to have_css("img[src$='blueBelt.jpg']")
  		expect(page).to have_content('Photo destroyed')
  	end
  end