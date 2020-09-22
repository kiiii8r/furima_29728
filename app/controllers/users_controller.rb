class UsersController < ApplicationController

  def edit
    @user = Users.new
  end

end
