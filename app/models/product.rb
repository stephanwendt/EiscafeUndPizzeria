class Product < ActiveRecord::Base
	has_and_belongs_to_many :pictures
	validates :name, presence: true, length: { minimum: 5 }
end
