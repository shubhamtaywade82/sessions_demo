class UsersController < ApplicationController

  before_action :correct_user, only: :show

  def index
    @users = User.all
  end

  def show
    @user = user
  end

  private

  def user
    User.find(params[:id])
  end

  def correct_user
    return if current_user == user

    redirect_to root_url, notice: t('.not_authorized')
  end
end
