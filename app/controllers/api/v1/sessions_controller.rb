class Api::V1::SessionsController < Api::V1::BaseController
	
	def create
		user = User.find_by(phone_number: create_params[:phone_number])
		if user && user.authenticate(create_params[:password])
			self.current_user = user
			current_city = user.city
			render(
				json: Api::V1::SessionSerializer.new(user, root: false).to_json,
				json: Api::V1::CarwashSerializer.new(user.city, root: false).to_json,
				status: 201
				)
		else
			return api_error(status: 401)
		end
	end

	private
	
	def create_params
		params.require(:user).permit(:phone_number, :password)
	end

end
