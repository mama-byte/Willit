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
    @valuables = current_user.valuables
    authorize @valuable
  end

  def send_order_mail
    @user = current_user
    authorize @user
    UserMailer.valuable_email(@user).deliver
    flash[:notice] = "Email has been sent."
    redirect_to valuables_path(@user)
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
    contact = Contact.find(params["valuable"]["contact"])
    @valuable.contact = contact
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
    contact = Contact.find(params["valuable"]["contact"])
    @valuable.contact = contact
    if @valuable.update(valuable_params)
      @valuable.save
      redirect_to @valuable, notice: 'Valuable was updated'
    else
      render :edit
    end
  end

  def destroy
    @valuable = Valuable.find(params[:id])
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
