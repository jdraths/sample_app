# This should follow Rails Casts

class Identity < OmniAuth::Identity::Models::ActiveRecord
	# link Identity to Authorization
	belongs_to :authorization
	# above
	has_secure_password
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }
	after_validation :report_validation_errors_to_rollbar

end
