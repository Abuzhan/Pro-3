class Api::V1::FavoritesController < Api::V1::BaseController

    respond_to :json
	before_filter :authenticate_user!

	def index
		@user = User.find(params[:id])
		authorize @user

		render(
			json: Api::V1::FavoriteSerializer.new(@user).to_json,
			status: 200
		)
	end

	def create
		user = @current_user
		favorite = user.favorites.build(create_params)
		return api_error(status: 422, errors: favorite.errors) unless favorite.valid?
		favorite.save!

		render(
			json: favorite.as_json
			)
	end

	def destroy
		@carwash = Carwash.find(params[:id])
		@user = @current_user
		if @user.favorites.where("carwash_id =?", @carwash.id).map do |favorite|
				favorite.destroy
				msg = "Deleted"
				render :json => msg, status: 200
			end
		else 
			return api_error(status: 401, errors: "Unauthorized")
		end
	end

	private

	def create_params
		params.require(:favorite).permit(
			:carwash_id, :status).delete_if{ |k,v| v.nil? }
	end

end