class MatchesController < ApplicationController
  def index
    @matches = Match.all
  end

  def show
    @match = Match.find(params[:id])
    @new_status = Status.new(:match_id => @match.id) #@match.statuses.build
    @statuses = Status.where(:match_id => @match.id).order("created_at desc")
  end

  def new
    @match = Match.new
    2.times do |i|
      team = @match.teams.build
      team.team_members.build
      team.generate_name(i)
    end
  end

  def create
    #binding.pry
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
