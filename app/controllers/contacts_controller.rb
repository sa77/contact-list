class ContactsController < ApplicationController
  # hooks
  before_action :set_contact, only: [:show, :edit, :update, :destroy]

  # utilities
  add_breadcrumb "index", :contacts_path

  # GET /contacts
  def index
    @contacts = Contact.all
  end

  # GET /contacts/1
  def show
    add_breadcrumb "show", contact_path(@contact)
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
    add_breadcrumb "new", :new_contact_path
  end

  # GET /contacts/1/edit
  def edit
    add_breadcrumb "edit-#{@contact.permalink}", edit_contact_path(@contact)
  end

  # POST /contacts
  def create
    @contact = Contact.new(contact_params)

    if @contact.save
      redirect_to @contact, notice: 'Contact was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /contacts/1
  def update
    if @contact.update(contact_params)
      redirect_to @contact, notice: 'Contact was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /contacts/1
  def destroy
    @contact.destroy
    redirect_to contacts_url, notice: 'Contact was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :email, :mobile, :home_phone, :office_phone, :street_address, :city, :state, :country, :permalink)
    end
end
