class Api::V1::FavoritesController < Api::V1::BaseController

    respond_to :json
	before_filter :authenticate_user!

	def index
		@user = User.find(params[:id])
		authorize @user
		#user = User.find(authentication_token: token)
		#@favorites = user.favorite_carwashes
		#render :json => {
		#	:favorites => @favorites.as_json(only: [:id, :name])}
		
		#favorites = Api::V1::FavoriteSerializer.new(@user)
		#response = JSON[favorites.sort_by{ |e| e['city_id'].to_i }]
		#render :json => {
		#	:carwash => response
		#}
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
		@user.favorites.where("carwash_id =?", @carwash.id).map do |favorite|
			favorite.destroy
		end
		#@favorites = Favorite.all(:conditions => ["user_id = ? and carwash_id = ?",@user.id,@carwash.id])
		#if @favorite.user == @user
			#@favorites.each do 
			#	@favorite.destroy
			#end
			msg = "Deleted"
			render :json => msg, status: 200
		#els#e
		#	return api_error(status: 401, errors: "Unauthorized")
		#end
	end

	private

	def create_params
		params.require(:favorite).permit(
			:carwash_id, :status).delete_if{ |k,v| v.nil? }
	end

end