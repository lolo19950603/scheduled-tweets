class PasswordsController < ApplicationController
  before_action :require_user_logged_in!
  
  def edit
  end

  def update
    if Current.user.update(password_params)
      redirect_to root_path, notice: "Password updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def password_params
    params.required(:user).permit(:password, :password_confirmation)
  end
end