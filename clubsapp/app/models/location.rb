class Location < ActiveRecord::Base
	belongs_to :uni
	has_many :clubs
end
