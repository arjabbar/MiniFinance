class UsersController < AuthenticatedController
  before_filter :authenticate!, except: [:index, :show, :create]
	respond_to :json

	def index
		render json: User.all
	end

	def show
		render json: User.find(params[:id])
	end

	def create
		user = User.new user_params
		if (user.save)
			render status: :ok, json: user
		else
			head :unprocessable_entity, json: user.errors
		end
	end

	def update
		@current_user.assign_attributes user_params
		if @current_user.save
			render json: @current_user, status: :ok
		else
			render json: @current_user.errors, status: :unprocessable_entity
		end
	end

	def user_params
		params.require(:user).permit :first_name, :last_name, :password, :password_confirmation, :email, :bio, :token
	end
end
