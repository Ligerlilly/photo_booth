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

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def update
		@gallery = Gallery.find(params[:id])
		respond_to do |format|
			if @gallery.update(gallery_params)
				format.html { redirect_to galleries_path }
				format.json { head :no_content }
			else
				format.html { render action: 'edit' }
				format.json { render json: @entry.errors, status: :unprocessable_entity }
			end
		end
	end

	def create
		@gallery = Gallery.new(gallery_params)
		@gallery.id = Gallery.last.id.to_i + 1 
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

	def destroy
		@gallery = Gallery.find(params[:id])
		@gallery.destroy
		respond_to do |format|
			format.html { redirect_to galleries_path, alert: 'Gallery destroyed' }
			format.json { head :no_content }
		end
		
	end

  private
  def gallery_params
  	params.require(:gallery).permit(:name, :photo)
  end

end
