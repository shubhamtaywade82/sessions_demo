class Users::RegistrationsController < ApplicationController

  before_action :login_required!, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      redirect_to root_path
      flash[:notice] = t('.success')
    else
      render :new
      flash[:alert] = t('.unsuccessful')
    end
  end

  def edit
    @user = user
  end

  def update
    if user.update(user_params)
      redirect_to user_path(@user.id), notice: t('.success')
    else
      flash[:alert] = t('.failure')
      render :edit
    end
  end

  private

  def user
    User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(
      :username,
      :email,
      :password,
      :password_confirmation
    )
  end
end
