class ProductsController < ApplicationController
  before_action :redirect_root, except: :edit

  def index
  end

  def edit
  end

  private

def redirect_root
  redirect_to root_path unless user_signed_in?
end

end
