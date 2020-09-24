class ProductsController < ApplicationController
  before_action :require_login, only: :new, alert: 'You need to sign in or sign up before continuing.'

  def index
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  private

def require_login
  redirect_to user_session_path, alert: 'You need to sign in or sign up before continuing.' unless user_signed_in?
end

end
