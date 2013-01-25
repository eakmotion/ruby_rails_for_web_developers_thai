class HomeController < ApplicationController
	def index
    @match = Match.last
    @matches = Match.all
    @statuses_homepage = Status.all
    @users = User.all
    #@users = User.teams.where(result => 'win').count
	end

end