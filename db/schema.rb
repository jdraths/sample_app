# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20131212135744) do

  create_table "activities", force: true do |t|
    t.integer  "user_id"
    t.integer  "achievement_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "value"
    t.string   "app_log_id"
    t.string   "time"
    t.string   "description"
  end

  add_index "activities", ["achievement_id", "created_at"], name: "index_activities_on_achievement_id_and_created_at"
  add_index "activities", ["user_id"], name: "index_activities_on_user_id"

  create_table "apis", force: true do |t|
    t.integer  "user_id"
    t.string   "company"
    t.integer  "company_id"
    t.string   "access_token"
    t.string   "access_secret"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "apis", ["user_id"], name: "index_apis_on_user_id"

  create_table "authorizations", force: true do |t|
    t.string   "provider"
    t.string   "uid"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.text     "oauth_token"
    t.text     "oauth_secret"
    t.string   "screen_name"
    t.datetime "oauth_expires_at"
    t.string   "name"
    t.string   "email"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "location"
    t.string   "description"
    t.string   "image"
    t.string   "phone"
    t.boolean  "expired_token",    default: false
  end

  add_index "authorizations", ["provider"], name: "index_authorizations_on_provider"
  add_index "authorizations", ["remember_token"], name: "index_authorizations_on_remember_token"
  add_index "authorizations", ["uid"], name: "index_authorizations_on_uid"
  add_index "authorizations", ["user_id"], name: "index_authorizations_on_user_id"

  create_table "facebook_users", force: true do |t|
    t.string   "uid"
    t.string   "name"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "locale"
    t.string   "languages"
    t.string   "profile_url"
    t.string   "screen_name"
    t.string   "third_party_id"
    t.boolean  "installed"
    t.string   "timezone"
    t.string   "updated_time"
    t.boolean  "verified"
    t.text     "bio"
    t.string   "birthday"
    t.text     "cover_photo"
    t.string   "currency"
    t.string   "devices"
    t.text     "education"
    t.string   "email"
    t.string   "hometown"
    t.string   "interested_in"
    t.text     "location"
    t.string   "political"
    t.text     "favorite_athletes"
    t.text     "favorite_teams"
    t.text     "profile_pic"
    t.text     "quotes"
    t.string   "relationship_status"
    t.string   "religion"
    t.string   "significant_other"
    t.text     "website"
    t.text     "work"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "num_achievements"
    t.string   "num_subcribers"
    t.string   "num_subscribed_to"
    t.string   "num_statuses"
    t.string   "num_posts"
    t.string   "num_likes"
    t.string   "num_friends"
    t.integer  "int_subcribers"
    t.integer  "int_friends"
    t.integer  "int_likes"
    t.integer  "int_posts"
    t.integer  "int_statuses"
    t.integer  "int_subscribed_to"
    t.integer  "int_subscribers"
    t.integer  "int_achievements"
    t.boolean  "failed_request",      default: false
    t.boolean  "deauthed_facebook",   default: false
  end

  create_table "fetch_tweets", force: true do |t|
    t.string   "tweet_id"
    t.string   "screen_name"
    t.text     "content"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "favorite_count"
    t.string   "retweet_count"
    t.integer  "from_user_id"
    t.string   "from_user_name"
    t.string   "in_reply_to_attrs_id"
    t.string   "in_reply_to_screen_name"
    t.string   "in_reply_to_status_id_str"
    t.string   "in_reply_to_user_id_str"
    t.string   "lang"
    t.string   "repliers"
    t.integer  "repliers_count"
    t.boolean  "retweeted",                 default: false
    t.string   "retweeters"
    t.string   "source"
    t.string   "to_user"
    t.string   "to_user_id"
    t.string   "to_user_name"
    t.string   "geo"
    t.string   "hashtags"
    t.string   "media"
    t.string   "metadata"
    t.string   "place_attributes"
    t.string   "place_country"
    t.string   "place_full_name"
    t.string   "place_url"
    t.string   "place_type"
    t.string   "symbols"
    t.string   "incl_url"
  end

  create_table "fitbit_users", force: true do |t|
    t.string   "about_me"
    t.string   "avatar"
    t.string   "avatar_onefifty"
    t.string   "user_city"
    t.string   "user_country"
    t.string   "date_of_birth"
    t.string   "display_name"
    t.string   "distance_unit"
    t.string   "encoded_id"
    t.string   "full_name"
    t.string   "gender"
    t.string   "glucose_unit"
    t.string   "height"
    t.string   "height_unit"
    t.string   "nickname"
    t.string   "locale"
    t.string   "member_since"
    t.string   "utc_offset"
    t.string   "home_state"
    t.string   "stride_length_run"
    t.string   "stride_length_walk"
    t.string   "timezone"
    t.string   "water_unit"
    t.string   "weight"
    t.string   "weight_unit"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "best_tot_active_score_date"
    t.string   "best_tot_active_score_value"
    t.string   "best_tot_cal_out_date"
    t.string   "best_tot_cal_out_value"
    t.string   "best_tot_dist_date"
    t.string   "best_tot_dist_value"
    t.string   "best_tot_steps_date"
    t.string   "best_tot_steps_value"
    t.string   "best_track_cal_out_date"
    t.string   "best_track_cal_out_value"
    t.string   "lifetime_tot_active_score"
    t.string   "lifetime_tot_cal_out"
    t.string   "lifetime_tot_dist"
    t.string   "lifetime_tot_steps"
    t.string   "lifetime_track_active_score"
    t.string   "lifetime_track_cal_out"
    t.string   "lifetime_track_dist"
    t.string   "lifetime_track_steps"
    t.string   "fav_activity_name_one"
    t.string   "fav_activity_name_two"
    t.string   "fav_activity_name_three"
    t.string   "freq_activity_name_one"
    t.string   "freq_activity_name_two"
    t.string   "freq_activity_name_three"
    t.string   "freq_food_name_one"
    t.string   "freq_food_name_two"
    t.string   "freq_food_name_three"
    t.string   "rec_activity_name_one"
    t.string   "rec_activity_name_two"
    t.string   "rec_activity_name_three"
    t.string   "rec_activity_cal_one"
    t.string   "rec_activity_cal_two"
    t.string   "rec_activity_cal_three"
    t.string   "rec_food_name_one"
    t.string   "rec_food_name_two"
    t.string   "rec_food_name_three"
    t.integer  "height_int"
    t.integer  "weight_int"
    t.integer  "best_tot_active_score_int"
    t.integer  "best_tot_cal_out_int"
    t.integer  "best_tot_dist_int"
    t.integer  "best_tot_steps_int"
    t.integer  "best_track_cal_out_int"
    t.integer  "lifetime_tot_active_score_int"
    t.integer  "lifetime_tot_cal_out_int"
    t.integer  "lifetime_tot_dist_int"
    t.integer  "lifetime_tot_steps_int"
    t.integer  "lifetime_track_active_score_int"
    t.integer  "lifetime_track_cal_out_int"
    t.integer  "lifetime_track_dist_int"
    t.integer  "lifetime_track_steps_int"
    t.integer  "stride_length_run_int"
    t.integer  "stride_length_walk_int"
  end

  create_table "foursquare_users", force: true do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "uid"
    t.string   "gender"
    t.integer  "friends_count"
    t.integer  "badges_count"
    t.integer  "tips_count"
    t.string   "home_city"
    t.string   "bio"
    t.string   "email"
    t.string   "facebook_uid"
    t.integer  "mayor_count"
    t.integer  "checkins_count"
    t.integer  "following_count"
    t.integer  "photos_count"
    t.integer  "scores_max"
    t.integer  "scores_recent"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "identities", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "identities", ["email"], name: "index_identities_on_email", unique: true

  create_table "instagram_users", force: true do |t|
    t.string   "full_name"
    t.string   "username"
    t.text     "bio"
    t.string   "uid"
    t.text     "profile_picture"
    t.text     "website"
    t.string   "num_followers"
    t.string   "num_following"
    t.string   "num_media"
    t.string   "num_likes_out"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "int_followers"
    t.integer  "int_following"
    t.integer  "int_media"
    t.integer  "int_likes_out"
  end

  create_table "ivolve_indices", force: true do |t|
    t.integer  "iv_total"
    t.integer  "iv_physical"
    t.integer  "iv_intellectual"
    t.integer  "iv_social"
    t.integer  "iv_spiritual"
    t.integer  "iv_creative"
    t.integer  "iv_emotional"
    t.integer  "male_total"
    t.integer  "male_physical"
    t.integer  "male_intellectual"
    t.integer  "male_social"
    t.integer  "male_spiritual"
    t.integer  "male_creative"
    t.integer  "male_emotional"
    t.integer  "female_total"
    t.integer  "female_physical"
    t.integer  "female_intellectual"
    t.integer  "female_social"
    t.integer  "female_spiritual"
    t.integer  "female_creative"
    t.integer  "female_emotional"
    t.integer  "twitter_users_total"
    t.integer  "facebook_users_total"
    t.integer  "instagram_users_total"
    t.integer  "fitbit_users_total"
    t.integer  "iv_twitter_friends"
    t.integer  "iv_twitter_follwers"
    t.integer  "iv_twitter_tweets_sent"
    t.integer  "iv_twitter_tweets_favd"
    t.integer  "iv_twitter_lists"
    t.integer  "iv_facebook_friends"
    t.integer  "iv_facebook_likes_sent"
    t.integer  "iv_facebook_posts"
    t.integer  "iv_facebook_statuses"
    t.integer  "iv_facebook_achievements"
    t.integer  "iv_facebook_subscribers"
    t.integer  "iv_facebook_subscribed_to_you"
    t.integer  "iv_instagram_followers"
    t.integer  "iv_instagram_following"
    t.integer  "iv_instagram_shared"
    t.integer  "iv_instagram_likes_sent"
    t.integer  "iv_fitbit_height"
    t.integer  "iv_fitbit_weight"
    t.integer  "iv_fitbit_stride_length_run"
    t.integer  "iv_fitbit_stride_length_walk"
    t.integer  "iv_fitbit_life_tot_active_score"
    t.integer  "iv_fitbit_best_tot_active_score"
    t.integer  "iv_fitbit_life_tot_cal_out"
    t.integer  "iv_fitbit_best_tot_cal_out"
    t.integer  "iv_fitbit_life_tot_dist"
    t.integer  "iv_fitbit_best_tot_dist"
    t.integer  "iv_fitbit_life_tot_steps"
    t.integer  "iv_fitbit_best_tot_steps"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "iv_foursquare_friends"
    t.integer  "iv_foursquare_following"
    t.integer  "iv_foursquare_checkins"
    t.integer  "iv_foursquare_badges"
    t.integer  "iv_foursquare_mayor"
    t.integer  "iv_foursquare_tips"
    t.integer  "iv_foursquare_photos"
    t.string   "iv_linkedin_connections"
    t.string   "iv_linkedin_group_memberships"
    t.string   "iv_linkedin_job_suggestions"
    t.string   "iv_linkedin_job_bookmarks"
    t.string   "iv_linkedin_shares"
    t.integer  "linkedin_users_total"
    t.integer  "iv_linkedin_connections_int"
    t.integer  "iv_linkedin_group_memberships_int"
    t.integer  "iv_linkedin_job_suggestions_int"
    t.integer  "iv_linkedin_job_bookmarks_int"
    t.integer  "iv_linkedin_shares_int"
  end

  create_table "linkedin_users", force: true do |t|
    t.string   "first_name"
    t.string   "last_name"
    t.string   "headline"
    t.integer  "connections_size"
    t.integer  "group_memberships_size"
    t.integer  "job_suggestions_size"
    t.integer  "job_bookmarks_size"
    t.integer  "shares_size"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "uid"
  end

  create_table "microposts", force: true do |t|
    t.string   "content"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "microposts", ["user_id", "created_at"], name: "index_microposts_on_user_id_and_created_at"

  create_table "relationships", force: true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "relationships", ["followed_id"], name: "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], name: "index_relationships_on_follower_id_and_followed_id", unique: true
  add_index "relationships", ["follower_id"], name: "index_relationships_on_follower_id"

  create_table "twitter_users", force: true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "user_id"
    t.string   "connections"
    t.string   "contributors_enabled"
    t.string   "default_profile"
    t.string   "default_profile_image"
    t.string   "description"
    t.string   "favorite_count"
    t.string   "follow_request_sent"
    t.string   "followers_count"
    t.string   "friends_count"
    t.string   "geo_enabled"
    t.string   "is_translator"
    t.string   "lang"
    t.string   "listed_count"
    t.string   "location"
    t.string   "notifications"
    t.string   "protected_user"
    t.string   "tweet_count"
    t.string   "time_zone"
    t.string   "url"
    t.string   "utc_offset"
    t.string   "verified"
    t.string   "description_urls"
    t.string   "status"
    t.integer  "uid"
    t.integer  "favorite_int_count"
    t.integer  "followers_int_count"
    t.integer  "friends_int_count"
    t.integer  "listed_int_count"
    t.integer  "tweet_int_count"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "password_digest"
    t.string   "remember_token"
    t.boolean  "admin",           default: false
    t.boolean  "active_user",     default: true
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["remember_token"], name: "index_users_on_remember_token"

end
