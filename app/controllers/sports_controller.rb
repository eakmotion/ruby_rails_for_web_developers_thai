class SportsController < ApplicationController

  def new
    @sport = Sport.new

    respond_to do |format|
      format.html
    end
  end

  def create
    @sport = Sport.new(params[:sport])

    respond_to do |format|
      if @sport.save
        format.html { redirect_to @sport }
      else
        format.html { render action: "new" }
      end
    end
  end

end