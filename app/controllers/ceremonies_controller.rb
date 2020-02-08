class CeremoniesController < ApplicationController
  before_action :set_ceremonies, only: [:show, :edit, :update, :destroy]

  def index
    @ceremony = current_user.ceremony
    @ceremony = policy_scope(Ceremony).last
  end

  def new
    @user = current_user
    if check_record
      @ceremony = Ceremony.new
    else
      flash[:error] = "You've already created a ceremony"
    end
    authorize @ceremony
  end

  def show
    @ceremony = Ceremony.find(params[:id])
    authorize @ceremony
  end

  def create
    @ceremony = Ceremony.new(ceremony_params)
    @ceremony.user = current_user
    @user = current_user
    authorize @ceremony
    @progress = helpers.ceremony_progress
    if @ceremony.save
      redirect_to ceremonies_path
      flash[:success] = "Your Ceremony has been created. You are #{@progress}% complete"
    else
      render 'new'
    end
  end

  def edit
    @ceremony = Ceremony.find(params[:id])
    authorize @ceremony
  end

  def update
    @ceremony = Ceremony.find(params[:id])
    @progress = helper.ceremony_progress
    if @ceremony.update(ceremony_params)
      authorize @ceremony
      redirect_to ceremonies_path
      flash[:success] = "Your Ceremony has been updated. You are #{@progress}% complete"
    else
      render 'edit'
    end
  end

  def destroy
    # raise
    @ceremony = Ceremony.find(params[:id])
    authorize @ceremony
    @ceremony.destroy
    redirect_to ceremonies_path, notice: 'You removed your ceremony'
  end

  private

  def check_record
    @user.ceremony == nil
  end

  def set_ceremonies
    @ceremony = Ceremony.find(params[:id])
  end

  def ceremony_params
    params.require(:ceremony).permit(
      :ceremony_type, :burial_type,
      :details, :epitaph, :venue, :funeral_home,
      :press_release, :speaker_id, :music_selector_id
    )
  end
end
