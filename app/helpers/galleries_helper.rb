module GalleriesHelper
	def random_photos_array
		photos = Array.new
		@galleries.find(rand(2) + 1).photos.each do |photo|
		  photos.push(photo)
	  end
	  photos
	end
end
