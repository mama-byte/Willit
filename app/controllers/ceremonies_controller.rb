class CeremoniesController < ApplicationController
  def index
    @ceremonies = Ceremony.where(["user_id = ?", current_user.id])
    @ceremonies = policy_scope(Ceremony)
    # authorize @ceremony
  end

  def new
    @ceremony = Ceremony.new
    authorize @ceremony
  end

  def show
    @ceremony = Ceremony.find(params[:id])
    authorize @ceremony
  end

  def create
    @ceremony = Ceremony.new(ceremony_params)
    @ceremony.user = current_user
    authorize @ceremony
    if @ceremony.save
      redirect_to ceremonies_path, notice: 'You created a ceremony'
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
    if @ceremony.update(ceremony_params)
      authorize @ceremony
      redirect_to ceremonies_path, notice: 'You updated your ceremony details'
    else
      render 'edit'
    end
  end

  def destroy
    @ceremony = Ceremony.find(params[:id])
    @ceremony.destroy
    authorize @ceremony
    redirect_to ceremonies_path, notice: 'You removed your ceremony'
  end

  private

  def ceremony_params
    params.require(:ceremony).permit(
      :ceremony_type, :burial_type,
      :details, :epitaph, :venue, :funeral_home,
      :press_release, :speaker_id, :music_selector_id
    )
  end
end
