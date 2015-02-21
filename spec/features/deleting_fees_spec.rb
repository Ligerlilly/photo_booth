  require 'spec_helper'
  include Warden::Test::Helpers
  Warden.test_mode!

  feature 'Deleting fees' do
    let!(:user) { FactoryGirl.create(:user) }

    before do
    	FactoryGirl.create(:fee)
    end

    scenario 'visitors can not delete fees' do
    	visit '/fees/2'
    	expect(page).not_to have_link('Delete')
    
    end

    scenario 'users can delete fees' do
    	login_as(user, scope: :user)
    	visit '/fees/3'
    	click_link 'Delete'
    	expect(page).to have_content('Fee destroyed.')
    end
  	
  end