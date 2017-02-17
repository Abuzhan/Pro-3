class FavoriteSerializer < Api::V1::BaseSerializer
	belongs_to :session
	belongs_to :user
	attributes :id, :name, :address, :contacts, :phone_number, :city, :status

end