class Api::V1::CitySerializer < Api::V1::BaseSerializer
	
	attributes :id, :name, :status
	
	has_many :sessions
	has_many :users
	has_many :carwashes


end