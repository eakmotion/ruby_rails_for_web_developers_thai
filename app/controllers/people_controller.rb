class PeopleController < ApplicationController
  def index
    @people = User.other_than current_user
  end
end