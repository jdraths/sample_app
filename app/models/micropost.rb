class Micropost < ActiveRecord::Base
	belongs_to :user
	default_scope -> { order('created_at DESC') }
	validates :content, presence: true, length: { maximum: 175}
	validates :user_id, presence: true
	after_validation :report_validation_errors_to_rollbar
	
	# Returns microposts from the users being followed by the given user.
	def self.from_users_followed_by(user)
		followed_user_ids = "SELECT followed_id FROM relationships
							WHERE follower_id = :user_id"
		where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", 
			user_id: user)
	end
end
