class ValuablesController < ApplicationController
  before_action :set_valuables, only: [:show, :edit, :update, :destroy]

  def index
    @valuables = policy_scope(Valuable)
  end

  def items
    @category = params[:category]
    # @valuables = Valuable.all
    @valuables = policy_scope(Valuable)
    authorize @valuables
  end

  def show
    @valuables = Valuable.all
    authorize @valuable
  end

  def new
    @valuable = Valuable.new
    authorize @valuable
    @category = params[:category]
    @item = params[:item]
  end

  def create
    @valuable = Valuable.new(valuable_params)
    @valuable.user = current_user
    authorize @valuable
    if @valuable.save
      redirect_to valuable_path(@valuable), notice: 'Valuable was saved'
    else
      render :new
    end
  end

  def edit
    authorize @valuable
  end

  def update
    authorize @valuable
    if @valuable.update(valuable_params)
      @valuable.save
      redirect_to @valuable, notice: 'Valuable was updated'
    else
      render :edit
    end
  end

  def destroy
    authorize @valuable
    @valuable.destroy
    redirect_to valuables_path, notice: 'Valuable was removed'
  end

  private

  def set_valuables
    @valuable = Valuable.find(params[:id])
  end

  def valuable_params
    params.require(:valuable).permit(:title, :image_url, :value, :description, :photo, :category, :item)
  end
end