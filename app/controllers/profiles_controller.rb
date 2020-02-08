class ProfilesController < ApplicationController
  def show
    @user = current_user
    authorize @user
  end

  def send_order_mail
    @user = current_user
    authorize @user
    UserMailer.datasend(@user).deliver
    flash[:notice] = "Email has been sent."
    redirect_to profile_path(@user)
  end

  def edit
    @user = current_user
    authorize @user
  end

  def update
    @user = current_user
    authorize @user
    @user.update(user_params)
    @progress = helpers.profile_progress
     if @user.save
      redirect_to profile_path
      flash[:success] = "Your Personal Information has been updated. You are #{@progress} % complete"
    else
      render 'edit'
    end
  end

  def progress
   @complete = []
   @complete << current_user.legal_name if !current_user.legal_name.empty?
   @complete << current_user.nickname if !current_user.nickname.empty?
   @complete << current_user.nationality if !current_user.nationality.empty?
   @complete << current_user.pronouns if !current_user.pronouns.empty?
   if @complete.length == 4
    @progress = 100
  elsif @complete.length == 3
    @progress = 75
  elsif @complete.length == 2
    @progress = 50
  elsif @complete.length == 1
    @progress = 25
  end
  return @progress
end

private

def user_params
  params.require(:user).permit(:legal_name, :nickname, :birthdate, :nationality, :pronouns)
end

end
