class HomeController < ApplicationController
	def index
    @match = Match.order("time").last
    @matches = Match.order("created_at DESC")
    @users = User.order("win_counter_cache DESC")
    if signed_in?
      @statuses_homepage = Status.from_users_followed_by(current_user).order("created_at DESC")
    end

	end

end