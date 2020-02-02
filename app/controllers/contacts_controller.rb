class ContactsController < ApplicationController
  def index
    # need to add the sql query to make sure that only the contacts related to the user are returned.
    @contacts = Contact.where(["user_id = ?", current_user.id])
  end

  def new
    @contact = Contact.new
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.user = current_user
    if @contact.save
      redirect_to contacts_path, notice: 'Contact was saved'
    else
      render 'new'
    end
  end

  def edit
    @contact = Contact.find(params[:id])
  end

  def update
    @contact = Contact.find(params[:id])
    if @contact.update(contact_params)
      @contact.save
      redirect_to contacts_path, notice: 'Relation was updated'
    else
      render 'edit'
    end
  end

  def destroy
    @contact = Contact.find(params[:id])
    @contact.destroy
    redirect_to contacts_path
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :is_executor, :relationship, :email, :release_code, :phone_number, :user_id)
  end
end
