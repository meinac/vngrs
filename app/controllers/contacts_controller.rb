class ContactsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @contacts = current_user.contacts.page(params[:page]).per(30)
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

  end

  def destroy

  end

  def import_xml

  end

  private
  def sanitized_params
    params.require(:contact).permit(:name, :last_name, :email, :phone)
  end

end
