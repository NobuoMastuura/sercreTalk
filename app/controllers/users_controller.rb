class UsersController < ApplicationController

  def show
    @name = current_user
    @post = current_user.posts.order("id DESC").page(params[:page]).per(7)
  end

end
