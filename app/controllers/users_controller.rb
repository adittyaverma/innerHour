class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    debugger
    @tweets = current_user.tweets
  end

end
