class StatusesController < ApplicationController
  def create
    @status = Status.new(params[:status])
    @match = Match.find(@status.match_id)
    @match.statuses.push(@status)
    @status.user = current_user

    if @status.save
      respond_to do |format|
        format.html { redirect_to '' }
        format.js
      end
    end
  end
end