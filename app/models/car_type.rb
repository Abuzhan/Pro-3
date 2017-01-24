class CarType < ActiveRecord::Base
	has_many :users
	validates :car_type, presence: true, length: {maximum: 50}, uniqueness: true
end
