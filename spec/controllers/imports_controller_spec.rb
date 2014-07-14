require 'spec_helper'

describe ImportsController do

  before(:all) do
    @user = FactoryGirl.create(:user)
  end

  context 'authentication tests' do
    it_behaves_like 'authenticate user', :get, :import_xml do 
      let(:user) { @user }
      let(:url_params) { nil } 
    end
    it_behaves_like 'authenticate user', :get, :xml_import_errors do 
      let(:user) { @user }
      let(:url_params) { nil } 
    end
    it_behaves_like 'authenticate user', :post, :do_import_xml do 
        let(:user) { @user }
        let(:url_params) { nil } 
    end
  end

end
