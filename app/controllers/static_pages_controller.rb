class StaticPagesController < ApplicationController
  
  def home
  	if signed_in?
      @ivolveindex = IvolveIndex.first
  		@micropost = current_user.microposts.build
  		@feed_items = current_user.feed.paginate(page: params[:page])
      # Need to fix this method
      if twitter?   # if twitter? definitely works
        # this twitter_users column should be renamed from name to screen_name
        @twitter_int_friends = @twitter_auth_user.friends_int_count
        @twitter_avg_friends = @ivolveindex.iv_twitter_friends
        @twitter_int_followers = @twitter_auth_user.followers_int_count
        @twitter_avg_followers = @ivolveindex.iv_twitter_follwers
        @twitter_int_sent = @twitter_auth_user.tweet_int_count
        @twitter_avg_sent = @ivolveindex.iv_twitter_tweets_sent
        @twitter_int_favorites = @twitter_auth_user.favorite_int_count
        @twitter_avg_fav = @ivolveindex.iv_twitter_tweets_favd
        @twitter_int_lists = @twitter_auth_user.listed_int_count
        @twitter_avg_lists = @ivolveindex.iv_twitter_lists
      else
        @twitter_int_friends = 0
        @twitter_avg_friends = @ivolveindex.iv_twitter_friends
        @twitter_int_followers = 0
        @twitter_avg_followers = @ivolveindex.iv_twitter_follwers
        @twitter_int_sent = 0
        @twitter_avg_sent = @ivolveindex.iv_twitter_tweets_sent
        @twitter_int_favorites = 0
        @twitter_avg_fav = @ivolveindex.iv_twitter_tweets_favd
        @twitter_int_lists = 0
        @twitter_avg_lists = @ivolveindex.iv_twitter_lists
      end
      if facebook?
        @facebook_int_friends = @facebook_auth_user.int_friends
        @facebook_avg_friends = @ivolveindex.iv_facebook_friends
        @facebook_int_likes = @facebook_auth_user.int_likes
        @facebook_avg_likes = @ivolveindex.iv_facebook_likes_sent
        @facebook_int_posts = @facebook_auth_user.int_posts
        @facebook_avg_posts = @ivolveindex.iv_facebook_posts
        @facebook_int_statuses = @facebook_auth_user.int_statuses
        @facebook_avg_statuses = @ivolveindex.iv_facebook_statuses
        @facebook_int_achievements = @facebook_auth_user.int_achievements
        @facebook_avg_achievements = @ivolveindex.iv_facebook_achievements
        @facebook_int_subscribers = @facebook_auth_user.int_subscribers
        @facebook_avg_subscribers = @ivolveindex.iv_facebook_subscribers
        @facebook_int_subscribed_to = @facebook_auth_user.int_subscribed_to
        @facebook_avg_subscribed_to = @ivolveindex.iv_facebook_subscribed_to_you
      else
        @facebook_int_friends = 0
        @facebook_avg_friends = @ivolveindex.iv_facebook_friends
        @facebook_int_likes = 0
        @facebook_avg_likes = @ivolveindex.iv_facebook_likes_sent
        @facebook_int_posts = 0
        @facebook_avg_posts = @ivolveindex.iv_facebook_posts
        @facebook_int_statuses = 0
        @facebook_avg_statuses = @ivolveindex.iv_facebook_statuses
        @facebook_int_achievements = 0
        @facebook_avg_achievements = @ivolveindex.iv_facebook_achievements
        @facebook_int_subscribers = 0
        @facebook_avg_subscribers = @ivolveindex.iv_facebook_subscribers
        @facebook_int_subscribed_to = 0
        @facebook_avg_subscribed_to = @ivolveindex.iv_facebook_subscribed_to_you
      end
      if instagram?
        @instagram_int_followers = @instagram_auth_user.int_followers
        @instagram_avg_followers = @ivolveindex.iv_instagram_followers
        @instagram_int_following = @instagram_auth_user.int_following
        @instagram_avg_following = @ivolveindex.iv_instagram_following
        @instagram_int_media = @instagram_auth_user.int_media
        @instagram_avg_media = @ivolveindex.iv_instagram_shared
        @instagram_int_likes_out = @instagram_auth_user.int_likes_out
        @instagram_avg_likes_out = @ivolveindex.iv_instagram_likes_sent
      else
        @instagram_int_followers = 0
        @instagram_avg_followers = @ivolveindex.iv_instagram_followers
        @instagram_int_following = 0
        @instagram_avg_following = @ivolveindex.iv_instagram_following
        @instagram_int_media = 0
        @instagram_avg_media = @ivolveindex.iv_instagram_shared
        @instagram_int_likes_out = 0
        @instagram_avg_likes_out = @ivolveindex.iv_instagram_likes_sent
      end
      if foursquare?
        @foursquare_friends_count = @foursquare_auth_user.friends_count
        @foursquare_avg_friends = @ivolveindex.iv_foursquare_friends
        @foursquare_following_count = @foursquare_auth_user.following_count
        @foursquare_avg_following = @ivolveindex.iv_foursquare_following
        @foursquare_checkins_count = @foursquare_auth_user.checkins_count
        @foursquare_avg_checkins = @ivolveindex.iv_foursquare_checkins
        @foursquare_badges_count = @foursquare_auth_user.badges_count
        @foursquare_avg_badges = @ivolveindex.iv_foursquare_badges
        @foursquare_mayor_count = @foursquare_auth_user.mayor_count
        @foursquare_avg_mayors = @ivolveindex.iv_foursquare_mayor
        @foursquare_tips_count = @foursquare_auth_user.tips_count
        @foursquare_avg_tips = @ivolveindex.iv_foursquare_tips
        @foursquare_photos_count = @foursquare_auth_user.photos_count
        @foursquare_avg_photos = @ivolveindex.iv_foursquare_photos
      else
        @foursquare_friends_count = 0
        @foursquare_avg_friends = @ivolveindex.iv_foursquare_friends
        @foursquare_following_count = 0
        @foursquare_avg_following = @ivolveindex.iv_foursquare_following
        @foursquare_checkins_count = 0
        @foursquare_avg_checkins = @ivolveindex.iv_foursquare_checkins
        @foursquare_badges_count = 0
        @foursquare_avg_badges = @ivolveindex.iv_foursquare_badges
        @foursquare_mayor_count = 0
        @foursquare_avg_mayors = @ivolveindex.iv_foursquare_mayor
        @foursquare_tips_count = 0
        @foursquare_avg_tips = @ivolveindex.iv_foursquare_tips
        @foursquare_photos_count = 0
        @foursquare_avg_photos = @ivolveindex.iv_foursquare_photos
      end
      if fitbit?
        @fitbit_height_int = @fitbit_auth_user.height_int
        @fitbit_avg_height = @ivolveindex.iv_fitbit_height
        @fitbit_weight_int = @fitbit_auth_user.weight_int
        @fitbit_avg_weight = @ivolveindex.iv_fitbit_weight
        @fitbit_stride_length_run_int = @fitbit_auth_user.stride_length_run_int
        @fitbit_avg_length_run = @ivolveindex.iv_fitbit_stride_length_run
        @fitbit_stride_length_walk_int = @fitbit_auth_user.stride_length_walk_int
        @fitbit_avg_length_walk = @ivolveindex.iv_fitbit_stride_length_walk
        @fitbit_lifetime_tot_active_score_int = @fitbit_auth_user.lifetime_tot_active_score_int
        @fitbit_avg_life_active_score = @ivolveindex.iv_fitbit_life_tot_active_score
        @fitbit_best_tot_active_score_int = @fitbit_auth_user.best_tot_active_score_int
        @fitbit_avg_best_active_score = @ivolveindex.iv_fitbit_best_tot_active_score
        @fitbit_best_tot_active_date = @fitbit_auth_user.best_tot_active_score_date
        @fitbit_lifetime_tot_cal_out_int = @fitbit_auth_user.lifetime_tot_cal_out_int
        @fitbit_avg_life_cal_out = @ivolveindex.iv_fitbit_life_tot_cal_out
        @fitbit_best_tot_cal_out_int = @fitbit_auth_user.best_tot_cal_out_int
        @fitbit_avg_best_cal_out = @ivolveindex.iv_fitbit_best_tot_cal_out
        @fitbit_best_tot_cal_out_date = @fitbit_auth_user.best_tot_cal_out_date
        @fitbit_lifetime_tot_dist_int = @fitbit_auth_user.lifetime_tot_dist_int
        @fitbit_avg_life_tot_dist = @ivolveindex.iv_fitbit_life_tot_dist
        @fitbit_best_tot_dist_int = @fitbit_auth_user.best_tot_dist_int
        @fitbit_avg_best_dist = @ivolveindex.iv_fitbit_best_tot_dist
        @fitbit_best_tot_dist_date = @fitbit_auth_user.best_tot_dist_date
        @fitbit_lifetime_tot_steps_int = @fitbit_auth_user.lifetime_tot_steps_int
        @fitbit_avg_life_tot_steps = @ivolveindex.iv_fitbit_life_tot_steps
        @fitbit_best_tot_steps_int = @fitbit_auth_user.best_tot_steps_int
        @fitbit_avg_best_tot_steps = @ivolveindex.iv_fitbit_best_tot_steps
        @fitbit_best_tot_steps_date = @fitbit_auth_user.best_tot_steps_date
      else
        @fitbit_height_int = 0
        @fitbit_avg_height = @ivolveindex.iv_fitbit_height
        @fitbit_weight_int = 0
        @fitbit_avg_weight = @ivolveindex.iv_fitbit_weight
        @fitbit_stride_length_run_int = 0
        @fitbit_avg_length_run = @ivolveindex.iv_fitbit_stride_length_run
        @fitbit_stride_length_walk_int = 0
        @fitbit_avg_length_walk = @ivolveindex.iv_fitbit_stride_length_walk
        @fitbit_lifetime_tot_active_score_int = 0
        @fitbit_avg_life_active_score = @ivolveindex.iv_fitbit_life_tot_active_score
        @fitbit_best_tot_active_score_int = 0
        @fitbit_avg_best_active_score = @ivolveindex.iv_fitbit_best_tot_active_score
        @fitbit_best_tot_active_date = 0
        @fitbit_lifetime_tot_cal_out_int = 0
        @fitbit_avg_life_cal_out = @ivolveindex.iv_fitbit_life_tot_cal_out
        @fitbit_best_tot_cal_out_int = 0
        @fitbit_avg_best_cal_out = @ivolveindex.iv_fitbit_best_tot_cal_out
        @fitbit_best_tot_cal_out_date = 0
        @fitbit_lifetime_tot_dist_int = 0
        @fitbit_avg_life_tot_dist = @ivolveindex.iv_fitbit_life_tot_dist
        @fitbit_best_tot_dist_int = 0
        @fitbit_avg_best_dist = @ivolveindex.iv_fitbit_best_tot_dist
        @fitbit_best_tot_dist_date = 0
        @fitbit_lifetime_tot_steps_int = 0
        @fitbit_avg_life_tot_steps = @ivolveindex.iv_fitbit_life_tot_steps
        @fitbit_best_tot_steps_int = 0
        @fitbit_avg_best_tot_steps = @ivolveindex.iv_fitbit_best_tot_steps
        @fitbit_best_tot_steps_date = 0
      end
  	end
  end

  def help
  end

  def about
  end

  def contact

  end
  
end
