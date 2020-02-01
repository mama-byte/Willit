class ProfilesController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    @user.update(user_params)
    if @user.save
      redirect_to profile_path
    else
      render 'edit'
    end
  end

  private

  def user_params
    params.require(:user).permit(:legal_name, :nickname, :birthdate, :nationality, :pronouns)
  end
end
