class FavoriteSerializer < Api::V1::BaseSerializer
	
	attributes :id, :name, :address, :contacts, :phone_number, :city, :status
	
	belongs_to :session
	belongs_to :user
	

end