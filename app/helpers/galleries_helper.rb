module GalleriesHelper
	def random_photos_array
		if @galleries
			photos = Array.new
			@galleries.find(rand(1) + 1).photos.each do |photo|
			  photos.push(photo)
		  end
		  photos
	  end
	end
end
