class User < ActiveRecord::Base
	before_save { self.email = email.downcase }
	before_create :create_remember_token
	before_create :genereate_authentication_token
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	VALID_PHONE_REGEX = /7\d\d\d\d\d\d\d\d\d/i
	validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}, length: { is: 10}, uniqueness: true
	CITIES = ['Astana', 'Almaty']
	validates :city, presence: true
	validates :car_type, presence: true

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	private
	
		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end

		def generate_authentication_token
			loop do 
				self.authentication_token = SecureRandom.base64(64)
				break unless User.find_by(authentication_token: authentication_token)
			end
		end
end
