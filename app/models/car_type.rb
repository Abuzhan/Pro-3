class CarType < ActiveRecord::Base
	has_many :users
	has_many :prices
	validates :name, presence: true, length: {maximum: 50}, uniqueness: true
end
