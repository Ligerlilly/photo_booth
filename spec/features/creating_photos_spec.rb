  require 'spec_helper'
  feature 'creating photos' do
  	before do
  		FactoryGirl.create(:gallery, name: 'Hi')
  	end

  	scenario 'can upload photos to a gallery' do
  		visit '/'
  		click_link 'Galleries'
  		click_link 'Hi'
  		click_link 'Add Photo'
  		attach_file('photo_image', '/home/user/public_html/images/blueBelt.jpg')
  		click_button 'Create Photo'
  		expect(page).to  have_css("img[src$='blueBelt.jpg']")

  	end
  end