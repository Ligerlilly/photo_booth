class GalleriesController < ApplicationController
	def index
		@galleries = Gallery.all
	end

	def new
		@gallery = Gallery.new
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def create
		@gallery = Gallery.new(gallery_params)
		respond_to do |format|
			if @gallery.save
				format.html { redirect_to galleries_path, notice: 'Gallery has been created' }
				format.json { head :no_content }
			else
				format.html { render action: 'new' }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

  private
  def gallery_params
  	params.require(:gallery).permit(:name, :photo)
  end

end
