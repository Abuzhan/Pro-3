class Api::V1::UserSerializer < Api::V1::BaseSerializer
	attributes :id, :email, :name, :admin, :created_at, :updated_at, :phone_number, :car_type, :city


end