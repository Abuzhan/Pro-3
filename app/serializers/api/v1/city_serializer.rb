class CitySerializer < Api::V1::BaseSerializer
	has_many :sessions
	has_many :users
	has_many :carwashes
	attributes :id, :name, :status

end