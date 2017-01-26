class Box < ActiveRecord::Base

	belongs_to :carwash

	has_many :orders

	validates :carwash_id, presence: true
	
end
