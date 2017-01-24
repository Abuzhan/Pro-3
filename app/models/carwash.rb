class Carwash < ActiveRecord::Base
	#before_save { self.email = email.downcase }
	#before_save { self.car_number = car_number.upcase }
	belongs_to :city
	before_create :create_remember_token
	#before_create :generate_authentication_token
	validates :name, presence: true, length: { maximum: 50 }, uniqueness: true
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	#validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	has_secure_password
	validates :password, length: { minimum: 6 }
	VALID_PHONE_REGEX = /7(0|1|2|4|5|6|7)(0|1|2|3|4|5|6|7|8)\d{7}/i
	validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}, length: { is: 10}, uniqueness: true
	CITIES = ['Astana', 'Almaty']
	#validates :city, presence: true
	#validates :car_type, presence: true
	#VALID_CARNUMBER_REGEX = /(\A[a-z]((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}\z)|(\A((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}((1[0-6])|(0[1-9]))\z)/i
	#validates :car_number, presence: true, length: { minimum: 7, maximum: 8}, format: {with: VALID_CARNUMBER_REGEX}

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
end