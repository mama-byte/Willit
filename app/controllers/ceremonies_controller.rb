class CeremoniesController < ApplicationController
  def new
    @ceremony = Ceremony.new
    authorize @ceremony
  end

  def show
  end

  def index
    @ceremony = policy_scope(Ceremony)
  end

  def create
    @ceremony = Ceremony.new(ceremony_params)
    @ceremony.user = current_user
    authorize @ceremony
    if @ceremony.save
      redirect_to @ceremony, notice: 'You created a ceremony'
    else
      render :new
    end
  end

  def update
    if @ceremony.update(ceremony_params)
      redirect_to @ceremony, notice: 'You updated your ceremony details'
    else
      render :edit
    end
  end

  def destroy
    @ceremony.destroy
    redirect_to ceremony_url, notice: 'You removed your ceremony'
  end

  private

  def ceremony_params
    params.require(:ceremony).permit(:ceremony_type, :burial_type, :details, :epitaph, :venue, :press_release, :speaker_id, :music_selector_id)
  end
end
