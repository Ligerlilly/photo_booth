class RegistrationsController < Devise::RegistrationsController
	before_action :admin?

	private
	def admin?
		unless current_user
		  redirect_to root_path, alert: 'You must be admin.' 
		end
	end
end
