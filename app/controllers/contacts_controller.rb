class ContactsController < ApplicationController
  def index
    @contacts = policy.scope(Contact)
  end

  def new
    @contact = Contact.new
    authorize @contact
  end

  def create
    @contact = Contact.new(contact_path)
    @contact.user = current.user
    authorize @contact
    if @contact.save
      redirect_to @contact, notice: 'Your Relation was saved'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Your Relation was updated'
    else
      render :edit
    end
  end

  def destroy
    @contact.destroy
    redirect_to contact_url, notice: 'Your Relation was removed'
  end

  private

  def contact_params
    params.require(:contact).permit(:first_name, :last_name, :email, :relationship, :phone_number)
end
