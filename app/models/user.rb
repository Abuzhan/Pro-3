class User < ActiveRecord::Base
	#before_save { self.email = email.downcase }
	#before_save { self.car_number = car_number.upcase }
	#VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	#validates :email, presence: true, format: {with: VALID_EMAIL_REGEX }, uniqueness: { case_sensitive: false }
	#CITIES = ['Astana', 'Almaty']
	#validates :city, presence: true
	#VALID_CARNUMBER_REGEX = /(\A[a-z]((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}\z)|(\A((\d\d[1-9])|(\d[1-9]\d)|([1-9]\d\d))[a-z]{3}((1[0-6])|(0[1-9]))\z)/i
	#validates :car_number, presence: true, length: { minimum: 7, maximum: 8}, format: {with: VALID_CARNUMBER_REGEX}
	
	belongs_to :city
	belongs_to :car_type
	
	has_many :favorites, dependent: :destroy
	has_many :favorite_carwashes, through: :favorites, source: :carwash
	has_many :orders
	has_many :carwashes
	
	before_create :create_remember_token
	before_create :generate_authentication_token
	has_secure_password
	VALID_PHONE_REGEX = /7(0|1|2|4|5|6|7)(0|1|2|3|4|5|6|7|8)\d{7}/i

	validates :city_id, presence: true
	validates :name, presence: true, length: { maximum: 50 }
	validates :password, length: { minimum: 6 }
	validates :phone_number, presence: true, format: {with: VALID_PHONE_REGEX}, length: { is: 10}, uniqueness: true
	validates :car_type_id, presence: true



	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	def User.new_token
		SecureRandom.urlsafe_base64
	end

	def favorite?(carwash)
		favorites.find_by(carwash_id: carwash.id)
	end

	def favorite!(carwash)
		favorites.create!(carwash_id: carwash.id)
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
