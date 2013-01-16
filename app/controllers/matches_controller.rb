class MatchesController < ApplicationController
	def show
		@match = Match.find(params[:id])
	end

	def new
		@match = Match.new

	end

	def create
		@match = Match.new(params[:match])

		respond_to do |format|
			if @match.save
				format.html { render action: 'new' }
			else 
				format.html
			end
		end
	end

	def update
		@match = Match.find(params[:id])

		respond_to do |format|
			if @match.update_attributes(params[:match]) 
				format.html { redirect_to @match , notice: 'Successful Updated'}
			else
				format.html { render actio: 'edit' , notice: 'Unsuccess update'}
			end
		end
	end

	def edit
		@match = Match.find(params[:id])
	end


end