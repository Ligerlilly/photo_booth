class VisitorsController < ApplicationController
	def index
		@galleries = Gallery.all
		@photos = Photo.all
	end
end
