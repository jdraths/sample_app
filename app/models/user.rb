class User < OmniAuth::Identity::Models::ActiveRecord
	has_many :authorizations, dependent: :destroy
	has_many :microposts, dependent: :destroy
	has_many :relationships, foreign_key: "follower_id", dependent: :destroy
	has_many :followed_users, through: :relationships, source: :followed 
	has_many :reverse_relationships, foreign_key: "followed_id",
									 class_name:  "Relationship",
									 dependent:   :destroy
	has_many :followers, through: :reverse_relationships, source: :follower 

	has_many :twitter_users, dependent: :destroy
	has_many :fetch_tweets, dependent: :destroy
	has_many :facebook_users, dependent: :destroy
	has_many :fitbit_users, dependent: :destroy
	has_many :instagram_users, dependent: :destroy
	has_many :foursquare_users, dependent: :destroy
	has_many :linkedin_users, dependent: :destroy
	has_many :posts, dependent: :destroy
	
	# Put below back in and delete identity.rb?

	has_secure_password
	before_save { self.email = email.downcase }
	validates :name, presence: true, length: { maximum: 50 }
	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
	validates :email, presence: true, format: { with: VALID_EMAIL_REGEX },
			uniqueness: { case_sensitive: false }

	validates :password, length: { minimum: 6 }

	before_create :create_remember_token
	after_validation :report_validation_errors_to_rollbar

	def User.new_remember_token
		SecureRandom.urlsafe_base64
	end

	def User.encrypt(token)
		Digest::SHA1.hexdigest(token.to_s)
	end

	
	def self.create_from_omniauth(auth)
		create(name: auth['info']['name'])
	end

	def feed
		Micropost.from_users_followed_by(self)
	end

	def following?(other_user)
		relationships.find_by(followed_id: other_user.id)
	end

	def follow!(other_user)
		relationships.create!(followed_id: other_user.id)
	end

	def unfollow!(other_user)
		relationships.find_by(followed_id: other_user.id).destroy!
	end

	private

		def create_remember_token
			self.remember_token = User.encrypt(User.new_remember_token)
		end
end
