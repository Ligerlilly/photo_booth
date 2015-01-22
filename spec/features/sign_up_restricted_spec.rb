  require 'spec_helper'

  feature 'Sign up is restricted' do
  	scenario 'visitors can not sign up' do
  		visit '/accounts/sign_up'
  		expect(page).to have_content("You must be admin")
  	end
  end