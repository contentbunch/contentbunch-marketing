class ContactsController < ApplicationController

  before_action :set_contact, only: [:show, :destroy]
  layout 'blank', only: [:index, :show]

  def index
    @contacts = Contact.all
  end

  def show
    @contact.update(is_read: true)
  end

  def create
    @contact = Contact.new(contact_params)
    @contact.save

    respond_to do |format|
      format.js
    end
  end

  def destroy
    respond_to do |format|
      if @contact.destroy
        format.html { redirect_to contacts_path, notice: 'Contact has been deleted successfully' }
      else
        format.html { redirect_to contacts_path, alert: 'Unable to delete the contact' }
      end
    end
  end

  private

  def set_contact
    @contact = Contact.find_by_id(params[:id])
  end

  def contact_params
    params.require(:contact).permit(:name, :email, :message)
  end

end
