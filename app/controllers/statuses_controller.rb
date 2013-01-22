class StatusesController < ApplicationController
  def create
    @status = current_user.statuses.build(params[:status])
    if @status.save
      respond_to do |format|
        format.html { redirect_to @match }
      end
    end
  end
end