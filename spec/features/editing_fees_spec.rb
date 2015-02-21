  require 'spec_helper'
  include Warden::Test::Helpers
  Warden.test_mode!

  feature 'Editing fees' do
  	let!(:user) { FactoryGirl.create(:user) }
  	before do
  		FactoryGirl.create(:fee)
  	end 

  	scenario 'visitors can not edit fees' do
  		visit '/fees/4'
  		expect(page).not_to have_link('Edit')
  	end

  	

  	scenario 'users can edit fees' do
  		login_as(user, scope: :user)
  		visit '/fees/5'
  		click_link 'Edit'
  		fill_in 'Title', with: 'Bye'
  		fill_in 'Content', with: 'Me'
  		click_button 'Update Fee'
  		expect(page).to have_content('Bye Me')
  	end
  end