class Post < ActiveRecord::Base
	attr_accessor :image

	mount_uploader :image, ImageUploader
end
