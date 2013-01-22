class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @new_status = @match.statuses.build
    @statuses = Status.all
  end

  def new
    #binding.pry
    @match = Match.new  do |match|
      match.teams.build do |team|
        team.name = "A"
        team.team_members.build
       # team.users.build
      end
      match.teams.build do |team|
        team.name = "B"
        team.team_members.build
       # team.users.build
      end
    end

    # 2.times do
    #   team = @match.teams.build
    #   1.times { team.users.build }
    # end

  end

  def create
    @match = Match.new(params[:match])
    if @match.save
      redirect_to @match, :notice => "Successfully created match."
    else
      render :action => 'new'
    end
  end

  def edit
    @match = Match.find(params[:id])
  end

  def update
    @match = Match.find(params[:id])
    if @match.update_attributes(params[:match])
      redirect_to @match, :notice  => "Successfully updated match."
    else
      render :action => 'edit'
    end
  end

  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_url, :notice => "Successfully destroyed match."
  end
end
