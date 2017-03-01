class Api::V1::FavoritesController < Api::V1::BaseController

    respond_to :json
	before_filter :authenticate_user!, only: [:show, :index]

	def index
		@user = User.find_by(params[:id])
		@favorites = @user.favorite_carwashes
		#render :json => {
		#	:favorites => @favorites.as_json(only: [:id, :name])}
		render(
			json: Api::V1::FavoriteSerializer.new(@user).to_json,
			status: 200
		)
	end


end