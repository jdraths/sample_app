class SessionsController < ApplicationController

	def new
		# @new_session_user = current_user
		# below is the wrong way to call a variable in a string...?
		# also it simply reports when a user visits the sign_in page, not when they've actually signed_in.
		# Rollbar.report_message("#{@new_session_user} just signed_in.")
	end

	def create
		#raise env['omniauth.auth'].to_yaml
		@authorization = Authorization.from_omniauth(auth)
	    
	 #     This if should no longer be necessary.
	 #    if @authorization.nil?
	      # If no authorization was found, create a new one here
	 #      @authorization = Authorization.create_from_omniauth(auth)
	    #else
	    	#@credentials = Authorization.credentials_from_omniauth(auth)
	    	#@credentials.save!
	 #    end

		if signed_in?
			# check if facebook is expired...
			if @authorization.user == current_user && facebook_expired?
				@authorization.expired_token = false
				@authorization.save
				flash[:success] = "Your account has been updated."
				redirect_to root_path
			elsif @authorization.user == current_user
				
				# User is signed in so they are trying to link an authorization with their
		        # account. But we found the authorization and the user associated with it 
		        # is the current user. So the authorization is already associated with 
		        # this user. So let's display an error message.
				# Log the authorizing user in.
				flash[:success] = "you have already linked this account."
				redirect_to root_path
			else
				# The authorization is not associated with the current_user so lets 
		        # associate the authorization
		        @authorization.user = current_user
		        @authorization.save
		        flash[:success] = "Account successfully authenticated."
		        redirect_to root_path
		    end

		else # no user is signed_in
		    if @authorization.user.present?
		        # The authorization we found had a user associated with it so let's 
		        # just log them in here
		        self.current_user = @authorization.user
		        flash[:success] = "Signed in!"
		        redirect_to root_path 
		    else
		        # The authorization has no user assigned and there is no user signed in
		        # Our decision here is to create a new account for the user
		        # But your app may do something different (eg. ask the user
		        # if he already signed up with some other service)
		       	if @authorization.provider == 'identity'
		          u = User.find(@authorization.uid)
		          # If the provider is identity, then it means we already created a user
		          # So we just load it up
		        else
		          # otherwise we have to create a user with the auth hash
		          u = User.create_from_omniauth(auth)
		          Rollbar.report_message("A new user has been created via SessionsController User.create_from_omniauth method!")
		          # This method will only save user name... never used right now.
		          # NOTE: we will handle the different types of data we get back
		          # from providers at the model level in create_from_omniauth
		        end
		        # We can now link the authorization with the user and log him in
		        u.authorizations << @authorization
		        self.current_user = u
		        flash[:success] = "Welcome to iVolve!"
		        redirect_to root_path
		    end
		end
# ONLY RUN API REQUESTS if No Authorization exists, AKA IF NEW USER.
# methods defined in sessions_helper
	    if linkedin_authorized?
	    	unless linkedin?
	    		LinkedinUser.pull_user_data(current_user)
	    	end
	    end

	    if twitter_authorized? # runs if twitter_auth exists
	    	unless twitter? # runs if no TwitterUser has been saved
				TwitterUser.pull_user_data(current_user)
			end
		end

		if facebook_authorized? # runs if facebook_auth exists
			unless facebook? # runs if no FacebookUser has been saved
				FacebookUser.pull_user_data(current_user)
			end
		end

		if instagram_authorized?
			unless instagram?
				InstagramUser.pull_user_data(current_user)
			end
		end

		if foursquare_authorized?
			unless foursquare?
				FoursquareUser.pull_user_data(current_user)
			end
		end

		if fitbit_authorized?
			unless fitbit?
				FitbitUser.pull_user_data(current_user)
			end
		end
			# This the native Login.  
			#		user = User.find_by(email: params[:session][:email].downcase)
			#		if user && user.authenticate(params[:session][:password])
						# Sign the user in and redirect to the user's show page.
			#			sign_in user
			#			redirect_back_or user
			#		else
						# Create an error message and re-render the signin form.
			#			flash.now[:error] = 'Invalid email/password combination' 
			#			render 'new'
			#		end
	end

	def destroy
		session[:user_id] = nil
		flash[:success] = "Signed out."
		redirect_to root_path

# This is native		
#		sign_out
#		redirect_to root_url
	end

	def failure
		flash[:error] = "Authentication failed, please try again."
		redirect_to signin_path
	end

	protected

	def auth
		request.env['omniauth.auth']
	end
end
