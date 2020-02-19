class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @disable_back = true
    @disable_logout = true
  end

  def dashboard
   @user = current_user
   @disable_back = true
  end
end
