class StatusesController < ApplicationController
  def create
    @status = Status.new(params[:status])
    @match = Match.find(@status.match_id)
    @match.statuses.push(@status)
    @status.user = current_user

    # @status = current_user.statuses.build(params[:status])
    if @status.save
      respond_to do |format|
        format.html { redirect_to '' }
        format.js
      end
    end
  end
end