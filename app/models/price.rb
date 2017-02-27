class Price < ActiveRecord::Base
	
	belongs_to :car_type
	belongs_to :service
	belongs_to :carwash

	validates :price, presence: true, length: { maximum: 6 }
	#validates :duration, presence: true, length: { maximum: 1 }
	validates :carwash_id, presence: true
	validates :service_id, presence: true
	#validates :user_id, presence: true


end
