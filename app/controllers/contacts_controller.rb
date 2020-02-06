class ContactsController < ApplicationController
  helper_method :progress, :executor_set

  def index
    # need to add the sql query to make sure that only the contacts related to the user are returned.
    @contacts = Contact.where(["user_id = ?", current_user.id])
    @contacts = policy_scope(Contact)
    executor_set?
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    authorize @contact
    progress
    if @contact.save
      redirect_to contacts_path
      flash[:notice] = "Your Personal Information has been updated. You are #{@progress} % complete"
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
    authorize @contact
  end

  def update
    @contact = Contact.find(params[:id])
    authorize @contact
    if @contact.update(contact_params)
      @contact.save
      redirect_to contacts_path, notice: 'Relation was updated'
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    authorize @contact
    @contact.destroy
    redirect_to contacts_path
  end

  def progress
    @contacts = Contact.where(["user_id = ?", current_user.id])
    @progress = 0
    if @contacts.count >= 5
      @progress = 100
    elsif @contacts.count == 4
      @progress = 75
    elsif @contacts.count == 3
      @progress = 50
    elsif @contacts.count == 2
      @progress = 25
    end
  end

  def executor_set?
    @contacts = Contact.where(["user_id = ?", current_user.id])
    @executor = false
    @contacts.each do |contact|
     !contact.is_executor.nil? ? @executor = true : @executor = false
    end
    return @executor
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :is_executor, :relationship, :email, :release_code, :phone_number, :user_id)
  end
end
