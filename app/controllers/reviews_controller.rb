class ReviewsController < ApplicationController
  def create
    @review = Review.new(params[:review])
    @match = Match.find(@review.match_id)
    @match.reviews.push(@review)
    @review.user = current_user

    # @status = current_user.statuses.build(params[:status])
    if @review.save
      respond_to do |format|
        format.html { redirect_to '' }
        format.js
      end
    end
  end
end