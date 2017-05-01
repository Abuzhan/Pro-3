class Box < ActiveRecord::Base

	belongs_to :carwash

	has_many :orders, :order => "start_time ASC"
	has_many :offorders

	validates :carwash_id, presence: true
	#validates :online, presence: true
	
end
