  require 'spec_helper'
  feature 'deleting photos' do
  	before do
  		FactoryGirl.create(:gallery, name: 'Hi')
  	end

  	scenario 'can delete photos' do
  		visit '/'
  		click_link 'Galleries'
  		click_link 'Hi'
  		click_link 'Add Photo'
  		attach_file('photo_image', '/home/user/public_html/images/blueBelt.jpg')
  		click_button 'Create Photo'
  		click_link 'Delete'
  		expect(page).not_to have_css("img[src$='blueBelt.jpg']")
  		expect(page).to have_content('Photo destroyed')
  	end
  end