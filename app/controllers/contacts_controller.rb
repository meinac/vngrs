class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_contact, only: [:edit, :destroy, :update]

  def index
    @search = Contact.search(params[:q])
    @contacts = @search.result.page(params[:page]).per(20)
  end

  def new
    @contact = current_user.contacts.build
  end

  def create
    @contact = current_user.contacts.build(sanitized_params)
    if @contact.save
      flash[:success] = "Contact created successfully"
      return redirect_to action: :index
    end
    render :new
  end

  def edit
  end

  def update
    if @contact.update_attributes(sanitized_params)
      flash[:success] = "Contact updated successfully"
      return redirect_to contacts_path
    end
    render :edit
  end

  def destroy
    if @contact.destroy
      flash[:success] = "Contact removed successfully"
    else
      flash[:success] = "Contact could not be removed"
    end
    redirect_to contacts_path(page: params[:page], q: params[:q])
  end

  private
  def sanitized_params
    params.require(:contact).permit(:name, :last_name, :email, :phone)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

end
