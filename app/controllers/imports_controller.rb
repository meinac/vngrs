class ImportsController < ApplicationController
  before_filter :authenticate_user!
  skip_before_filter :check_xml_import_status, only: [:xml_import_errors]

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

end
