class UsersController < AuthenticatedController
  before_filter :authenticate!, except: [:index, :show, :create, :check_if_email_available]
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
			set_token_in_header user.token
			render status: :ok, json: user.session
		else
			head :unprocessable_entity, json: user.errors
		end
	end

	def check_if_email_available
		if User.find_by_email params[:email]
			return head :conflict
		end
		head :ok
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
		params.require(:user).permit :first_name, :middle_name, :last_name, :password, :password_confirmation, :email, :bio, :token
	end
end
