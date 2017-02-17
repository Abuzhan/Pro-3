class CarwashSerializer < Api::V1::BaseSerializer
	belongs_to :session
	belongs_to :user
	belongs_to :city
	attributes :id, :name, :address, :contacts, :phone_number, :status

end