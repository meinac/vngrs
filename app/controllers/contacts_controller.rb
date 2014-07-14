class ContactsController < ApplicationController
  before_filter :authenticate_user!
  before_filter :find_contact, only: [:edit, :destroy, :update]
  skip_before_filter :check_xml_import_status, only: [:xml_import_errors]

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
    redirect_to contacts_path(page: params[:page])
  end

  def import_xml
  end

  def do_import_xml
    uploaded = params[:xml_file]
    XmlWorker.perform_async(Hash.from_xml(uploaded.tempfile)["contacts"]["contact"], current_user.id)
    flash[:notice] = "File uploaded successfully. Data is parsing now..."
    redirect_to action: :import_xml
  end

  def xml_import_errors
    @errors = current_user.r_get("xml_import_errors")
    current_user.r_set("xml_import_errors", nil)
    respond_to do |format|
      format.html {}
      format.js {render text: "$('#system_messages').fadeOut();"}
    end
  end

  private
  def sanitized_params
    params.require(:contact).permit(:name, :last_name, :email, :phone)
  end

  def find_contact
    @contact = Contact.find(params[:id])
  end

end
