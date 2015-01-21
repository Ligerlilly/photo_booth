class PhotosController < ApplicationController
	before_action :load_gallery
	def new
		@photo = Photo.new
	end

	def show
		@photo = Photo.find(params[:id])
	end

	def create
		@photo = @gallery.photos.new(photo_params)
		respond_to  do |format|
			if @photo.save
				format.html { redirect_to gallery_path(@photo.gallery_id), notice: 'Photo created' }
				format.json { head :no_content }
			else
				format.html { render action: 'new' }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	private
	def photo_params
		params.require(:photo).permit(:image)
	end

	def load_gallery
		@gallery = Gallery.find(params[:gallery_id])
	end
end
