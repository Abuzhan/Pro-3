class OrderService < ActiveRecord::Base

	belongs_to :service
	belongs_to :order

	validates :order_id, presence: true
	validates :service_id, presence: true
end
