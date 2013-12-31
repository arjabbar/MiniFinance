class User < ActiveRecord::Base
	has_secure_password
	validates :email, :first_name, :last_name, presence: true
	validates :password, presence: :true, on: :create 
	validates :password, length: {in: 6..24}, on: :create
	validates :token, uniqueness: true
	validates :email, uniqueness: true

	before_validation on: :create do
		create_user_token and set_session_expiration
	end

	def end_session
		session_expires_on = DateTime.now.utc - 1.second
	end

	def expired_session?
		token.blank? or session_expires_on.nil? or DateTime.now.utc > session_expires_on.utc
	end

	def time_left_before_session_expires
		(session_expires_on.utc - Time.zone.now.utc)
	end

	def create_user_token
		self.token = SecureRandom.hex if token.blank?
	end

	def set_session_expiration
		self.session_expires_on = DateTime.now.utc + MiniFinance::Application::Constants::LOGIN_EXPIRATION_LENGTH
	end

	def authenticate_with_token supplied_token 
		token.eql?(supplied_token) && !expired_session?
	end

	alias_method :expire_login, :end_session
	alias_method :extend_session, :set_session_expiration
	alias_method :logout, :expire_login
	alias_method :needs_to_login?, :expired_session?
end
