class Schedule < ActiveRecord::Base
	
	belongs_to :carwash

	VALID_DAY_REGEX = /(1|2|3|4|5|6|7)/i
	
	validates :day, presence: true, format: { with: VALID_DAY_REGEX }, length: { is: 1 }
	validates :opening_time, presence: true
	validates :closing_time, presence: true
	
end
