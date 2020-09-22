class UsersController < ApplicationController

  def create
    @user = Users.new
  end
  
end
