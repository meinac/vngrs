class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :check_xml_import_status


  protected
  def check_xml_import_status
    if user_signed_in? && current_user.r_get("xml_import_errors")
      flash.now[:alert] = "Something went wrong with xml_import! See #{view_context.link_to 'details', xml_import_errors_imports_path} or #{view_context.link_to 'dismiss', xml_import_errors_imports_path, remote: true}".html_safe
    end
  end
end
