class Users::SessionsController < ApplicationController
  before_action :login_required!, except: %i[new create]

  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      login user
      redirect_to root_path
      flash[:notice] = t('.success')
    else
      flash[:alert] = t('.something_wrong')
      render :new
    end
  end

  def destroy
    logout
    redirect_to new_session_path, notice: t('.logged_out')
  end
end
