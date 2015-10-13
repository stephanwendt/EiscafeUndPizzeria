class Picture < ActiveRecord::Base
	has_and_belongs_to_many :products
	mount_uploader :image, PictureUploader
end
