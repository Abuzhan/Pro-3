class Api::V1::SessionsController < Api::V1::BaseController
	include ActiveHashRelation
	
	def index
		@cities = City.all
		@car_types = CarType.all

		render :json => {
			:cities => @cities.as_json(:only => [:id, :name]),
			:car_types => @car_types.as_json(:only => [:id, :name])
		}
	end

	def create
		user = User.find_by(phone_number: create_params[:phone_number])
		@cities = City.all
		@car_types = CarType.all
		
		if user && user.authenticate(create_params[:password])
			self.current_user = user
			
			render status: 201, :json => {
				:cities => @cities.as_json(:only => [:id, :name]),
				:car_types => @car_types.as_json(:only => [:id, :name]),
				:user => Api::V1::SessionSerializer.new(user, root: false).as_json
			}

		else
			return api_error(status: 401)
		end
		
	end

	

	private
	
	def create_params
		params.require(:user).permit(:phone_number, :password)
	end

end
