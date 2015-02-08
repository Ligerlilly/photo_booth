module ApplicationHelper
	def mobile_device?
		request.user_agent =~ /Android|webOS|iPhone|iPad|iPod|BlackBerry|IEMobile|Opera Mini/i
	end
end
