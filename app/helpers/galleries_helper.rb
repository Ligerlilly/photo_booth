module GalleriesHelper
	def random_photos_array
		photos = Array.new
		@galleries.find(rand(@galleries.length) + 1).photos.each do |photo|
		  photos.push(photo)
	  end
	  photos
	end

	def random_gallery_cover(gallery)
		photos = Array.new
		gallery.photos.each do |photo|
		  photos.push(photo)
		end
		photos[rand(gallery.photos.length)].image_url(:thumb).to_s 
	end


end


